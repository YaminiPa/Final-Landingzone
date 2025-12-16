resource "azurerm_mssql_database" "database" {
    for_each = var.mssql
  name         = each.value.name
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
}

#   tags = {
#     foo = "bar"
#   }

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }


variable "mssql" {}

# }