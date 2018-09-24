variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "location" {
    description = "Location of the resource group"
    default = "West Europe"
}

variable "vm_instances" {
    description = "Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port]"
    default     = {}
}

variable "vm_admin_user" {
    description = "Admin user name"
    default = "testadmin"
}

variable "vm_admin_pwd" {
    description = "Admin password"
    default = "admin!1234"
}

variable "vm_size" {
    description = "Virtual machine size"
    default = "Standard_DS1_v2"
}


variable "subnet_id" {
    description = "Subnet id"
}

variable "private_ip_allocation" {
    description = "Static or dynamic"
    default = "static"
}
