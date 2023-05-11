resource "databricks_secret_scope" "kv" {
  for_each = var.databricks_secret_scopes
  name = each.value.name

  keyvault_metadata {
    resource_id = each.value.keyvault_metadata.resource_id
    dns_name    = each.value.keyvault_metadata.dns_name
  }
}