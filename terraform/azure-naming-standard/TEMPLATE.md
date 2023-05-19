# Naming Standard repo

## Synopsis

This module is intended to provide consistent and standardised naming of Azure resources, to be referenced across all implementations of Azure terraform code.

## Usage 

Add the Naming Standardisation Module used to generate/reference resource names:

```
   	module "names" {
       source                             = "XXX"
       env                                = var.ARM_ENVIRONMENT
       location                           = var.ARM_LOCATION
       subId                              = var.ARM_SUBSCRIPTION_ID
   }
```

   Example reference: `module.names.standard["log-analytics-workspace"]`