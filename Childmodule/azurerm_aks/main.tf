resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}
variable "aks" {
  type = map(object({
    name       = string
    location   = string
    rgname     = string
    dns_prefix = string
  }))
}

variable "default_node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
  })
}
