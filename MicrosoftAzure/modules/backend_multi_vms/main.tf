resource "azurerm_network_interface" "main" {
    count                     = "${length(var.vm_instances)}"
    name                      = "nic-${element(keys(var.vm_instances), count.index)}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    #network_security_group_id = "${var.nsg_id}"

    ip_configuration {
        name                          = "ipconfig-${element(keys(var.vm_instances), count.index)}"
        subnet_id                     = "${var.subnet_id}"
        private_ip_address_allocation = "${var.private_ip_allocation}"
        private_ip_address            = "${element(var.vm_instances["${element(keys(var.vm_instances), count.index)}"], 1)}"
        # application_gateway_backend_address_pools_ids = ["${var.backend_pool_ids}"]
    }
}

resource "azurerm_virtual_machine" "main" {
    count                 = "${length(var.vm_instances)}"
    name                  = "${element(var.vm_instances["${element(keys(var.vm_instances), count.index)}"], 0)}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = ["${element(azurerm_network_interface.main.*.id, count.index)}"]
    vm_size               = "${var.vm_size}"

    # Uncomment this line to delete the OS disk automatically when deleting the VM
    delete_os_disk_on_termination = true

    # Uncomment this line to delete the data disks automatically when deleting the VM
    #delete_data_disks_on_termination = true

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    storage_os_disk {
        name              = "osdisk-${element(keys(var.vm_instances), count.index)}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    os_profile {
        computer_name  = "${element(keys(var.vm_instances), count.index)}"
        admin_username = "${var.vm_admin_user}"
        admin_password = "${var.vm_admin_pwd}"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}