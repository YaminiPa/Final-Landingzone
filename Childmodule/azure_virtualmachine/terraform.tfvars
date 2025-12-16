vm = {
    vm1 = {
        rg_name = "xyz"
        location = "centralus"
        vnet = "vnet11"
        subnet = "snet11"
        nic = "frontendnic"
        ipname = "frontendip"
        vmname = "firtsvm"
        admin_username = ""
        admin_password  = ""

        source_image_reference ={
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }


    }
}