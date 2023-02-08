output "id" {
	value =(
		length(azurerm_application_insights.adl_appi) > 0 ?
		azurerm_application_insights.adl_appi[0].id : ""
	)
}

output "instrumentation_key" {
	value =(
		length(azurerm_application_insights.adl_appi) > 0 ?
		azurerm_application_insights.adl_appi[0].instrumentation_key : ""
	)
	sensitive = true
}

output "name" {
	value =(
		length(azurerm_application_insights.adl_appi) > 0 ?
		azurerm_application_insights.adl_appi[0].name : ""
	)
}

output "resource_group_name" {
	value =(
		length(azurerm_application_insights.adl_appi) > 0 ?
		azurerm_application_insights.adl_appi[0].resource_group_name : ""
	)
}