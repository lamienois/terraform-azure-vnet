resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}-rg"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-vnet"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  address_space       = ["${var.vnet_cidr}"]
  tags                = "${var.tags}"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.subnet_names[count.index]}-nsg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  tags                = "${var.tags}"
  count               = "${length(var.subnet_names)}"
}

resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[count.index]}-sub"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${azurerm_resource_group.resource_group.name}"
  address_prefix            = "${var.subnet_prefixes[count.index]}"
  network_security_group_id = "${element(azurerm_network_security_group.nsg.*.id, count.index)}"
  count                     = "${length(var.subnet_names)}"
}
