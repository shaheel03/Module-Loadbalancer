data "azurerm_resource_group" "datarg" {
    name="lb-rg"
  
}
data "azurerm_virtual_network" "datavnet" {
  
  name                = "lb-vnet"
  resource_group_name = data.azurerm_resource_group.datarg.name
}
