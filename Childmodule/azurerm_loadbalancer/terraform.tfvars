lb = {
    lb1 = {
  name                = "loadbalancer"
  location            = "eastus"
  resource_group_name = "xyz"

frontend_ip_configuration = {
    ip1 = {
        name = "frontendipaddress"
        public_ip_address_id = "20.169.171.107"
    }
}


    }
}