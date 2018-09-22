variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}

variable "subnet1_name" {}

variable "subnet2_name" {}
variable "subnet3_name" {}

# Configure the Azure Provider
provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "network" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
    name                = "${var.vnet_name}"
    address_space       = ["10.0.0.0/16"]
    location            = "${azurerm_resource_group.network.location}"
    resource_group_name = "${azurerm_resource_group.network.name}"

    subnet {
        name           = "${var.subnet1_name}"
        address_prefix = "10.0.1.0/24"
    }

    subnet {
        name           = "${var.subnet2_name}"
        address_prefix = "10.0.2.0/24"
    }

    subnet {
        name           = "${var.subnet3_name}"
        address_prefix = "10.0.3.0/24"
    }
}