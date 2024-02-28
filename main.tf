terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
}

provider "azurerm" {
  features {}
 }

 resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}



resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.prefix}stoacc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2" 

  static_website {
    index_document = "index.html"
  }

}
resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.prefix}cont"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "azurerm_storage_blob" {
  name                   = "index,html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  content_type           = "text/html"
  source_content         = " <h1> thisncontent is deployed using terraform </h1>"
}
