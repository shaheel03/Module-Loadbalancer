data "azurerm_resource_group" "datarg" {
  name = "lb-rg"
}



data "azurerm_public_ip" "datapip" {
  name                = "lb-pip1"
  resource_group_name = data.azurerm_resource_group.datarg.name
}


data "azurerm_virtual_network" "datavnet" {
  name                = "lb-vnet"
  resource_group_name = data.azurerm_resource_group.datarg.name
}

data "azurerm_virtual_machine" "datavm" {
  for_each = var.blip
  name                = each.value.vm
  resource_group_name = data.azurerm_resource_group.datarg.name
}
