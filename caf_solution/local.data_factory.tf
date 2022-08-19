locals {
  data_factory = {
    data_factory                                 = var.data_factory
    data_factory_pipeline                        = var.data_factory_pipeline
    data_factory_trigger_schedule                = var.data_factory_trigger_schedule
    data_factory_integration_runtime_self_hosted = var.data_factory_integration_runtime_self_hosted
    datasets = {
      azure_blob       = merge(try(var.datasets.azure_blob, {}), try(var.data_factory_datasets.azure_blob, {}))
      cosmosdb_sqlapi  = merge(try(var.datasets.cosmosdb_sqlapi, {}), try(var.data_factory_datasets.cosmosdb_sqlapi, {}))
      delimited_text   = merge(try(var.datasets.delimited_text, {}), try(var.data_factory_datasets.delimited_text, {}))
      http             = merge(try(var.datasets.http, {}), try(var.data_factory_datasets.http, {}))
      json             = merge(try(var.datasets.json, {}), try(var.data_factory_datasets.json, {}))
      mysql            = merge(try(var.datasets.mysql, {}), try(var.data_factory_datasets.mysql, {}))
      postgresql       = merge(try(var.datasets.postgresql, {}), try(var.data_factory_datasets.postgresql, {}))
      sql_server_table = merge(try(var.datasets.sql_server_table, {}), try(var.data_factory_datasets.sql_server_table, {}))
    }
    linked_services = {
      azure_blob_storage     = merge(try(var.data_factory_linked_services.azure_blob_storage, {}), try(var.linked_services.azure_blob_storage, {}),try(var.data_factory_linked_services_azure_blob_storage,{}))
      azure_databricks       = merge(try(var.data_factory_linked_services.azure_databricks, {}), try(var.linked_services.azure_databricks, {}),try(var.data_factory_linked_service_azure_databricks,{}))
      azure_file_storage     = merge(try(var.data_factory_linked_services.azure_file_storage, {}), try(var.linked_services.azure_file_storage, {}),try(var.data_factory_linked_service_azure_file_storage,{}))
      azure_function         = merge(try(var.data_factory_linked_services.azure_function, {}), try(var.linked_services.azure_function, {}),try(var.data_factory_linked_service_azure_function,{}))
      azure_sql_database     = merge(try(var.data_factory_linked_services.azure_sql_database, {}), try(var.linked_services.azure_sql_database, {}),try(var.data_factory_linked_service_azure_sql_database,{}))
      cosmosdb               = merge(try(var.data_factory_linked_services.cosmosdb, {}), try(var.linked_services.cosmosdb, {}),try(var.data_factory_linked_service_cosmosdb,{}))
      data_lake_storage_gen2 = merge(try(var.data_factory_linked_services.data_lake_storage_gen2, {}), try(var.linked_services.data_lake_storage_gen2, {}),try(var.data_factory_linked_services_data_lake_storage_gen2,{}))
      key_vault              = merge(try(var.data_factory_linked_services.key_vault, {}), try(var.linked_services.key_vault, {}),try(var.data_factory_linked_service_key_vault,{}))
      mysql                  = merge(try(var.data_factory_linked_services.mysql, {}), try(var.linked_services.mysql, {}),try(var.data_factory_linked_service_mysql,{}))
      postgresql             = merge(try(var.data_factory_linked_services.postgresql, {}), try(var.linked_services.postgresql, {}),try(var.data_factory_linked_service_postgresql,{}))
      sftp                   = merge(try(var.data_factory_linked_services.sftp, {}), try(var.linked_services.sftp, {}),try(var.data_factory_linked_service_sftp,{}))
      sql_server             = merge(try(var.data_factory_linked_services.sql_server, {}), try(var.linked_services.sql_server, {}),try(var.data_factory_linked_service_sql_server,{}))
      web                    = merge(try(var.data_factory_linked_services.web, {}), try(var.linked_services.web, {}),try(var.data_factory_linked_service_web,{}))
    }
  }
}
