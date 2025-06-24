variable "nic_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "vm_name" {
  type = string
  }

variable "admin_username" {
  type = string
  
}
variable "admin_password" {
  type = string
  
}



variable "network_security_group_id" {
  type        = string
  description = "ID of NSG to associate with NIC"
}

variable "subnet_name" {}

variable "virtual_network_name" {}
variable "pip_name" {}