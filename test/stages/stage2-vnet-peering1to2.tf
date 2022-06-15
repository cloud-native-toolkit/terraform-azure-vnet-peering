module "vnet1" {
  source = "github.com/cloud-native-toolkit/terraform-azure-vnet"

  resource_group_name = module.resource_group.name
  region              = var.region
  name_prefix         = var.name_prefix
  address_prefix_count = 1
  address_prefixes    = ["10.0.0.0/8"]
  enabled             = true
}
module "vnet2" {
  source = "github.com/cloud-native-toolkit/terraform-azure-vnet"

  resource_group_name = module.resource_group.name
  region              = var.region
  name_prefix         = var.name_prefix
  address_prefix_count = 1
  address_prefixes    = ["10.0.1.0/8"]
  enabled             = true
}

#module for Azure-Vnet-Peering
module "azure-vnet-peering1to2" {
  source = "./module"
  name                      = "vnetpeer1to2"
  resource_group_name       = module.resource_group.name
  virtual_network_name      = module.vnet1.name
  remote_virtual_network_id = module.vlan2.id
}
#module for Azure-Vnet-Peering
module "azure-vnet-peering2to1" {
  source = "./module"
  name                      = "vnetpeer2to1"
  resource_group_name       = module.resource_group.name
  virtual_network_name      = module.vnet2.name
  remote_virtual_network_id = module.vlan1.id
}