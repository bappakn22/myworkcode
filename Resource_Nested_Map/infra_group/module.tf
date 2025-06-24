module "rg-name" {
  source = "../module_group/azurerm_resource_group"
  rg_names = var.rg_names

}

module "stg-name" {
    depends_on = [ module.rg-name ]
    source = "../module_group/azurerm_storage_account"
    rg_names = var.rg_names
    stg_names = var.stg_names
}
  
