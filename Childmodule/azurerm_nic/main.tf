# resource "azurerm_network_interface" "main" {
#   for_each = var.nic
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.azurerm_resource_group

#   dynamic "ip_configuration" {
#     for_each = each.value.ip_configuration
#     content {
#     name                          = ip_configuration.value.name
#     subnet_id                     = ip_configuration.value.subnet_id
#     private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
#   }
#   }

# }

# variable "nic" {
#   type = map(object({
#     name                   = optional(string)
#     location               = optional(string)
#     azurerm_resource_group = optional(string)
#     ip_configuration = optional(list(object({
#       name                          = string
#       subnet_id                     = string
#       private_ip_address_allocation = string
#       # अगर जरूरत हो तो additional fields भी add कर सकते हैं:
#       # private_ip_address = optional(string)
#       # public_ip_address_id = optional(string)
#     })))
#   }))
# }
