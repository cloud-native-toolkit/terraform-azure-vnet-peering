module "edgevnet" {
  source = "./module"

  virtual_network_name_edge = "edgevnet"
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_edge = ["10.1.0.0/16"]
  region = "eastus"
}
module "privatevnet" {
  source = "./module"

  virtual_network_name_private
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_private
  region = "eastus"
}
module "publicvnet" {
  source = "./module"

  virtual_network_name_public
  resource_group_name = "az-rg-vnetpeer"
  address_prefixes_vnet_public
  region = "eastus"
}

#module for Azure-Vnet-Peering
module "edgetoprivatepeer" {
  source = "./module"
  virtual_network_peering_edgetoprivate
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = azurerm_virtual_network.edgevnet.name
  remote_virtual_network_id = azurerm_virtual_network.privatevnet.id
}
#module for Azure-Vnet-Peering
module "privatetoedgepeer" {
  source = "./module"
  virtual_network_peering_privatetoedge
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = azurerm_virtual_network.privatevnet.name
  remote_virtual_network_id = azurerm_virtual_network.edgevnet.id
}
module "edgetopublicpeer"  {
  source = "./module"
  virtual_network_peering_edgetopublic
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = azurerm_virtual_network.edgevnet.name
  remote_virtual_network_id = azurerm_virtual_network.publicvnet.id
}
module "publictoedgepeer" {
  source = "./module"
  virtual_network_peering_publictoedge
  resource_group_name = "az-rg-vnetpeer"
  virtual_network_name      = azurerm_virtual_network.publicvnet.name
  remote_virtual_network_id = azurerm_virtual_network.edgevnet.id
}