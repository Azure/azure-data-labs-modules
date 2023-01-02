output "name" {
  value = (
    length(azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra) > 0 ?
    azurerm_cosmosdb_cassandra_keyspace.adl_cosmos_cassandra[0].name : ""
  )
}