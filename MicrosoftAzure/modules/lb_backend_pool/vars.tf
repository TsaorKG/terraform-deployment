variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "lb_id" {
    description = "Load balancer id"
}

variable "backend_name" {
    description = "Backend pool name"
    default = "test_backend"
}
