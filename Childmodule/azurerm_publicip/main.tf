resource "azurerm_public_ip" "ip" {
    for_each = var.ip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname
  allocation_method   = each.value.allocation_method  
}

variable "ip" {
  description = "Map of public IPs to create"
  type = map(object({
    name                = string
    location            = string
    rgname = string
    allocation_method   = string
  }))
}
