output "id" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].id : ""
  )
}
