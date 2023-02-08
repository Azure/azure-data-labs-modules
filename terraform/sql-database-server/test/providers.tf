terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadltfstate"
    container_name       = "default"
    key                  = "sqldatabaseserver.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.42.0"
    }
  }
}

provider "azurerm" {
  features {}
}