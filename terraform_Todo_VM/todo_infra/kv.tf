data "azurerm_key_vault" "kv" {
  name                = "anikv003"
  resource_group_name = "ani_keyvault"
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}