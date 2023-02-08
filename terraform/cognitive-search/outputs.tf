output "id" {
	value =(
		length(azurerm_search_service.adl_srch) > 0 ?
		azurerm_search_service.adl_srch[0].id : ""
	)
}

output "name" {
	value =(
		length(azurerm_search_service.adl_srch) > 0 ?
		azurerm_search_service.adl_srch[0].name : ""
	)
}

output "resource_group_name" {
	value =(
		length(azurerm_search_service.adl_srch) > 0 ?
		azurerm_search_service.adl_srch[0].resource_group_name : ""
	)
}