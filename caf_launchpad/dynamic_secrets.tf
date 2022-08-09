
module "dynamic_keyvault_secrets" {
  
  # source  = "aztfmod/caf/azurerm//modules/security/dynamic_keyvault_secrets"
  # version = "5.5.5"
  
  #source = "../aztfmod/modules/security/dynamic_keyvault_secrets"

  source = "git::https://github.com/INFOMOTION/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=5.6.0-patch"

  for_each = try(var.dynamic_keyvault_secrets, {})

  settings = each.value
  keyvault = module.launchpad.keyvaults[each.key]
  objects  = module.launchpad
}
