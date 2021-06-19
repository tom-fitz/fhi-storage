terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  environment = "public"
  features {}

  subscription_id = "d02fcefd-b6b5-4e63-ac75-0595cd84e8c7"
  client_id       = "c39340d4-ecc5-4c2a-8336-b154ea0bf005"
  client_secret   = "djqCt2S1b3KQ_uF.ICkbJPLQ_9C97Qahp0"
  tenant_id       = "61812914-4959-44f0-84b1-7035306e7671"
}

resource "azurerm_resource_group" "storage" {
  name     = var.app_name
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_app_service_plan" "furniture-service-plan" {
  name                = "furniture-${var.app_name}-service-plan"
  location            = azurerm_resource_group.storage.location
  resource_group_name = azurerm_resource_group.storage.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_app_service" "furniture-app-service" {
  name                = "furniture-${var.app_name}-service"
  location            = azurerm_resource_group.storage.location
  resource_group_name = azurerm_resource_group.storage.name
  app_service_plan_id = azurerm_app_service_plan.furniture-service-plan.id

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|furniture-app-service/static-site:latest"
    always_on        = "true"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_storage_account" "tf-state" {
  name                     = "fhistoragetfstatestorage"
  location                 = azurerm_resource_group.storage.location
  resource_group_name      = azurerm_resource_group.storage.name
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}


