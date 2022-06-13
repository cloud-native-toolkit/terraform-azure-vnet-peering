# module "vnet" {
#   source = "github.com/cloud-native-toolkit/terraform-azure-vnet"

#   resource_group_name = module.resource_group.name
#   region              = var.region
#   name_prefix         = var.name_prefix
#   address_prefix_count = 3
#   address_prefixes    = ["10.1.0.0/16","10.2.0.0/16","10.3.0.0/16"]
#   enabled             = true
# }