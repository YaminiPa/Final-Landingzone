variable "lb" {
  description = "Map of load balancers with frontend IP configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    frontend_ip_configuration = map(object({
      name                 = string
      public_ip_address_id = string
    }))
  }))
}