
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    var.vm_nic,
  ]
  
#  provisioner "local-exec" {
#     when       = create
#     on_failure = continue
#     command    = "ansible-playbook -i ${azurerm_public_ip.Pip.ip_address}, --private-key ./azureuser.pem ../ansible/playbook.yml -u adminuser --ssh-common-args='-o StrictHostKeyChecking=no'"
#   }
  
  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
