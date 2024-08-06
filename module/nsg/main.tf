resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg_map
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  
    for_each = var.nsg_map
  subnet_id                 = data.azurerm_subnet.sub[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}