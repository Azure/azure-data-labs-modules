terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadlterraformstate"
    container_name       = "default"
    key                  = "databricks.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.67.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "= 1.10.1"
    }
  }
}

provider "azurerm" {
  features {}
}