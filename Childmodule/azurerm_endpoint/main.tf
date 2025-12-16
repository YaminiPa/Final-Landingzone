variable "privatendpoint" {}



data "azurerm_resource_group" "rg" {
    for_each = var.privatendpoint
    name = "example-resources"
}

data "azurerm_virtual_network" "vnet" {
    for_each = var.privatendpoint
  name                = "example-network"
  resource_group_name = data.azurerm_resource_group.example.name
}

data "azurerm_subnet" "subnet" {
  for_each = var.privatendpoint
  name                 = "default"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.example.name
}

resource "azurerm_private_endpoint" "example" {
  name                = "example-endpoint"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                              = "example-privateserviceconnection"
    private_connection_resource_alias = "example-privatelinkservice.d20286c8-4ea5-11eb-9584-8f53157226c6.centralus.azure.privatelinkservice"
    is_manual_connection              = true
    request_message                   = "PL"
  }
}