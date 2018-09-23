resource "azurerm_lb" "main" {
    name                = "${var.lb_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    sku                 = "${var.sku}"
    
    frontend_ip_configuration {
        name                 = "${var.ip_conf_name}"
        private_ip_address_allocation = "${var.private_ip_allocation}"
        private_ip_address = "${var.private_ip}"
    }
}
