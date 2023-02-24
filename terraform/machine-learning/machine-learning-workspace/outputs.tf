output "id" {
  value       = azurerm_machine_learning_workspace.adl_mlw.id
  description = "Resource identifier of the instance of Machine Learning workspace."
}

output "name" {
  value       = azurerm_machine_learning_workspace.adl_mlw.name
  description = "The name of the Machine Learning workspace."
}

output "resource_group_name" {
  value       = azurerm_machine_learning_workspace.adl_mlw.resource_group_name
  description = "Resource Group where the Machine Learning workspace exists."
}
