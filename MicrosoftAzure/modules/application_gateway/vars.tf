variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "ag_name" {

}

variable "ag_subnet_id" {

}
variable "sku_name" {

}
variable "sku_tier" {

}
variable "instances" {

}
variable "backend_name" {

}
variable "backend_ips" {
    type = "list"
}