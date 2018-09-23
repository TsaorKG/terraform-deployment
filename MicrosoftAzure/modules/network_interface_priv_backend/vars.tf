variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "nic_name" {
    description = "Network Interface name"
    default = "test_nic"
}

variable "ip_conf_name" {
    description = "Name of the IP configuration"
    default = "test_ip_conf"
}

variable "subnet_id" {
    description = "Subnet id"
}

variable "private_ip_allocation" {
    description = "Static or dynamic"
    default = "static"
}

variable "private_ip_address" {
    description = "Static private IP"
}

variable "backend_pool_ids" {
    type = "list"
    description = "List of backend pools"
}
