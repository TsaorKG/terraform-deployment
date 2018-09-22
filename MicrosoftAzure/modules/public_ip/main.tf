resource "azurerm_public_ip" "main" {
    name                         = "${var.ip_name}"
    location                     = "${var.location}"
    resource_group_name          = "${var.resource_group_name}"
    public_ip_address_allocation = "${var.public_ip_allocation}"
}