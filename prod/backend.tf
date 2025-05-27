terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-prod"
    storage_account_name = "tfsttstrgacctkiruluprod"
    container_name       = "tfstate-prod"
    key                  = "prod.terraform.tfstate"
  }
}
