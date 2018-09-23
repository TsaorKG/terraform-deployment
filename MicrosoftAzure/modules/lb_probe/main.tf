resource "azurerm_lb_probe" "main" {
    resource_group_name = "${var.resource_group_name}"
    loadbalancer_id     = "${var.lb_id}"
    name                = "${var.probe_name}"
    port                = "${var.port}"
}
