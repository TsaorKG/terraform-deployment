variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "lb_name" {
    description = "Load balancer name"
    default = "test_lb"
}

variable "ip_conf_name" {
    description = "Ip configuration name"
}

variable "private_ip_allocation" {
    description = "Static or dynamic"
    default = "static"
}

variable "private_ip" {
    description = "Private Ip"
}

variable "sku" {
    description = "Load balancer sku"
    default = "basic"
}


