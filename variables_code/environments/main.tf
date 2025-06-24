
module "resource_group" {
  source = "../modules/azurerm_resource_group"
#   rg_name = var.rg-names
}


# module "storage_account" {
#   source     = "../modules/azurerm_storage_account"
#   depends_on = [module.resource_group]
#   rg-name = var.rg-names
#   stg-name = var.stg-names
# }