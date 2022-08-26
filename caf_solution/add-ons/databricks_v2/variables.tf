# Map of the remote data state for lower level
variable "lower_storage_account_name" {}
variable "lower_container_name" {}
variable "lower_resource_group_name" {}

variable "tfstate_storage_account_name" {}
variable "tfstate_container_name" {}
variable "tfstate_key" {}
variable "tfstate_resource_group_name" {}

variable "global_settings" {
  default = {}
}

variable "logged_user_objectId" {
  description = "Used to set access policies based on the value 'logged_in_user'. Can only be used in interactive execution with vscode."
  default     = null
}
variable "logged_aad_app_objectId" {
  description = "Used to set access policies based on the value 'logged_in_aad_app'"
  default     = null
}


variable "landingzone" {
  default = ""
}
variable "databricks_workspace" {
  description = "Azure Databricks workspace where the resources will be created"
}
variable "databricks_clusters" {
  description = "This resource allows you to create, update, and delete clusters."
  default     = {}
}
variable "databricks_groups" {
  description = "This resource allows you to create user groups."
  default     = {}
}
variable "databricks_service_principals" {
  description = "This resource allows you to create user groups."
  default     = {}
}