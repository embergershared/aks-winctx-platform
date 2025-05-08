data "azurerm_client_config" "tenant" {}

# Gather all resources from the Landing Zone Resource Group, to extract the ones needed through filters in locals.tf
data "azurerm_resources" "lz_rg_resource_s" {
  resource_group_name = var.rgLzName
}

data "azurerm_resource_group" "rg_lz" {
  name = var.rgLzName
}
data "azurerm_virtual_network" "vnet-lz" {
  name                = local.lz_vnet_name
  resource_group_name = var.rgLzName
}
data "azurerm_network_security_group" "nsg_lz" {
  name                = local.lz_nsg_name
  resource_group_name = var.rgLzName
}
data "azurerm_route_table" "rt_lz" {
  name                = local.lz_rt_name
  resource_group_name = var.rgLzName
}
data "azurerm_kubernetes_cluster" "aks" {
  name                = local.aks_name #split("/", local.aksId)[8]
  resource_group_name = var.rgLzName   #split("/", local.aksId)[4]
}
#*/
