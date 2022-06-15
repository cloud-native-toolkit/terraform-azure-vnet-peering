
module "azure_vnet_peering" {
  source                      = "./module"
  resource_group_name         = module.resource_group.name
  region                      = var.region
 
  virtual_network_name_edge = "edgevnet"
  address_prefixes_vnet_edge = ["10.1.0.0/16"]

  virtual_network_name_private = "privatevnet"
  address_prefixes_vnet_private = ["10.2.0.0/16"]

  virtual_network_name_public = "publicvnet"
  address_prefixes_vnet_public = ["10.3.0.0/16"]

  virtual_network_peering_edgetoprivate = "edgetoprivatepeer"
  virtual_network_peering_privatetoedge = "privatetoedgepeer"
  virtual_network_peering_edgetopublic = "edgetopublicpeer"
  virtual_network_peering_publictoedge = "publictoedgepeer"
    
}