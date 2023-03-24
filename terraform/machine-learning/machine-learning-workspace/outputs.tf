output "id" {
  value = (
    length(azurerm_machine_learning_workspace.adl_mlw) > 0 ?
    azurerm_machine_learning_workspace.adl_mlw[0].id : ""
  )
  description = "Resource identifier of the instance of Machine Learning workspace."
}

output "name" {
  value = (
    length(azurerm_machine_learning_workspace.adl_mlw) > 0 ?
    azurerm_machine_learning_workspace.adl_mlw[0].name : ""
  )
  description = "The name of the Machine Learning workspace."
}

output "resource_group_name" {
  value = (
    length(azurerm_machine_learning_workspace.adl_mlw) > 0 ?
    azurerm_machine_learning_workspace.adl_mlw[0].resource_group_name : ""
  )
  description = "Resource Group where the Machine Learning workspace exists."
}
