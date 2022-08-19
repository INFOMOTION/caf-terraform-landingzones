variable "data_factory" {
  default = {}
}
variable "data_factory_pipeline" {
  default = {}
}
variable "data_factory_trigger_schedule" {
  default = {}
}
variable "data_factory_integration_runtime_self_hosted" {
  default = {}
}
variable "datasets" {
  default = {
    # azure_blob
    # cosmosdb_sqlapi
    # delimited_text
    # http
    # json
    # mysql
    # postgresql
    # sql_server_table
  }
}
variable "data_factory_datasets" {
  default = {
    # azure_blob
    # cosmosdb_sqlapi
    # delimited_text
    # http
    # json
    # mysql
    # postgresql
    # sql_server_table
  }
}
variable "linked_services" {
  default = {
    # azure_blob_storage
  }
}
variable "data_factory_linked_services" {
  default = {
    # azure_blob_storage
    # azure_databricks
    # azure_file_storage
    # azure_function
    # azure_sql_database
    # cosmosdb
    # data_lake_storage_gen2
    # key_vault
    # mysql
    # postgresql
    # sftp
    # sql_server
    # web
  }
}
variable "data_factory_linked_services_azure_blob_storage" {
  default = {}
}
variable "data_factory_linked_service_azure_databricks" {
  default = {}
}
variable "data_factory_linked_service_azure_file_storage" {
  default = {}
}
variable "data_factory_linked_service_azure_function" {
  default = {}
}
variable "data_factory_linked_service_azure_sql_database" {
  default = {}
}
variable "data_factory_linked_service_cosmosdb" {
  default = {}
}
variable "data_factory_linked_services_data_lake_storage_gen2" {
  default = {}
}
variable "data_factory_linked_service_key_vault" {
  default = {}
}
variable "data_factory_linked_service_mysql" {
  default = {}
}
variable "data_factory_linked_service_postgresql" {
  default = {}
}
variable "data_factory_linked_service_sftp" {
  default = {}
}
variable "data_factory_linked_service_sql_server" {
  default = {}
}
variable "data_factory_linked_service_web" {
  default = {}
}