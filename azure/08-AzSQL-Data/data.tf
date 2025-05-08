data "azurerm_virtual_network" "vnet-lz" {
  count               = var.deployingAllInOne == true ? 0 : 1
  name                = var.vnetLzName
  resource_group_name = var.rgLzName
}

data "azurerm_subnet" "snet-spe" {
  count                = var.deployingAllInOne == true ? 0 : 1
  name                 = "snet-spe"
  virtual_network_name = var.vnetLzName
  resource_group_name  = var.rgLzName
}

data "azurerm_private_dns_zone" "dnszone-sql" {
  count               = var.deployingAllInOne == true ? 0 : 1
  name                = local.domain_name.sql
  resource_group_name = var.rgLzName
}

data "azurerm_key_vault" "akv" {
  count               = var.deployingAllInOne == true ? 0 : 1
  name                = var.akvName
  resource_group_name = var.rgLzName
}
