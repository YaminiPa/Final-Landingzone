# Create Public IPs dynamically
resource "azurerm_public_ip" "example" {
  for_each            = var.app_gateways
  name                = "${each.key}-pip"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Define locals dynamically for reuse inside app gateway
locals {
  gateway_names = {
    for key, val in var.app_gateways : key => {
      backend_address_pool_name      = "${key}-beap"
      frontend_port_name             = "${key}-feport"
      frontend_ip_configuration_name = "${key}-feip"
      http_setting_name              = "${key}-be-htst"
      listener_name                  = "${key}-httplstn"
      request_routing_rule_name      = "${key}-rqrt"
    }
  }
}

# Create Application Gateways dynamically
resource "azurerm_application_gateway" "network" {
  for_each            = var.app_gateways
  name                = "${each.key}-appgateway"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = "${each.key}-gw-ip"
    subnet_id = each.value.subnet_id
  }

  frontend_port {
    name = local.gateway_names[each.key].frontend_port_name
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.gateway_names[each.key].frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }

  backend_address_pool {
    name = local.gateway_names[each.key].backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.gateway_names[each.key].http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = each.value.backend_path
    port                  = each.value.frontend_port
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.gateway_names[each.key].listener_name
    frontend_ip_configuration_name = local.gateway_names[each.key].frontend_ip_configuration_name
    frontend_port_name             = local.gateway_names[each.key].frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.gateway_names[each.key].request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.gateway_names[each.key].listener_name
    backend_address_pool_name  = local.gateway_names[each.key].backend_address_pool_name
    backend_http_settings_name = local.gateway_names[each.key].http_setting_name
  }
}


