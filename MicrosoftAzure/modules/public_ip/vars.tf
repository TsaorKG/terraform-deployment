variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "ip_name" {
    description = "Public IP name"
    default = "test_ip"
}

variable "public_ip_allocation" {
    description = "Static or dynamic"
    default = "static"
}
