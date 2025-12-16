rgname = {

    rg1 = {

        name = "xyz"
        location = "centralus"
    }
}

sgname = {
    sg1 = {
        name = "yamaisg"
        resource_group_name = "xyz"
        location = "centralus"
        account_tier = "Standard"
        account_replication_type = "LRS"
    }

    sg2 = {
        name = "yamaisg1"
        resource_group_name = "xyz"
        location = "centralus"
        account_tier = "Standard"
        account_replication_type = "LRS"
    }


    # network_rules = {
    #     default_action             = "Deny"
    #     ip_rules                   = ["100.0.0.1"]
    #     virtual_network_subnet_ids = [azurerm_subnet.example.id]
    #         }

}



# finalcontainer = {
#     con1 ={
#         con_name = "xyz"
# }
# }


# gencon = {
#     con1 = {
#     name = "con1"
#     storage_Account_id = "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Storage/storageAccounts/porrrrr"
#      container_access_type = "private"
#     }
    
# }

vnetname = {
#     vnet1 = {
#   name                = "frontendvnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = "centralus"
#   resource_group_name = "xyz"
#     }

     vnet2 = {
  name                = "backendvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "centralus"
  resource_group_name = "xyz"
    }
}


subnet = {
    
    sub1 = {
        name = "frontendsubnet"
        resource_group_name = "xyz"
        virtual_network_name = "backendvnet"
        address_prefixes = ["10.0.1.0/24"]

    }


     sub2 = {
        name = "backendsubnet"
        resource_group_name = "xyz"
        virtual_network_name = "backendvnet"
        address_prefixes = ["10.0.2.0/24"]

    }
}


# vm = {
#     vm1 = {
#       name            = "virtualmachine"
#   resource_group_name = "xyz"
#   location            = "eastus"
#   size                = "Standard_F2"
#   admin_username      = "yaminivm"
#   network_interface_ids = ["/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/networkInterfaces/nic"]


# os_disk = {

# osdisk1 = {
#   caching = "ReadWrite"
#    storage_account_type = "Standard_LRS"

# }
# }
# }
# }

# vm = {
#   vm1 = {
#     name                  = "vm1"
#     location              = "eastus"
#     resource_group_name   = "xyz"
#     size                  = "Standard_B2s"
#     network_interface_ids = [
#       "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/networkInterfaces/nic"
#     ]
#     admin_username = "azureuser"
#     admin_ssh_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzD2JhUfnR2rrr+nRP9Nf/3I02/mpDUmB7azeBatHVwnF20WTJfBbS9ykqFDFIChgSJvDTShms7WtnPjheOkaxNkAB/wJJN0inl53YiuxK7TJDWl5D26GCvSPLKxUsx+m1MFfhNBS6KLbbfY2L+IWG5P4GZC/iLxAqkeDQvSRfR2TBofjEUIgM1dZUjGx2KGyYBbQfHsV2S9d/+YrTJEzSz0C1U9Vmpczov9CjrPanUEi0xVxBma6eE/OxLjppqdzDPaY6irCxiMBeewj5IyG2yrsk7sRvYrPuUsQ4Y1sNcRkfREBey+zz3iT14PQIlGoG3o+CHsEydDOddYcbR72h azureuser"
#     os_disk = {
#       name                 = "vm1-osdisk"
#       caching              = "ReadWrite"
#       storage_account_type = "Standard_LRS"
#       disk_size_gb         = 30
#     }
#     tags = {
#       environment = "dev"
#     }
#   }

#   vm2 = {
#     name                  = "vm2"
#     location              = "eastus"
#     resource_group_name   = "xyz"
#     size                  = "Standard_B2s"
#     network_interface_ids = ["/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/networkInterfaces/nic"]
#     admin_username        = "azureuser1"
#     # optional: no admin_ssh_key and os_disk
#     tags = {
#       environment = "prod"
#     }
#   }

vm = {
    vm1 = {
        rgname = "xyz"
        location = "centralus"
        vnet = "backendvnet"
        subnet = "frontendsubnet"
        nic = "frontendnic"
        ip = "publicip12"
        vmname = "frontenvm"
        admin_username = "adminyamini"
        admin_password  = "Adminyamini@1234"

        source_image_reference ={
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
    }

 vm3 = {
        rgname = "xyz"
        location = "centralus"
        vnet = "backendvnet"
        subnet = "backendsubnet"
        nic = "backendnic"
        ip = "publicip123"
        vmname = "backendvm"
        admin_username = "adminyamini1"
        admin_password  = "Adminyamini@12345"
         size = "Standard_B2s" 

        source_image_reference ={
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

    }
}






ip = {
    ip1 = {
   name                = "publicip12"
  location            = "centralus"
  rgname               =  "xyz"
  allocation_method   = "Static"
    }

   ip2 = {
   name                = "publicip123"
  location            = "centralus"
  rgname               =  "xyz"
  allocation_method   = "Static"
    }
}

mssqlserver = {

    server1 = {    
  name                         = "mssqlserveryamini"
  rgname                       = "xyz"
  location                     = "centralus"
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
#   }

    }
    }


# }






# lb = {
#     lb1 = {
#   name                = "loadbalancer"
#   location            = "centralus"
#   resource_group_name = "xyz"

# frontend_ip_configuration = {
#   ip1 = {
#         name = "frontendipaddress"
#         public_ip_address_id = "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/publicIPAddresses/publicip"
  
# }
#  }
# }
# }


# app_gateways = {
#   agw1 = {
#     location            = "centralus"
#     resource_group_name = "xyz"
#     subnet_id           = "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/virtualNetworks/vnet11/subnets/snet11"
#     sku_name            = "Standard_v2"
#     sku_tier            = "Standard_v2"
#     capacity            = 2
#     frontend_port       = 80
#     backend_path        = "/path1/"
#   }

#   agw2 = {
#     location            = "centralus"
#     resource_group_name = "xyz"
#     subnet_id           = "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Network/virtualNetworks/vnet11/subnets/snet11"
#     sku_name            = "Standard_v2"
#     sku_tier            = "Standard_v2"
#     capacity            = 2
#     frontend_port       = 8080
#     backend_path        = "/path2/"
#   }
# }




# nsg = {
#     nsg1 = {

#   name                = "nsg"
#   location            = "centralus"
#   rgname              = "xyz"


#   security_rule = {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#     }
# }


# asg = {
#     asg1 = {
#    name              = "asg"
#   location          = "centralus"
#   rgname            =  "xyz"
#     }
# }


# keyvault = {
#   keyvault1 = {
#     name                      = "dekhokeyvault123"
#   location                    = "centralus"
#   rgname        = "xyz"
#   enabled_for_disk_encryption = true
#   tenant_id                   = "07b6dcc9-18d6-45a6-b3d3-7183c906e2ba"
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false
#   sku_name = "standard"

  # access_policy {
  #   tenant_id = data.azurerm_client_config.tentid.tenant_id
  #   object_id = data.azurerm_client_config.objtid.object_id


  # }

# }
# }




mssql = {
  mssql1 = {
      name         = "yaminidatabase"
  server_id    = "/subscriptions/b107b989-85d9-4402-94e8-40ae932b8893/resourceGroups/xyz/providers/Microsoft.Sql/servers/mssqlserveryamini"
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  }
}

acr = {
    acr1 = {
  name                ="yaminiacr"
  rgname = "xyz"
  location            = "centralus"
  sku                 = "Premium"
  admin_enabled       = false
}
}


aks = {
  aks1 = {
    name       = "prod-aks"
    location   = "centralus"
    rgname     = "xyz"
    dns_prefix = "prodaks"
  }
}

default_node_pool = {
  name       = "systempool"
  node_count = 2
  vm_size    = "Standard_b2s"
}
