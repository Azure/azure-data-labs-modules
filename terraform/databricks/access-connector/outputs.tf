output "id" {
  value = (
    length(azurerm_databricks_access_connector.adl_adb_access_connector) > 0 ?
    azurerm_databricks_access_connector.adl_adb_access_connector[0].id : null
  )
  description = "The ID of the Databricks Access Connector in the Azure management plane."
}

output "identity" {
  value = (
    length(azurerm_databricks_access_connector.adl_adb_access_connector) > 0 ?
    azurerm_databricks_access_connector.adl_adb_access_connector[0].identity : null
  )
  description = "A list of identity blocks containing the system-assigned managed identities."
}