variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "container_registries" {
  description = "Map of container registries to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-containerregistry-registry/azurerm v0.8.0 (https://registry.terraform.io/modules/Azure/avm-res-containerregistry-registry/azurerm/0.8.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                    = string
    tags                                    = optional(map(string))
    enable_telemetry                        = optional(bool)
    role_assignment_mode                    = optional(string, null)
    customer_managed_key                    = optional(any, null)
    private_endpoints                       = optional(any, null)
    retry                                   = optional(any, null)
    cache_rules                             = optional(any, null)
    network_rule_bypass_option              = optional(string, null)
    public_network_access_enabled           = optional(bool, null)
    private_endpoints_inherit_lock          = optional(bool, null)
    private_endpoints_manage_dns_zone_group = optional(bool, null)
    admin_enabled                           = optional(bool, null)
    georeplications                         = optional(any, null)
    enable_trust_policy                     = optional(bool, null)
    resource_types                          = optional(any, null)
    retention_policy_in_days                = optional(number, null)
    diagnostic_settings                     = optional(any, null)
    lock                                    = optional(any, null)
    timeouts                                = optional(any, null)
    export_policy_enabled                   = optional(bool, null)
    network_rule_bypass_for_tasks_enabled   = optional(bool, null)
    network_rule_set                        = optional(any, null)
    quarantine_policy_enabled               = optional(bool, null)
    zone_redundancy_enabled                 = optional(bool, null)
    managed_identities                      = optional(any, null)
    anonymous_pull_enabled                  = optional(bool, null)
    data_endpoint_enabled                   = optional(bool, null)
    credential_sets                         = optional(any, null)
    scope_maps                              = optional(any, null)
    sku                                     = optional(string, null)
    role_assignments                        = optional(any, null)
  }))
  default = {}
}
