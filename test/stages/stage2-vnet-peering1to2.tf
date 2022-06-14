module "edgevnet" {
  source = "./module"

  virtual_network_name_edge = "edgevnet"
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_edge = ["10.1.0.0/16"]
  region = "eastus"
}

module "privatevnet" {
  source = "./module"

  virtual_network_name_private = "privatevnet"
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_private = ["10.2.0.0/16"]
  region = "eastus"
}

module "publicvnet" {
  source = "./module"

  virtual_network_name_public = "publicvnet"
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_public = ["10.3.0.0/16"]
  region = "eastus"
}


module "edgetoprivatepeer" {
  source = "./module"
  virtual_network_peering_edgetoprivate = "edgetoprivatepeer"
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = module.edgevnet.name
  remote_virtual_network_id = module.privatevnet.id
}

module "privatetoedgepeer" {
  source = "./module"
  virtual_network_peering_privatetoedge = "privatetoedgepeer"
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = module.privatevnet.name
  remote_virtual_network_id = module.edgevnet.id
}

module "edgetopublicpeer"  {
  source = "./module"
  virtual_network_peering_edgetopublic = "edgetopublicpeer"
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = module.edgevnet.name
  remote_virtual_network_id = module.publicvnet.id
}

module "publictoedgepeer" {
  source = "./module"
  virtual_network_peering_publictoedge = "publictoedgepeer"
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = module.publicvnet.name
  remote_virtual_network_id = module.edgevnet.id
}