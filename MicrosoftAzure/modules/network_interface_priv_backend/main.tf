resource "azurerm_network_interface" "main" {
    name                = "${var.nic_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"

    ip_configuration {
        name                          = "${var.ip_conf_name}"
        subnet_id                     = "${var.subnet_id}"
        private_ip_address_allocation = "${var.private_ip_allocation}"
        private_ip_address            = "${var.private_ip_address}"
        load_balancer_backend_address_pools_ids = ["${var.backend_pool_ids}"]
    }
}