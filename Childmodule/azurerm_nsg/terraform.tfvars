nsg = {
    nsg1 = {

  name                = "nsg"
  location            = "centralus"
  rgname              = "xyz"


  security_rule = {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    }
}