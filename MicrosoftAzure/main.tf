# Configure the Azure Provider
variable "vnet_name" {}

provider "azurerm" {}
module "resource_group" {
  source = "./modules/resource_group"
}

module "virtual_network" {
  source = "./modules/virtual_network"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
}

module "subnet" {
  source = "./modules/subnet"

  resource_group_name = "${module.resource_group.rg_name}"
  virtual_network_name = "${module.virtual_network.vnet_name}"
}

module "public_ip" {
  source = "./modules/public_ip"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
}

module "nic" {
  source = "./modules/network_interface_pub"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
  subnet_id = "${module.subnet.subnet_id}"
  pub_ip_id = "${module.public_ip.pub_ip_id}"
}

module "vm" {
  source = "./modules/ubuntu-vm"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
  nic_id = "${module.nic.nic_id}"
}