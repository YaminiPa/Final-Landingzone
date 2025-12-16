resource "azurerm_storage_account" "sa" {
    for_each = var.sgname
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_tier  = each.value.account_tier
    account_replication_type = each.value.account_replication_type
    # public_network_access_enabled = each.value.public_network_access_enabled
    # default_to_oauth_authentication = each.value.default_to_oauth_authentication

      dynamic "network_rules" {
        for_each = each.value.network_rules
        content {
    default_action             = network_rules.value.default_action
    ip_rules                   = network_rules.value.ip_rules
    virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }

  #    tags = {
  #   environment = each.value.tags
  # }

}




