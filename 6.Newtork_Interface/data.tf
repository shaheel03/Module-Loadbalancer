data "azurerm_resource_group" "datarg" {
name = "lb-rg"
  
}
 data "azurerm_subnet" "datasubnet" {
    for_each = var.nic  
    name                 = each.value.sname
  virtual_network_name = "lb-vnet"
  resource_group_name  = data.azurerm_resource_group.datarg.name
 }


#  data "azurerm_public_ip" "datapip" {
#     for_each = var.nic
#   name                = each.value.pipname
#   resource_group_name = data.azurerm_resource_group.datarg.name
# }