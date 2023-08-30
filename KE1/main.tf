 terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "azurerm_resource_group" "resGroup" {
  location = var.resource_group_location
  name     = var.resource_group_name_prefix
}


resource "azurerm_app_service_plan" "resGroup" {
  name                = var.app_service_plan
  location            = azurerm_resource_group.resGroup.location
  resource_group_name = azurerm_resource_group.resGroup.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "resGroup" {
  name                = var.app_service_name
  location            = azurerm_resource_group.resGroup.location
  resource_group_name = azurerm_resource_group.resGroup.name
  app_service_plan_id = azurerm_app_service_plan.resGroup.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
