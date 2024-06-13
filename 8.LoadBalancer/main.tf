resource "azurerm_lb" "mylb" {
  name                = var.my_lb
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name
  sku = "Standard"
  frontend_ip_configuration {
    name                 = "my-ipconfig-address"
    public_ip_address_id = data.azurerm_public_ip.datapip.id
  }
}


resource "azurerm_lb_backend_address_pool" "myblb" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = var.blb
}

resource "azurerm_lb_backend_address_pool_address" "myblbpool" {
  for_each = var.blip
  name                    = each.value.name
  backend_address_pool_id = azurerm_lb_backend_address_pool.myblb.id
  virtual_network_id      = data.azurerm_virtual_network.datavnet.id
  ip_address              = data.azurerm_virtual_machine.datavm[each.key].private_ip_address
}

resource "azurerm_lb_probe" "lbprobe" {
  name                = "HealthProbe"
  loadbalancer_id     = azurerm_lb.mylb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 15
  number_of_probes    = 2
}


resource "azurerm_lb_rule" "lbrule" {
  name                           = "HTTPRule"
  loadbalancer_id                = azurerm_lb.mylb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "my-ipconfig-address"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.myblb.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
}