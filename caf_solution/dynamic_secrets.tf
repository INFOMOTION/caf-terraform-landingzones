module "dynamic_keyvault_secrets" {
  #source = "../aztfmod/modules/security/dynamic_keyvault_secrets"
  source = "../../terraform-azurerm-caf/modules/security/dynamic_keyvault_secrets"

  #source = "git::https://github.com/INFOMOTION/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=5.6.0-patch"

  for_each = {
    for keyvault_key, secrets in try(var.dynamic_keyvault_secrets, {}) : keyvault_key => {
      for key, value in secrets : key => value
      if try(value.value, null) == null
    }
  }

  settings = each.value
  keyvault = module.solution.keyvaults[each.key]
  
  objects  = module.solution
  remote_objects  = local.remote
}

/* 
Use Remote Dynamic KeyVault Configuration to allow creation of Secrets in remote KeyVaults based on LZ_Key.
If no LZ_KEY is given, the current KeyVaults can be written to.

Example: 

remote_dynamic_keyvault_secrets = {
  local_secrets = {
    keyvault = {
      key = "my-local-keyvault"
    }
    secrets = {
      subscription_id = {
        output_key = "client_config"
        attribute_key = "subscription_id"
        secret_name   = "subscription-id"
      }
    }
  }
  remote_secrets = {
    keyvault = {
      lz_key = "remote-config"
      key    = "my-remote-keyvault"
    }
    secrets = {
      subscription_id = {
        output_key = "client_config"
        attribute_key = "subscription_id"
        secret_name   = "subscription-id"
      }
    }
  }
}
 */

module "remote_dynamic_keyvault_secrets" {
  #source = "../aztfmod/modules/security/dynamic_keyvault_secrets"
  source = "../../terraform-azurerm-caf/modules/security/dynamic_keyvault_secrets"

  #source = "git::https://github.com/INFOMOTION/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=5.6.0-patch"

  for_each = {
    for keyvault_key, secrets in try(var.remote_dynamic_keyvault_secrets, {}) : keyvault_key => {
      for key, value in secrets : key => value
      if try(value.value.keyvault, null) == null
    }
  }

  settings = each.value.secrets
  # If LZ_KEY provided, search KeyVault inside remote Objects (local.remote) - if LZ_KEY not provided, use local KeyVault
  keyvault = can(each.value.keyvault.lz_key) || can(each.value.keyvault_lz_key) ? local.remote["keyvaults"][try(each.value.keyvault.lz_key, each.value.keyvault_lz_key)][try(each.value.keyvault.key, each.value.keyvault_key, each.key)] : module.solution.keyvaults[try(each.value.keyvault.key, each.value.keyvault_key, each.key)]
  
  objects         = module.solution
  remote_objects  = local.remote
}