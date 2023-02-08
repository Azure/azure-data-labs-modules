# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted

resource "azurerm_data_factory_integration_runtime_self_hosted" "adl_adf_shir" {
  name            = "adf-shir-${var.basename}"
  data_factory_id = var.data_factory_id
}

module "virtual_machine" {
  source            = "../../virtual-machine"
  basename          = var.basename
  rg_name           = var.rg_name
  location          = var.location
  subnet_id         = var.subnet_id
  jumphost_username = "ialonso"
  jumphost_password = "ThisIsNotVerySecure!"
  tags              = {}
}

module "storage_account" {
  source        = "../../storage-account"
  basename      = var.basename
  rg_name       = var.rg_name
  location      = var.location
  is_sec_module = true
}

resource "azurerm_storage_container" "scripts_container" {
  name                  = "scripts"
  storage_account_name  = module.storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "powershell_script_blob" {
  name                   = "gatewayInstall.ps1"
  storage_account_name   = module.storage_account.name
  storage_container_name = azurerm_storage_container.scripts_container.name
  type                   = "Block"
  source                 = "${path.module}/gatewayInstall.ps1"
}

resource "azurerm_virtual_machine_extension" "adl_adf_shir_vm_extension" {
  name                 = "SelfHostedIntegrationRuntime"
  virtual_machine_id   = module.virtual_machine.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings             = <<SETTINGS
    {
      "fileUris": ["${azurerm_storage_blob.powershell_script_blob.url}"]
    }
SETTINGS
  protected_settings   = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File gatewayInstall.ps1 ${azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir.primary_authorization_key}",
      "storageAccountName": "${module.storage_account.name}",
      "storageAccountKey": "${module.storage_account.access_key}"
    }
  PROTECTED_SETTINGS
}

provider "azurerm" {
  features {}
}