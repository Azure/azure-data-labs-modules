terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadltfstate"
    container_name       = "default"
    key                  = "sqlmi.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.41.0"
    }
  }

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}