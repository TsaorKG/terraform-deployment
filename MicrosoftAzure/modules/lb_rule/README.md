## lb_rule

### [Inputs](./vars.tf)

    resource_group_name = ""
    lb_id = ""
    ip_conf_name = ""
    backend_address_pool_id = ""
    probe_id = ""
    lb_port {
        rule_name = ["frontend_port", "protocol", "backend_port"]
    } 

### [Outputs](./outputs.tf)

