data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "container_registry" {
  source   = "Azure/avm-res-containerregistry-registry/azurerm"
  version  = "0.8.0"
  for_each = var.container_registries

  name                                    = each.value.name
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  tags                                    = coalesce(each.value.tags, var.tags)
  enable_telemetry                        = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  role_assignment_mode                    = each.value.role_assignment_mode
  customer_managed_key                    = each.value.customer_managed_key
  private_endpoints                       = each.value.private_endpoints
  retry                                   = each.value.retry
  cache_rules                             = each.value.cache_rules
  network_rule_bypass_option              = each.value.network_rule_bypass_option
  public_network_access_enabled           = each.value.public_network_access_enabled
  private_endpoints_inherit_lock          = each.value.private_endpoints_inherit_lock
  private_endpoints_manage_dns_zone_group = each.value.private_endpoints_manage_dns_zone_group
  admin_enabled                           = each.value.admin_enabled
  georeplications                         = each.value.georeplications
  enable_trust_policy                     = each.value.enable_trust_policy
  resource_types                          = each.value.resource_types
  retention_policy_in_days                = each.value.retention_policy_in_days
  diagnostic_settings                     = each.value.diagnostic_settings
  lock                                    = each.value.lock
  timeouts                                = each.value.timeouts
  export_policy_enabled                   = each.value.export_policy_enabled
  network_rule_bypass_for_tasks_enabled   = each.value.network_rule_bypass_for_tasks_enabled
  network_rule_set                        = each.value.network_rule_set
  quarantine_policy_enabled               = each.value.quarantine_policy_enabled
  zone_redundancy_enabled                 = each.value.zone_redundancy_enabled
  managed_identities                      = each.value.managed_identities
  anonymous_pull_enabled                  = each.value.anonymous_pull_enabled
  data_endpoint_enabled                   = each.value.data_endpoint_enabled
  credential_sets                         = each.value.credential_sets
  scope_maps                              = each.value.scope_maps
  sku                                     = each.value.sku
  role_assignments                        = each.value.role_assignments
}
