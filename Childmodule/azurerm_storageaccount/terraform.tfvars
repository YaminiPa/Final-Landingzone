sgname = {

    sg1 = {
        name = "por"
        resource_group_name = "xyz"
        location = "eastus"
        account_tier = "Standard"
        account_replication_type = "LRS"
        # default_to_oauth_authentication = true
        # public_network_access_enabled  =  true


        network_rules = {
        default_action             = "Deny"
        ip_rules                   = ["100.0.0.1"]
        virtual_network_subnet_ids = [azurerm_subnet.example.id]
            }


        # tags = {
        #     environment = "staging"
        # }
    }

    sg2 = {
         name = "por"
         resource_group_name = "xyz"
        location = "central us"
        account_tier = "Standard"
        account_replication_type = "LRS"

    }


}