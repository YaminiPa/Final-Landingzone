resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnetname
  name                = each.value.name 
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name 
}

variable "vnetname"{}




# resource "azurerm_network_interface" "main" {
#   name                = "${var.prefix}-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_virtual_machine" "main" {
#   name                  = "${var.prefix}-vm"
#   location              = azurerm_resource_group.example.location
#   resource_group_name   = azurerm_resource_group.example.name
#   network_interface_ids = [azurerm_network_interface.main.id]
#   vm_size               = "Standard_DS1_v2"
# }