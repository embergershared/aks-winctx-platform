/*
# az CLI command:
## Create
az fleet create --resource-group "rg-use2-391575-s3-akswincont-avm-lz" --name "aks-lz-fleet-snko" --location eastus2 --enable-hub --enable-private-cluster --enable-managed-identity --agent-subnet-id "/subscriptions/4c88693f-5cc9-4f30-9d1e-d58d4221cf25/resourceGroups/rg-use2-391575-s3-akswincont-avm-lz/providers/Microsoft.Network/virtualNetworks/vnet-lz/subnets/snet-aks-fleet"
## Notes:
- subnet must allow 29 pre-allocated IPs
- need to create manually the Private DNS Zone link between the VNet the hub cluster is deployed and the Fleet manager Private DNS zone


# Join the first member cluster
az fleet member create --resource-group "rg-use2-391575-s3-akswincont-avm-lz" --fleet-name "aks-lz-fleet-snko" --name "aks-lz-hcqt" --member-cluster-id "/subscriptions/4c88693f-5cc9-4f30-9d1e-d58d4221cf25/resourceGroups/rg-use2-391575-s3-akswincont-avm-lz/providers/Microsoft.ContainerService/managedClusters/aks-lz-hcqt"
*/

module "avm-res-network-vnet-aks-subnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"
  version = "0.4.0"

  name = "snet-aks-fleet"
  virtual_network = {
    resource_id = data.azurerm_virtual_network.vnet-lz.id
  }
  address_prefixes = [var.snetFleetMgrAddr]
  route_table = {
    id = data.azurerm_route_table.rt_lz.id
  }
  network_security_group = {
    id = data.azurerm_network_security_group.nsg_lz.id
  }
}

resource "azurerm_kubernetes_fleet_manager" "fleet_mgr" {
  name                = "aks-lz-fleet-snko"
  resource_group_name = var.rgLzName # data.azurerm_resource_group.rg.name
  location            = var.location # data.azurerm_resource_group.rg.location
  tags                = merge(var.base_tags, var.plan_tags)
}

resource "azurerm_kubernetes_fleet_member" "aks-lz-hcqt" {
  name = data.azurerm_kubernetes_cluster.aks.name

  kubernetes_cluster_id = data.azurerm_kubernetes_cluster.aks.id
  kubernetes_fleet_id   = azurerm_kubernetes_fleet_manager.fleet_mgr.id
}
# #*/
