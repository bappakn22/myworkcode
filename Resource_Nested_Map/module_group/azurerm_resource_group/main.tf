
resource "azurerm_resource_group" "rg-group" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
}
