terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-001-tf-state"
    storage_account_name = "stadl001tfstate"
    container_name       = "default"
    key                  = "applicationinsights.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.27.0"
    }
  }

}
provider "azurerm" {
  features {}
}