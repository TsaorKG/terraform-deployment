resource "azurerm_lb_rule" "main" {
    count                          = "${length(var.lb_port)}"
    resource_group_name            = "${var.resource_group_name}"
    loadbalancer_id                = "${var.lb_id}"
    name                           = "${element(keys(var.lb_port), count.index)}"
    protocol                       = "${element(var.lb_port["${element(keys(var.lb_port), count.index)}"], 1)}"
    frontend_port                  = "${element(var.lb_port["${element(keys(var.lb_port), count.index)}"], 0)}"
    backend_port                   = "${element(var.lb_port["${element(keys(var.lb_port), count.index)}"], 2)}"
    frontend_ip_configuration_name = "${var.ip_conf_name}"
    backend_address_pool_id        = "${var.backend_address_pool_id}"
    probe_id                       = "${var.probe_id}"
}