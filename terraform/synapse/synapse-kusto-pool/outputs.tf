output "id" {
  value = (
    length(azapi_resource.syn_synkp) > 0 ?
    azapi_resource.syn_synkp[0].id : ""
  )
  description = "Resource identifier of the instance of Synapse Kusto Pool."
}