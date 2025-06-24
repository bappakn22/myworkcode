module "resource_group" {
  source                  = "../module/01_azurerm_resource_group"
  resource_group_name     = "anirg_todo"
  resource_group_location = "japan east"
}

module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../module/02_azurerm_virtual_network"
  virtual_network_name     = "anivnet"
  resource_group_name      = "anirg_todo"
  virtual_network_location = "japan east"
  address_space            = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../module/03_azurerm_subnet"
  azurerm_subnet       = "frontend_subnet"
  resource_group_name  = "anirg_todo"
  virtual_network_name = "anivnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../module/03_azurerm_subnet"
  azurerm_subnet       = "backend_subnet"
  resource_group_name  = "anirg_todo"
  virtual_network_name = "anivnet"
  address_prefixes     = ["10.0.2.0/24"]
}

module "frontend_public_ip" {
  source                  = "../module/04_azurerm_public_ip"
  public_ip_name          = "pip_frontend"
  resource_group_name     = "anirg_todo"
  resource_group_location = "japan east"

}

module "backend_public_ip" {
  source                  = "../module/04_azurerm_public_ip"
  public_ip_name          = "pip_backend"
  resource_group_name     = "anirg_todo"
  resource_group_location = "japan east"

}
module "frontend_vm" {
  depends_on                = [module.frontend_subnet,module.frontend_public_ip]
  source                    = "../module/05_azurerm_vitual_machine"
  vm_name                   = "vm-frontend"
  resource_group_name       = "anirg_todo"
  resource_group_location   = "japan east"
  pip_name                  = "pip_frontend"
  admin_username            = data.azurerm_key_vault_secret.vm_username.value
  admin_password            = data.azurerm_key_vault_secret.vm_password.value
  nic_name                  = "nic_vm_frontend"
  subnet_name               = "frontend_subnet"
  virtual_network_name      = "anivnet"
  network_security_group_id = module.nsg.id
}


module "backend_vm" {
  depends_on                = [module.backend_subnet, module.backend_public_ip]
  source                    = "../module/05_azurerm_vitual_machine"
  vm_name                   = "vm-backend"
  resource_group_name       = "anirg_todo"
  resource_group_location   = "japan east"
  pip_name                  = "pip_backend"
  admin_username            = data.azurerm_key_vault_secret.vm_username.value
  admin_password            = data.azurerm_key_vault_secret.vm_password.value
  nic_name                  = "nic_vm_backend"
  subnet_name               = "backend_subnet"
  virtual_network_name      = "anivnet"
  network_security_group_id = module.nsg.id
}

module "nsg" {
  source                  = "../module/06_azurerm_ssh_nsg"
  nsg_name                = "nsg_ssh"
  resource_group_name     = "anirg_todo"
  resource_group_location = "japan east"
}

module "sql_server" {
  source                       = "../module/06_azurerm_sql_server"
  sql_server_name              = "animssql"
  resource_group_name          = "anirg_todo"
  resource_group_location      = "japan east"
  administrator_login          = "devopsadmin"
  administrator_login_password = "Devops@12345"
}

module "sql_database" {
  depends_on          = [module.sql_server]
  source              = "../module/07_azurerm_sql_database"
  mssql_database_name = "animsdb"
  sql_server_id       = module.sql_server.id
}
