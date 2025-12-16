data "azurerm_client_config" "tentid" {
}

data "azurerm_client_config" "objtid" {
}


resource "azurerm_key_vault" "vault" {
  for_each = var.keyvault
  name                        = each.value.name 
  location                    = each.value.location
  resource_group_name         = each.value.rgname
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled 

  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.tentid.tenant_id
    object_id = data.azurerm_client_config.objtid.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


variable "keyvault" {}