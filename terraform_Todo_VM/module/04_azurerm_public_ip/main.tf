resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  
}

output "id" {
  value = azurerm_public_ip.example.id
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}