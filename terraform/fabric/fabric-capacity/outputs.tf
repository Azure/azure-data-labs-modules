output "id" {
  value = (
    length(azapi_resource.fab_capacity) > 0 ?
    azapi_resource.fab_capacity[0].id : ""
  )
  description = "Resource identifier of the instance of Fabric Capacity."
}