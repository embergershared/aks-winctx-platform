output "resources" {
  # value = data.azurerm_resources.lz_rg_resource_s.resources
  value = [for v in data.azurerm_resources.lz_rg_resource_s.resources : [v.name, v.type]]
}
