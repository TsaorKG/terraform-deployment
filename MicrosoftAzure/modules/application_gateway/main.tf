resource "azurerm_public_ip" "main" {
    name                         = "ip-${var.ag_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    public_ip_address_allocation = "dynamic"
}

resource "azurerm_application_gateway" "main" {
    name                = "${var.ag_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"

    sku {
        name           = "${var.sku_name}"
        tier           = "${var.sku_tier}"
        capacity       = "${var.instances}"
    }

    gateway_ip_configuration {
        name         = "gateway-conf-${var.ag_name}"
        subnet_id    = "${var.ag_subnet_id}"
    }

    frontend_port {
        name         = "feport-${var.ag_name}"
        port         = 80
    }

    frontend_ip_configuration {
        name         = "feip-${var.ag_name}"
        public_ip_address_id = "${azurerm_public_ip.main.id}"
    }

    backend_address_pool {
        name = "${var.backend_name}"
        ip_address_list = ["${var.backend_ips}"]
    }

    backend_http_settings {
        name                  = "htst-${var.backend_name}"
        cookie_based_affinity = "Disabled"
        port                  = 80
        protocol              = "Http"
        request_timeout       = 1
    }

    http_listener {
        name                            = "httplstn-${var.ag_name}"
        frontend_ip_configuration_name  = "feip-${var.ag_name}"
        frontend_port_name              = "feport-${var.ag_name}"
        protocol                        = "Http"
    }

    request_routing_rule {
        name                       = "${var.ag_name}-rqrt"
        rule_type                  = "Basic"
        http_listener_name         = "httplstn-${var.ag_name}"
        backend_address_pool_name  = "${var.backend_name}"
        backend_http_settings_name = "htst-${var.backend_name}"
    }
}