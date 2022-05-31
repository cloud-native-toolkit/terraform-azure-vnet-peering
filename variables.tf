variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the NAT gateway has been provisioned"
}

variable "region" {
  type        = string
  description = "The Azure location where the VNET will be installed"
}
variable "virtual_network_name_1" {
  type        = string
  description = "The name of Azure vnet"
}
variable "virtual_network_name_2" {
  type        = string
  description = "The name of Azure vnet"
}
variable "address_prefixes_vnet1" {
  type        = list(string)
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = []
}
variable "address_prefixes_vnet2" {
  type        = list(string)
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.11.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = []
}
variable "virtual_network_peering_1to2" {
  type        = string
  description = "The name of Azure vnet peering"
}
variable "virtual_network_peering_2to1" {
  type        = string
  description = "The name of Azure vnet peering"
}