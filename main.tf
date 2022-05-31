
# resource "resource_group_name" "rg_azure_network" {
#   name     = "peeredvnets-rg"
#   location = "var.region"
# }

#resource "azurerm_virtual_network" "virtual_network" {
# name                = var.virtual_network_name
#location            = var.region
#resource_group_name = var.resource_group_name
#address_space       = var.virtual_network_address_space
#}

#resource "azurerm_resource_group" "resource_group" {
#  name     = var.resource_group_name
#  location = var.region
#}

resource "azurerm_virtual_network" "vlan1" {
  name                = var.virtual_network_name_1
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes_vnet1
  location            = var.region
}

resource "azurerm_virtual_network" "vlan2" {
  name                = var.virtual_network_name_2
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes_vnet2
  location            = var.region
}

resource "azurerm_virtual_network_peering" "vnetpeer1" {
  name                      = var.virtual_network_peering_1to2
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vlan1.name
  remote_virtual_network_id = azurerm_virtual_network.vlan2.id
}

resource "azurerm_virtual_network_peering" "vnetpeer2" {
  name                      = var.virtual_network_peering_2to1
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vlan2.name
  remote_virtual_network_id = azurerm_virtual_network.vlan1.id
}