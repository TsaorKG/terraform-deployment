resource "azurerm_lb_backend_address_pool" "main" {
    resource_group_name = "${var.resource_group_name}"
    loadbalancer_id     = "${var.lb_id}"
    name                = "${var.backend_name}"
}
