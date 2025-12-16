variable "app_gateways" {
  description = "Map of application gateways to create"
  type = map(object({
    location            = string
    resource_group_name = string
    subnet_id           = string
    sku_name            = string
    sku_tier            = string
    capacity            = number
    frontend_port       = number
    backend_path        = string
  }))
}

