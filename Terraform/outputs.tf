output "resource_group_name" {
  description = "Name of project Resource group"
  value       = module.AKS_SPC.resource_group_name
}

output "resource_group_id" {
  description = "ID of project resource group"
  value       = module.AKS_SPC.resource_group_id
}

output "resource_group_location" {
  description = "Location of project resource group"
  value       = module.AKS_SPC.resource_group_location
}

output "cluster_name" {
  description = "Name of the cluster"
  value       = module.AKS_SPC.cluster_name
}

output "cluster_credentials" {
  description = "Command to get the configuration details of te cluster"
  value       = module.AKS_SPC.cluster_credentials
}