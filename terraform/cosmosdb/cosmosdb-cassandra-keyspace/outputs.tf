output "id" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB Cassandra keyspace."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].name : ""
  )
  description = "The name of the CosmosDB Cassandra keyspace."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB Cassandra keyspace exists."
}