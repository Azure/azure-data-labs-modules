# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine

resource "azurerm_virtual_machine" "adl_vm" {
  name                             = "wvm-${var.basename}"
  location                         = var.location
  resource_group_name              = var.resource_group_name
  network_interface_ids            = [azurerm_network_interface.vm_nic[0].id]
  vm_size                          = "Standard_DS3_v2"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }
  os_profile {
    computer_name  = var.jumphost_username // make name unique
    admin_username = var.jumphost_username
    admin_password = var.jumphost_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
  identity {
    type = "SystemAssigned"
  }
  storage_os_disk {
    name              = "disk-${var.basename}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "vmpip-${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"

  count = var.module_enabled && !var.is_private_endpoint ? 1 : 0
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "configuration"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = !var.is_private_endpoint ? azurerm_public_ip.vm_pip[0].id : null
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_network_security_group" "vm_nsg" {
  name                = "nsg-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rule {
    name                       = "RDP"
    priority                   = 1010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 3389
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_network_interface_security_group_association" "vm_nsg_association" {
  network_interface_id      = azurerm_network_interface.vm_nic[0].id
  network_security_group_id = azurerm_network_security_group.vm_nsg[0].id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "vm_schedule" {
  virtual_machine_id    = azurerm_virtual_machine.adl_vm[0].id
  location              = var.location
  enabled               = true
  daily_recurrence_time = "2000"
  timezone              = "W. Europe Standard Time"
  notification_settings {
    enabled = false
  }

  count = var.module_enabled ? 1 : 0
}
