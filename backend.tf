terraform {
  backend "azurerm" {
    resource_group_name = "tf-state-rg"
    storage_account_name = "tfstatestorageacc9"
    container_name = "tf-state-container"
    key = "terraform.tfstate"
  }
}