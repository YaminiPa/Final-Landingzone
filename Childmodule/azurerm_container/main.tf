resource "azurerm_storage_container" "container" {
  for_each              = var.gencon
  name                  = each.value.name 
  storage_account_id    = each.value.storage_Account_id
  container_access_type = "private"
}


variable "gencon" {
  }
  # variable "final_rg" {
  #   }
  # variable "final_sg" {
  #   }

