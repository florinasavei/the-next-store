param storageAccountName string

resource prodStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'prod${storageAccountName}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource qaStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'qa${storageAccountName}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
