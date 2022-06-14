
#resource "azurerm_virtual_network" "virtual_network" {
# name                = var.virtual_network_name
#location            = var.region
#resource_group_name = var.resource_group_name
#address_space       = var.virtual_network_address_space
#}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.region
}

resource "azurerm_virtual_network" "edgevnet" {
  name                = var.virtual_network_name_edge
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes_vnet_edge
  location            = var.region
}

resource "azurerm_virtual_network" "privatevnet" {
  name                = var.virtual_network_name_private
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes_vnet_private
  location            = var.region
}
resource "azurerm_virtual_network" "publicvnet" {
  name                = var.virtual_network_name_public
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes_vnet_public
  location            = var.region
}
resource "azurerm_virtual_network_peering" "edgetoprivatepeer" {
  name                      = var.virtual_network_peering_edgetoprivate
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.edgevnet.name
  remote_virtual_network_id = azurerm_virtual_network.privatevnet.id
}
resource "azurerm_virtual_network_peering" "privatetoedgepeer" {
  name                      = var.virtual_network_peering_privatetoedge
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.privatevnet.name
  remote_virtual_network_id = azurerm_virtual_network.edgevnet.id
}
resource "azurerm_virtual_network_peering" "edgetopublicpeer" {
  name                      = var.virtual_network_peering_edgetopublic
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.edgevnet.name
  remote_virtual_network_id = azurerm_virtual_network.publicvnet.id
}
resource "azurerm_virtual_network_peering" "publictoedgepeer" {
  name                      = var.virtual_network_peering_publictoedge
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.publicvnet.name
  remote_virtual_network_id = azurerm_virtual_network.edgevnet.id
}