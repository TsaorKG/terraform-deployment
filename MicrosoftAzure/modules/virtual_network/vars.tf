variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "vnet_name" {
  description = "Vnet name"
  default = "test_vnet"
}

variable "vnet_address_space" {
    description = "Vnet adress space"
    default = "10.0.0.0/16"
}
