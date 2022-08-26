terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

locals {
  azure_workspace_resource = local.remote.databricks_workspaces[var.databricks_workspace.lz_key][var.databricks_workspace.key]
}

provider "databricks" {
  host = local.azure_workspace_resource.workspace_url
}
