# Configure the Microsoft Azure Provider
provider "azurerm" {
}

# Create a resource group
resource "azurerm_resource_group" "udemy" {
  name     = "VNet1"
  location = "East US"
}

# Create a virtual network in the udemy resource group
resource "azurerm_virtual_network" "udemy" {
  name                = "WebServers"
  resource_group_name = "${azurerm_resource_group.udemy.name}"
  location            = "${azurerm_resource_group.udemy.location}"
  address_space       = ["10.0.0.0/16"]
 }

# Create web servers NSG and rules
resource "azurerm_network_security_group" "web_servers" {
  name                = "WebserversNSG"
  location            = "${azurerm_resource_group.udemy.location}"
  resource_group_name = "${azurerm_resource_group.udemy.name}"
}

resource "azurerm_network_security_rule" "web_svr_rule1" {
  name                        = "webservers-allow-outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.web_servers.name}"
}
resource "azurerm_network_security_rule" "web_svr_rdp" {
  name                        = "webservers-rdp"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "3389"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.web_servers.name}"
}
resource "azurerm_network_security_rule" "web_svr_http" {
  name                        = "webservers-http"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.web_servers.name}"
}
resource "azurerm_network_security_rule" "web_svr_https" {
  name                        = "webservers-https"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.web_servers.name}"
}
###################

# Create app servers NSG and rules
resource "azurerm_network_security_group" "app_servers" {
  name                = "AppserversNSG"
  location            = "${azurerm_resource_group.udemy.location}"
  resource_group_name = "${azurerm_resource_group.udemy.name}"
}

resource "azurerm_network_security_rule" "app_svr_rule1" {
  name                        = "appservers-allow-outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.app_servers.name}"
}
resource "azurerm_network_security_rule" "app_svr_rdp" {
  name                        = "appservers-rdp"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "3389"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.app_servers.name}"
}
resource "azurerm_network_security_rule" "app_svr_http" {
  name                        = "appservers-http"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.app_servers.name}"
}
resource "azurerm_network_security_rule" "app_svr_https" {
  name                        = "appservers-https"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "*"
  source_address_prefix       = "${var.home_ip}"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.udemy.name}"
  network_security_group_name = "${azurerm_network_security_group.app_servers.name}"
}
#################

# Create subnets
resource "azurerm_subnet" "webservers" {
  name                 = "WebServers"
  resource_group_name  = "${azurerm_resource_group.udemy.name}"
  virtual_network_name = "${azurerm_virtual_network.udemy.name}"
  address_prefix       = "10.0.1.0/24"
  network_security_group_id = "${azurerm_network_security_group.web_servers.id}"
}
resource "azurerm_subnet" "appservers1" {
  name                 = "AppServers1"
  resource_group_name  = "${azurerm_resource_group.udemy.name}"
  virtual_network_name = "${azurerm_virtual_network.udemy.name}"
  address_prefix       = "10.0.2.0/24"
  network_security_group_id = "${azurerm_network_security_group.app_servers.id}"
}
resource "azurerm_subnet" "firewall" {
  name                 = "Firewall"
  resource_group_name  = "${azurerm_resource_group.udemy.name}"
  virtual_network_name = "${azurerm_virtual_network.udemy.name}"
  address_prefix       = "10.0.4.0/24"
}
