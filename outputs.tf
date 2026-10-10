output "container_registries" {
  description = "Map (same keys as var.container_registries) of every output from each container registries created -- see upstream module docs for the full shape."
  value       = module.container_registry
}
