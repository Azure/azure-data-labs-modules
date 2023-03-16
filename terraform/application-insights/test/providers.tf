terraform {
  backend "azurerm" {
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadlterraformstate"
    container_name       = "default"
    key                  = "applicationinsights.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.47.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      # This flag is set to mitigate the issue described in:
      #    https://github.com/hashicorp/terraform-provider-azurerm/issues/18026
      #    https://feedback.azure.com/d365community/idea/cdb1fc68-bb4f-ed11-a81b-000d3adfeb99
      #    https://github.com/hashicorp/terraform-provider-azurerm/issues/16124
      # Meanwhile, we must set this flag on each and every configuration which deploys,
      # directly or indirectly, a resource of type azurerm_application_insights. 
      prevent_deletion_if_contains_resources = false
    }
  }
}