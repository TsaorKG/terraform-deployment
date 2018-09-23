variable "resource_group_name" {
    description = "resource group name"
    default = "test"
}

variable "lb_id" {
    description = "Load balancer id"
}

variable "lb_port" {
    description = "Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port]"
    default     = {}
}

variable "ip_conf_name" {
    description = "Frontend ip configuration name"
}

variable "backend_address_pool_id" {
    description = "Backend pool id"
}

variable "probe_id" {
    description = "Probe id"
}


