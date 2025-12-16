
# resource "azurerm_mssql_server" "server" {
  # for_each = var.mssqlserver
  # name                         = each.value.name
  # resource_group_name          = each.value.rgname
  # location                     = each.value.location
  # version                      = each.value.version
  # administrator_login          = each.value.administrator_login 
  # administrator_login_password = each.value.dministrator_login_password
  # minimum_tls_version          = each.value.minimum_tls_version 

  # azuread_administrator {
  #   login_username = "AzureAD Admin"
  #   object_id      = "00000000-0000-0000-0000-000000000000"
  # }

  # tags = {
  #   environment = "production"
  # }
# }

resource "azurerm_mssql_server" "server" {
  for_each = var.mssqlserver
  name                         = each.value.name
  resource_group_name          = each.value.rgname
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version
}


variable "mssqlserver" {}