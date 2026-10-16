# terraform-azure-compute-acr

Org-standard Terraform wrapper for: **container registries**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-acr" {
  source = "git::https://github.com/engryinker/terraform-azure-compute-acr.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  container_registries = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `container_registries` (container registries)

Wraps [Azure/avm-res-containerregistry-registry/azurerm](https://registry.terraform.io/modules/Azure/avm-res-containerregistry-registry/azurerm/0.8.0) v0.8.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `role_assignment_mode` | `string` | no |  |
| `customer_managed_key` | `any` | no |  |
| `private_endpoints` | `any` | no |  |
| `retry` | `any` | no |  |
| `cache_rules` | `any` | no |  |
| `network_rule_bypass_option` | `string` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `private_endpoints_inherit_lock` | `bool` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `admin_enabled` | `bool` | no |  |
| `georeplications` | `any` | no |  |
| `enable_trust_policy` | `bool` | no |  |
| `resource_types` | `any` | no |  |
| `retention_policy_in_days` | `number` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `lock` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `export_policy_enabled` | `bool` | no |  |
| `network_rule_bypass_for_tasks_enabled` | `bool` | no |  |
| `network_rule_set` | `any` | no |  |
| `quarantine_policy_enabled` | `bool` | no |  |
| `zone_redundancy_enabled` | `bool` | no |  |
| `managed_identities` | `any` | no |  |
| `anonymous_pull_enabled` | `bool` | no |  |
| `data_endpoint_enabled` | `bool` | no |  |
| `credential_sets` | `any` | no |  |
| `scope_maps` | `any` | no |  |
| `sku` | `string` | no |  |
| `role_assignments` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `container_registries` -- map (same keys as the input) of every output from each created container registries.
