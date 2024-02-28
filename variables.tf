variable "prefix" {
    
}

variable "location" {
  
}

variable "application_name" {
  type = string
}

variable "environments" {
    type = list(string)
  
}

variable "azure_credentials" {
  type = map(object(

    {
        client_id = string
        client_secret = string
        tenant_id = string
        subscription_id = string
    }


  ))
}

variable "azure_backend" {
    type = map(object({
    resource_group_name = "tf-state-rg"
    storage_account_name = "tfstatestorageacc9"
    container_name = "tf-state-container"
    key = "terraform.tfstate"

    }))
  
}