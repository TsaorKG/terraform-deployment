variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "virtual_network_name" {
    description = "description"
}
variable "subnet_address_space" {
    description = "description"
    default = "10.0.1.0/24"
}
variable "subnet_name" {
    description = "Subnet name"
    default = "test_subnet"
}
