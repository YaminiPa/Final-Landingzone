variable "vm" {
  description = "Map of virtual machines"
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    size                  = string
    network_interface_ids = list(string)
    admin_username        = string
    admin_ssh_key         = optional(string)
    os_disk = optional(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    tags = map(string)
  }))
}
