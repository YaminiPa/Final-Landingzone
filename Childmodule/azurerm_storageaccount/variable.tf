variable "sgname" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    network_rules = optional(list(object({
      default_action              = string
      ip_rules                    = optional(list(string))
      virtual_network_subnet_ids  = optional(list(string))
    })), [])
  }))
}

# variable "sgname" {
#   description = "Map of storage accounts to create"
#   type = map(object({
#     name                     = string
#     resource_group_name      = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     network_rules            = optional(object({
#       default_action             = string
#       ip_rules                   = list(string)
#       virtual_network_subnet_ids = list(string)
#     }), null) # optional
#     tags = optional(map(string), {}) # optional tags
#   }))
# }




# variable "network_rules"{}

# variable "rgname"{
# }
