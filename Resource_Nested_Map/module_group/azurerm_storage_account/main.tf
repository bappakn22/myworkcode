resource "azurerm_storage_account" stg-account {
    for_each = var.stg_names
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
}


resource "azurerm_storage_container" "stg-cont" {
    for_each = azurerm_storage_account.stg-account
    name = "emustgcont-${each.key}"
    storage_account_id = each.value.id
  container_access_type = "private"

}