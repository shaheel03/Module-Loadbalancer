
resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion-host
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasubnet.id
    public_ip_address_id = data.azurerm_public_ip.datapip.id
  }
}
