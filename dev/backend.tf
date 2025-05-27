terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-dev"
    storage_account_name = "tfsttstrgeacctkiruludev"
    container_name       = "tfstate-dev"
    key                  = "dev.terraform.tfstate"
  }
}
