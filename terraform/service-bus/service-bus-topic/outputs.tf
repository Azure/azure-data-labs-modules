output "id" {
  value = (
    length(azurerm_servicebus_topic.adl_sbt) > 0 ?
    azurerm_servicebus_topic.adl_sbt[0].id : ""
  )
}