output "id" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].resource_group_name : ""
  )
}