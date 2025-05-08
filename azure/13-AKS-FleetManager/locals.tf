locals {
  domain_name = {
    akv     = "privatelink.vaultcore.azure.net",
    acr     = "privatelink.azurecr.io",
    aks     = "azmk8s.io"
    contoso = "private.contoso.com"
  }

  # # Existing resources extraction:
  lz_vnet_name = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.Network/virtualNetworks"].0
  lz_nsg_name  = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.Network/networkSecurityGroups"].1
  lz_rt_name   = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.Network/routeTables"].0
  # acr_name             = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.ContainerRegistry/registries"].0
  # kv_name              = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.KeyVault/vaults"].0
  aks_name = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if v.type == "Microsoft.ContainerService/managedClusters"].0
  # storage_account_name = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if(v.type == "Microsoft.Storage/storageAccounts" && lookup(v.tags, "Plan", "AbsentKey") == "08-AzSQL-Data")].0
  # sql_server_name      = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if(v.type == "Microsoft.Sql/servers" && lookup(v.tags, "Plan", "AbsentKey") == "08-AzSQL-Data")].0
  # sql_server_uai_name  = [for v in data.azurerm_resources.lz_rg_resource_s.resources : v.name if(v.type == "Microsoft.ManagedIdentity/userAssignedIdentities" && lookup(v.tags, "Plan", "AbsentKey") == "08-AzSQL-Data")].0

  # # Matching Resource IDs from their data sources
  # vnetLzId          = data.azurerm_virtual_network.vnet-lz.id
  # snetvmId          = data.azurerm_subnet.snet-vm.id
  # acrId             = data.azurerm_container_registry.acr.id
  # akvId             = data.azurerm_key_vault.akv.id
  # aksId             = data.azurerm_kubernetes_cluster.aks.id
  # sql_server_id     = data.azurerm_mssql_server.sql_server.id
  # sql_server_uai_id = data.azurerm_user_assigned_identity.sql_server_uai.id}
}
