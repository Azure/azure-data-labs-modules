output "id" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].id : ""
  )
  description = "Resource identifier of the instance of Stream Analytics job."
}

output "name" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].name : ""
  )
  description = "The name of the Stream Analytics job."
}

output "resource_group_name" {
  value = (
    length(azurerm_stream_analytics_job.adl_asa) > 0 ?
    azurerm_stream_analytics_job.adl_asa[0].resource_group_name : ""
  )
  description = "Resource Group where the Stream Analytics job exists."
}