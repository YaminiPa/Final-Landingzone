variable "vm" {}

data "azurerm_subnet" "subnet" {
  for_each = var.vm
  name                 = each.value.subnet
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "ip" {
  for_each = var.vm
  name                = each.value.ip
  resource_group_name = each.value.rgname
}



resource "azurerm_network_interface" "NIC" {
  for_each = var.vm
  name                = each.value.nic
  location            = each.value.location 
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.ip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = each.value. admin_username 
  admin_password      = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.NIC[each.key].id
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
}

}