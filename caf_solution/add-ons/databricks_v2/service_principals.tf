
# Option 1+2: Hard Coded + Key Vault Reference
resource "databricks_service_principal" "sp" {
  for_each = {
    for key, value in var.databricks_service_principals : key => value
    if can(value.keyvault) || can(value.application_id)
  }

  display_name = try(each.value.name, each.key)
  application_id = try(data.azurerm_key_vault_secret.application_id[each.key].value, each.value.application_id)
}

data "azurerm_key_vault_secret" "application_id" {
  for_each = {
    for key, value in var.databricks_service_principals : key => value
    if can(value.keyvault)
  }
  name         = each.value.keyvault.secret_name
  key_vault_id = local.remote.keyvaults[each.value.keyvault.lz_key][each.value.keyvault.key].id
}

# Option 3: Reference to Resource Key from Landing Zone
# Add more Resource in "locals.remote_tfstate.tf" to enable e.g. ML Studio MSI

resource "databricks_service_principal" "msi" {
  for_each = {
    for key, value in var.databricks_service_principals : key => value
    if can(value.resource_key)
  }
  # Name is Name of the Resource - defaults to Name Variable or Config-Keyname 
  display_name = try(local.remote.data_factory[each.value.lz_key][each.value.key].name, each.value.name, each.key)
  application_id = local.remote.data_factory[each.value.lz_key][each.value.key].identity[0].principal_id
}