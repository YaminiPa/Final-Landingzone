resource "azurerm_network_security_group" "NSG" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

  security_rule {
    name                       = each.value.security_rule.name
    priority                   = each.value.security_rule.priority
    direction                  = each.value.security_rule.direction
    access                     = each.value.security_rule.access
    protocol                   = each.value.security_rule.protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

#   tags = {
#     environment = "Production"
#   }
}

variable "nsg" {
  
}
