resource "azurerm_application_security_group" "ASG" {
    for_each = var.asg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

#   tags = {
#     Hello = "World"
#   }
}

variable "asg" {
  
}