resource "azurerm_resource_group" "rgblock" {
    count = 5
    name = "rg-patna" /count.index
    location = "japan east"
}


# resource "azurerm_resource_group" "rgblock2" {
#     name = "kol-rg2"
#     location = "japan east"
# }