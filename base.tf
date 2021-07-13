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
  // terraform won't run correctly without the below configured secretes and ids
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
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


