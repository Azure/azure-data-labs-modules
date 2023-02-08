output "id" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].resource_group_name : ""
  )
}