output "id" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].resource_group_name : ""
  )
}