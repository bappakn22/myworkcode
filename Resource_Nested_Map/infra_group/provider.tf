terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "bappa_rg"
    storage_account_name = "bappastrg"
    container_name       = "datacont"
    key                  = "prod.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "ba578ce6-e042-4ed5-9e0b-99d4cc681a62"
  # Configuration options
}
