
# resource "azurerm_storage_account" "stgblock" {
# name = var.stg-name
# resource_group_name = var.rg-name [1]
# location = "japan east"
# account_tier = "Standard"
# account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "conblock" {
#     name                  = "datacontainer"
#   storage_account_id    = azurerm_storage_account.stgblock.id
#   container_access_type = "private"
# }
