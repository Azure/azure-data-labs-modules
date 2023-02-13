output "id" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].id : ""
  )
}