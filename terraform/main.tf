locals {
  nic_name = "Server_NIC"
  pip_name = "Server_PIP"
  vm_name  = "webserver"
  vm_size  = "Standard_B1s"
}
# Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


# Initialized vnet module
module "vnet" {
  source              = "./modules/network/vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on = [
    azurerm_resource_group.rg
  ]

}
# Initialized network security group module
module "sg" {
  source              = "./modules/security/network_security_group"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Associated a security group to the  subnet
resource "azurerm_subnet_network_security_group_association" "sg_sub_assoc" {
  subnet_id                 = module.vnet.subnet_id
  network_security_group_id = module.sg.sg_id
  depends_on = [
    module.sg,
    module.vnet
  ]
}
# Create NIC 
resource "azurerm_network_interface" "server_nic" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.server_pip.id

  }

}



# VM module
module "vm" {
  source              = "./modules/compute/vm"
  vm_name             = local.vm_name
  vm_nic              = azurerm_network_interface.server_nic.id
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = local.vm_size
}
# Public IP address 
resource "azurerm_public_ip" "server_pip" {
  name                = local.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

} 
# Initialized CosmosDB module 
module "db" {
 source = "./modules/storage/cosmosDB"
 location = var.db_location
 resource_group_name = var.resource_group_name

}
