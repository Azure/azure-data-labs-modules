terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadltfstate"
    container_name       = "default"
    key                  = "synapsekustopool.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.41.0"
    }
    azapi = {
      source = "azure/azapi"
    }
  }

}

provider "azurerm" {
  features {}
}

provider "azapi" {
}