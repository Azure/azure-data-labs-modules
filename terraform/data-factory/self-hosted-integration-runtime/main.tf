# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted

resource "azurerm_data_factory_integration_runtime_self_hosted" "adl_adf_shir" {
  name            = "adf-shir-${var.basename}"
  data_factory_id = var.data_factory_id

  count = var.module_enabled ? 1 : 0
}

module "virtual_machine" {
  source            = "../../virtual-machine"
  basename          = var.basename
  rg_name           = var.rg_name
  location          = var.location
  subnet_id         = var.subnet_id
  jumphost_username = "ialonso"
  jumphost_password = "ThisIsNotVerySecure!"
  storage_image_reference = {
    publisher : "MicrosoftWindowsServer",
    offer : "WindowsServer",
    sku : "2019-datacenter-gensecond",
    version : "latest"
  }
  tags = {}

  count = var.module_enabled ? 1 : 0
}

module "storage_account" {
  source                    = "../../storage-account"
  basename                  = var.basename
  rg_name                   = var.rg_name
  location                  = var.location
  subnet_id                 = var.subnet_id
  is_sec_module             = true
  private_dns_zone_ids_blob = [module.local_pdnsz_st_blob[0].list[local.dns_st_blob].id]
  firewall_ip_rules         = [data.http.ip.response_body]
  tags                      = {}

  count = var.module_enabled ? 1 : 0
}

module "local_pdnsz_st_blob" {
  source = "../../private-dns-zone"

  rg_name   = var.rg_name
  dns_zones = [local.dns_st_blob]
  vnet_id   = var.vnet_id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_storage_container" "scripts_container" {
  name                  = "scripts"
  storage_account_name  = module.storage_account[0].name
  container_access_type = "private"

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_storage_blob" "powershell_script_blob" {
  name                   = "gatewayInstall.ps1"
  storage_account_name   = module.storage_account[0].name
  storage_container_name = azurerm_storage_container.scripts_container[0].name
  type                   = "Block"
  source                 = "${path.module}/gatewayInstall.ps1"

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_virtual_machine_extension" "adl_adf_shir_vm_extension" {
  name                 = "SelfHostedIntegrationRuntime"
  virtual_machine_id   = module.virtual_machine[0].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings             = <<SETTINGS
    {
      "fileUris": ["${azurerm_storage_blob.powershell_script_blob[0].url}"]
    }
SETTINGS
  protected_settings   = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File gatewayInstall.ps1 ${azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].primary_authorization_key}",
      "storageAccountName": "${module.storage_account[0].name}",
      "storageAccountKey": "${module.storage_account[0].access_key}"
    }
  PROTECTED_SETTINGS
  depends_on = [
    module.storage_account
  ]

  count = var.module_enabled ? 1 : 0
}

data "http" "ip" {
  url = "https://ifconfig.me"
}