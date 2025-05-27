#!/bin/bash
set -e  # Exit on error

# Set variables
RESOURCE_GROUP1="tfstate-rg-dev"
STORAGE_ACCOUNT1="tfsttstrgeacctkiruludev"
CONTAINER_NAME1="tfstate-dev"
LOCATION="eastus" 

RESOURCE_GROUP2="tfstate-rg-prod"
STORAGE_ACCOUNT2="tfsttstrgacctkiruluprod"
CONTAINER_NAME2="tfstate-prod"

# Create resource group and storage account for DEV
echo "🔧 Creating resource group: $RESOURCE_GROUP1"
az group create --name $RESOURCE_GROUP1 --location $LOCATION

echo "🔧 Creating storage account: $STORAGE_ACCOUNT1"
az storage account create \
  --name $STORAGE_ACCOUNT1 \
  --resource-group $RESOURCE_GROUP1 \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false

echo "🔐 Getting storage account key for $STORAGE_ACCOUNT1"
ACCOUNT_KEY1=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP1 \
  --account-name $STORAGE_ACCOUNT1 \
  --query "[0].value" \
  --output tsv)

echo "📦 Creating blob container: $CONTAINER_NAME1"
az storage container create \
  --name $CONTAINER_NAME1 \
  --account-name $STORAGE_ACCOUNT1 \
  --account-key $ACCOUNT_KEY1

# Create resource group and storage account for PROD
echo "🔧 Creating resource group: $RESOURCE_GROUP2"
az group create --name $RESOURCE_GROUP2 --location $LOCATION

echo "🔧 Creating storage account: $STORAGE_ACCOUNT2"
az storage account create \
  --name $STORAGE_ACCOUNT2 \
  --resource-group $RESOURCE_GROUP2 \
  --location $LOCATION \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-hierarchical-namespace false

echo "🔐 Getting storage account key for $STORAGE_ACCOUNT2"
ACCOUNT_KEY2=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP2 \
  --account-name $STORAGE_ACCOUNT2 \
  --query "[0].value" \
  --output tsv)

echo "📦 Creating blob container: $CONTAINER_NAME2"
az storage container create \
  --name $CONTAINER_NAME2 \
  --account-name $STORAGE_ACCOUNT2 \
  --account-key $ACCOUNT_KEY2

echo "✅ Terraform backend infrastructure setup complete."
