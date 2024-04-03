terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadlterraformstate"
    container_name       = "default"
    key                  = "hdinsighthbase.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.97.1"
    }
  }
}

provider "azurerm" {
  features {}
}