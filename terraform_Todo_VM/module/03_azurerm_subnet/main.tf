resource "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

