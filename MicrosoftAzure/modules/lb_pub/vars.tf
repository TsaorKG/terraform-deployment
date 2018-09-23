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
    default = "test_lb_ip_conf_name"
}

variable "pub_ip_id" {
    description = "Public Ip id"
}

variable "sku" {
    description = "Load balancer sku"
    default = "basic"
}