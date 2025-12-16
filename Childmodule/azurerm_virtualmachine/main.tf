resource "azurerm_linux_virtual_machine" "virtual_machine" {
  for_each = var.vm
  
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  network_interface_ids = each.value.network_interface_ids

  # OS Disk (required)
  os_disk {
    name                 = each.value.os_disk != null ? each.value.os_disk.name : "${each.value.name}-osdisk"
    caching              = each.value.os_disk != null ? each.value.os_disk.caching : "ReadWrite"
    storage_account_type = each.value.os_disk != null ? each.value.os_disk.storage_account_type : "Standard_LRS"
    disk_size_gb         = each.value.os_disk != null ? each.value.os_disk.disk_size_gb : 30
  }

  # Optional SSH key
  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_key != null ? [each.value.admin_ssh_key] : []
    content {
      username   = each.value.admin_username
      public_key = trimspace(each.value.admin_ssh_key)  # string directly
    }
  }

  # VM image
  source_image_reference {
    publisher = lookup(each.value, "publisher", "Canonical")
    offer     = lookup(each.value, "offer", "UbuntuServer")
    sku       = lookup(each.value, "sku", "18.04-LTS")
    version   = lookup(each.value, "version", "latest")  # <- safer than a fixed version
  }

  tags = lookup(each.value, "tags", {})
}
