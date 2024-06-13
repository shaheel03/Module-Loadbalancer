resource "azurerm_public_ip" "pip" {
    for_each = var.pip
  name                = each.value.name
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name
  allocation_method   = "Static"
  sku="Standard"
}

