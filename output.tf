# resource group outputs
output "resource_group_id" {
  value = "${azurerm_resource_group.resource_group.id}"
}

output "resource_group_name" {
  value = "${azurerm_resource_group.resource_group.name}"
}

output "resource_group_location" {
  value = "${azurerm_resource_group.resource_group.location}"
}

# vnet outputs
output "vnet_id" {
  value = "${azurerm_virtual_network.vnet.id}"
}

output "vnet_name" {
  value = "${azurerm_virtual_network.vnet.name}"
}

output "vnet_resource_group_name" {
  value = "${azurerm_virtual_network.vnet.resource_group_name}"
}

output "vnet_location" {
  value = "${azurerm_virtual_network.vnet.location}"
}

output "vnet_address_space" {
  value = "${azurerm_virtual_network.vnet.address_space}"
}

# Subnet outputs
output "subnet_ids" {
  value = "${azurerm_subnet.subnet.*.id}"
}

output "subnet_names" {
  value = "${azurerm_subnet.subnet.*.name}"
}

output "subnet_resource_group_name" {
  value = "${azurerm_subnet.subnet.*.resource_group_name}"
}

output "subnet_vnet" {
  value = "${azurerm_subnet.subnet.*.virtual_network_name}"
}

output "subnet_prefixes" {
  value = "${azurerm_subnet.subnet.*.address_prefix}"
}

# nsg output
output "ngs_ids" {
  value = "${azurerm_network_security_group.nsg.*.id}"
}
