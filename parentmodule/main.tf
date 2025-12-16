module "rg" {
    source = "../Childmodule/azurerm_resourcegroup"
    rgname = var.rgname
}


variable "rgname"{}

module "sg" {
    depends_on = [module.rg]
    source = "../Childmodule/azurerm_storageaccount"
    sgname = var.sgname
    # location = var.location
    # network_rules = var.network_rules
}


variable "sgname" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    network_rules = optional(list(object({
      default_action              = string
      ip_rules                    = optional(list(string))
      virtual_network_subnet_ids  = optional(list(string))
    })), [])
  }))
}

# variable "location"{}


# variable "sgname" {
#   type = map(object({
#     public_network_access_enabled = optional(bool)
#     efault_to_oauth_authentication = optional(bool)


#     network_rules = optional(object({
#        default_action = string
#       ip_rules = list(string)

#     }))

#   }))
# }

# module "container"{
#     depends_on = [ module.sg ]
#     source = "../Childmodule/azurerm_container"
#     gencon = var.gencon
# }

# variable "gencon"{}


module "vnet" {
    depends_on = [ module.rg ]
    source = "../Childmodule/azurerm_virtualnetwork"
    vnetname = var.vnetname
}

variable "vnetname" {}


module "snet" {
    depends_on = [module.vnet,module.rg]
    source = "../Childmodule/azurerm_subnet"
    subnet = var.subnet
}

variable "subnet" {}


module "vm" {
  depends_on = [module.snet,module.rg,module.ip]
  source = "../Childmodule/azure_virtualmachine"

  vm = var.vm   # pass the nested map from root variable
}


variable "vm" {
  description = "Map of virtual machines"
  type = map(object({
        rgname = string
        location = string
        vnet = string
        subnet = string
        nic = string
        ip = string
        vmname = string
        admin_username = string
        admin_password  = string
        source_image_reference= map(string)
   
  }))
}



module "ip" {
  source = "../Childmodule/azurerm_publicip"
  ip = var.ip
}

variable "ip" {
  description = "Map of public IPs to create"
    type = map(object({
    name                = string
    location            = string
    rgname = string
    allocation_method   = string
  }))
}

# module "lb" {
#   depends_on = [module.ip,module.rg,module.vm]
#   source = "../Childmodule/azurerm_loadbalancer"
#   lb = var.lb
# }

# variable "lb" {
#   description = "Map of load balancers with frontend IP configurations"
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     frontend_ip_configuration = map(object({
#       name                 = string
#       public_ip_address_id = string
#     }))
#   }))
# }


# module "appgateway" {
#   source = "../Childmodule/azurerm_applicationgateway"
#   app_gateways = var.app_gateways

# }

# variable "app_gateways" {
#   description = "Map of application gateways to create"
#   type = map(object({
#     location            = string
#     resource_group_name = string
#     subnet_id           = string
#     sku_name            = string
#     sku_tier            = string
#     capacity            = number
#     frontend_port       = number
#     backend_path        = string
#   }))
# }


# module "nsg" {
#   depends_on = [ module.rg ]
#   source = "../Childmodule/azurerm_nsg"
#   nsg = var.nsg
# }

# variable "nsg" {
#   type = map(object({
#     name     = string
#     location = string
#     rgname   = string

#     security_rule = object({
#       name                       = string
#       priority                   = number
#       direction                  = string
#       access                     = string
#       protocol                   = string
#       source_port_range          = string
#       destination_port_range     = string
#       source_address_prefix      = string
#       destination_address_prefix = string
#     })
#   }))
# }


# module "asg" {
#   source = "../Childmodule/azurerm_asg"
#   asg = var.asg

# }

# variable "asg" {
#   type = map(object({
#     name = string
#     location = string
#     rgname = string
#   }))
# }

# module "keyvault" {
#   source = "../Childmodule/azurerm_keyvault"
#   keyvault = var.keyvault
# }

# variable "keyvault" {
#   type = map(object({
#     name                        = string
#     location                    = string
#     rgname        = string
#     enabled_for_disk_encryption = bool
#     tenant_id                   = string
#     soft_delete_retention_days  = number
#     purge_protection_enabled    = bool
#     sku_name                    = string
#    access_policies = optional(list(object({ tenant_id=string, object_id=string, key_permissions=list(string), secret_permissions=list(string), storage_permissions=list(string) })), [])
#   }))
# }


module "server" {
  depends_on = [ module.rg ]
source = "../Childmodule/azurerm_sqlserver"
mssqlserver = var.mssqlserver
  
}

variable "mssqlserver" {
  type = map(object({
    name                         = string
    rgname                       = string
    location                     = string
    version                      = string
    administrator_login           = string
    administrator_login_password  = string
     minimum_tls_version          = string
  }))
}


module "msqldata" {
  depends_on = [ module.server ]
  source = "../Childmodule/azurerm_sqldatabase"
  mssql = var.mssql 
}

variable "mssql" {
  type = map(object({
    name         = string
    server_id    = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}


module "acr" {
  depends_on = [ module.rg ]
  source = "../Childmodule/azurerm_ACR"
  acr = var.acr
}


variable "acr" {
  type = map(object({
    name = string
    location = string
    rgname = string
    sku = string
    admin_enabled = bool
     
  }))
}



module "cluster" {
  source = "../Childmodule/azurerm_aks"
  aks = var.aks
  default_node_pool = var.default_node_pool
  }

variable "aks" {
  type = map(object({
    name       = string
    location   = string
    rgname     = string
    dns_prefix = string
  }))
}

variable "default_node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
  })
}
