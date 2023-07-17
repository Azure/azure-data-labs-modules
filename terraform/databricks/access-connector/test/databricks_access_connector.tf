module "access_connector_system_identity" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}

module "access_connector_user_identity" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  identity_ids        = [azurerm_user_assigned_identity.example.id]
  tags                = {}
}

resource "azurerm_user_assigned_identity" "example" {
  location            = var.location
  name                = "uami-${random_string.postfix.result}"
  resource_group_name = module.local_rg.name
  tags                = {}
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}
