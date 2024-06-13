resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.datarg.name
  virtual_network_name = data.azurerm_virtual_network.datavnet.name
  address_prefixes = [each.value.address_prefixes]
  
}