resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name                = each.value.name
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name

  dynamic "security_rule" {
    for_each = var.security
    content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = security_rule.value.source_port_range
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
    
  }

}