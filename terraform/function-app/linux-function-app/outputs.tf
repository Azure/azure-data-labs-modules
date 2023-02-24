output "id" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].id : ""
  )
  description = "Resource identifier of the instance of Linux Function."
}

output "name" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].name : ""
  )
  description = "The name of the Linux Function."
}

output "resource_group_name" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].resource_group_name : ""
  )
  description = "Resource Group where the Linux Function exists."
}