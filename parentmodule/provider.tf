terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
    
  features {}
  subscription_id = "b107b989-85d9-4402-94e8-40ae932b8893"
}