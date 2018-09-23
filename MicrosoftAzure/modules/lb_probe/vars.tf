variable "resource_group_name" {
    type = "string"
    description = "resource group name"
    default = "test"
}

variable "lb_id" {
    type = "string"
    description = "Load balancer id"
}

variable "probe_name" {
    type = "string"
    description = "Probe name"
    default = "test_probe"
}

variable "port" {
    type = "string"
    description = "description"
    default = 22
}
