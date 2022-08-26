output "clusters" {
  value = databricks_cluster.clusters
}
output "groups" {
  value = databricks_group.groups
}
output "service_principals" {
  value = databricks_service_principal.sp
  sensitive = true
}
output "managed_identities" {
  value = databricks_service_principal.msi
  sensitive = true
}