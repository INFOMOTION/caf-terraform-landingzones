resource "databricks_group" "groups" {
  for_each = var.databricks_groups

  display_name               = each.value.name
  allow_cluster_create       = try(each.value.allow_cluster_create, true)
  allow_instance_pool_create = try(each.value.allow_instance_pool_create, true)
  databricks_sql_access      = try(each.value.databricks_sql_access, false)
}