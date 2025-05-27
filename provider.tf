terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.30.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.9.0"

  

}
# configures the provider

provider "azurerm" {
  features {}
  subscription_id = "4ce7faa1-7cf4-46d0-9c97-4110514b1d86"   # your subscription id
  tenant_id       = "31ead55e-147c-4aed-b88d-0de5da5178b4"   # your tenant id

}
provider "azuread" {

}
