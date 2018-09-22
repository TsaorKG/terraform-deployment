variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "vm_name" {
    description = "Virtual machine name"
    default = "test_vm"
}

variable "vm_hostname" {
    description = "Hostname"
    default = "testhostname"
}

variable "vm_admin_user" {
    description = "Admin user name"
    default = "testadmin"
}

variable "vm_admin_pwd" {
    description = "Admin password"
    default = "admin!1234"
}

variable "nic_id" {
    description = "Network interface id"  
}

variable "vm_size" {
    description = "Virtual machine size"
    default = "Standard_DS1_v2"
}
