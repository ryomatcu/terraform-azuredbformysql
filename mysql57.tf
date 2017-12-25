variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "location" {}
variable "username" {}
variable "password" {}
variable "allowed_ip_start" {}
variable "allowed_ip_end" {}



provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}



#
# Resource Group
#
resource "azurerm_resource_group" "rg" {
    name     = "azure-mysql-rg"
    location = "${var.location}"
}



#
# Azure DB for MySQL
#
resource "azurerm_mysql_server" "mysql" {
    name                = "azure-mysql-sample"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"

    sku {
        name = "MYSQLB50"
        capacity = 50
        tier = "Basic"
    }

    administrator_login = "${var.username}"
    administrator_login_password = "${var.password}"

    version = "5.7"
    storage_mb = "51200"
    ssl_enforcement = "Enabled"
}

resource "azurerm_mysql_firewall_rule" "rule1" {
    name                = "mysql_rule_1"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    server_name         = "${azurerm_mysql_server.mysql.name}"
    start_ip_address    = "${var.allowed_ip_start}"
    end_ip_address      = "${var.allowed_ip_end}"
}
