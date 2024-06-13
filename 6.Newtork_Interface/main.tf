resource "azurerm_network_interface" "nic" {
    for_each = var.nic
  name                = each.value.name
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = data.azurerm_public_ip.datapip[each.key].id
  }
}