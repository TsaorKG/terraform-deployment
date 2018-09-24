output "vm_ips" {
    value = "${azurerm_network_interface.main.*.private_ip_address}"
}