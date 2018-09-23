# Variables from terraform.tfvars
variable "vnet_name" {}
variable "subnet_address_space" {}
variable "private_ip_address" {}
variable "ip_conf_name" {}
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

module "public_ip" {
  source = "../modules/public_ip"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
}

module "lb" {
  source = "../modules/lb_pub"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
  pub_ip_id = "${module.public_ip.pub_ip_id}"
  ip_conf_name ="${var.ip_conf_name}"
}

module "backend_pool" {
  source = "../modules/lb_backend_pool"

  resource_group_name = "${module.resource_group.rg_name}"
  lb_id = "${module.lb.lb_id}"
}

module "lb_probe_ssh" {
  source = "../modules/lb_probe"

  resource_group_name = "${module.resource_group.rg_name}"
  lb_id = "${module.lb.lb_id}"
}

module "lb_rule_ssh" {
  source = "../modules/lb_rule"

  resource_group_name = "${module.resource_group.rg_name}"
  lb_id = "${module.lb.lb_id}"
  ip_conf_name ="${var.ip_conf_name}"
  backend_address_pool_id = "${module.backend_pool.backend_id}"
  probe_id = "${module.lb_probe_ssh.lb_probe_id}"

  "lb_port" {
    ssh = ["22", "Tcp", "22"]
    http = ["80","Tcp","80"]
    https = ["443","Tcp","443"]
  }
}

module "nic" {
  source = "../modules/network_interface_priv_backend"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
  subnet_id = "${module.subnet.subnet_id}"
  private_ip_address = "${var.private_ip_address}"
  backend_pool_ids = ["${module.backend_pool.backend_id}"]
}

module "vm" {
  source = "../modules/ubuntu_vm"

  resource_group_name = "${module.resource_group.rg_name}"
  location = "${module.resource_group.rg_location}"
  nic_id = "${module.nic.nic_id}"
}



