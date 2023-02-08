output "id" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_linux_function_app.adl_func_linux) > 0 ?
    azurerm_linux_function_app.adl_func_linux[0].resource_group_name : ""
  )
}