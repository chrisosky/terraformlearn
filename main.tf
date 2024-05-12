terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "testrg" {
   name     = "testing1-rg"
   location = "UK South"
 }

 resource "azurerm_virtual_network" "testvnet" {
   name                = "testing-1vnet"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.testrg.location
   resource_group_name = azurerm_resource_group.testrg.name
 }
 resource "azurerm_subnet" "testsubnet" {
   name                 = "testing1-sub"
   resource_group_name  = azurerm_resource_group.testrg.name
   virtual_network_name = azurerm_virtual_network.testvnet.name
   address_prefixes     = ["10.0.2.0/24"]
 }