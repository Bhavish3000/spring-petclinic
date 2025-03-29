terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }

  backend "azurerm" {
    subscription_id = "beee1537-c08f-4311-8404-1cb4b9ed473d"
    resource_group_name = "terraform_storage"
    storage_account_name = "aksstatefile"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "beee1537-c08f-4311-8404-1cb4b9ed473d"
  features {

  }
}