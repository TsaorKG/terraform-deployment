# Variables from terraform.tfvars
variable "vnet_name" {}
variable "subnet_address_space" {}
variable "subnet_ag_address_space" {}
variable "ag_name" {}
variable "sku_name" {}
variable "sku_tier" {}
variable "instances" {}
variable "backend_name" {}
# Provider
provider "azurerm" {}

# Resources
module "resource_group" {
    source = "../modules/resource_group"  
}

module "virtual_network" {
    source = "../modules/virtual_network"

    resource_group_name = "${module.resource_group.rg_name}"
    location = "${module.resource_group.rg_location}"
}

module "subnet" {
    source = "../modules/subnet"

    resource_group_name = "${module.resource_group.rg_name}"
    virtual_network_name = "${module.virtual_network.vnet_name}"
    subnet_address_space = "${var.subnet_address_space}"
}

module "subnetAG" {
    source = "../modules/subnet"

    resource_group_name = "${module.resource_group.rg_name}"
    virtual_network_name = "${module.virtual_network.vnet_name}"
    subnet_address_space = "${var.subnet_ag_address_space}"
    subnet_name = "subnet-${var.ag_name}"
}

module "backend" {
    source = "../modules/backend_multi_vms"
    
    resource_group_name = "${module.resource_group.rg_name}"
    location = "${module.resource_group.rg_location}"
    subnet_id = "${module.subnet.subnet_id}"
    "vm_instances" {
        man1 = ["man1","10.0.1.4"]
        man2 = ["man2","10.0.1.5"]
        man3 = ["man3","10.0.1.6"]
    }    
}

module "ag" {
    source = "../modules/application_gateway"

    resource_group_name = "${module.resource_group.rg_name}"
    location = "${module.resource_group.rg_location}"
    ag_name = "${var.ag_name}"
    sku_name = "${var.sku_name}"
    sku_tier = "${var.sku_tier}"
    instances = "${var.instances}"
    backend_name = "${var.backend_name}"
    backend_ips = "${module.backend.vm_ips}"
    ag_subnet_id = "${module.subnetAG.subnet_id}"

}
