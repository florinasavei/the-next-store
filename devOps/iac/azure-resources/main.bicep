@description('Specifies the location for resources.')
param location string = 'westeurope'


targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'the-store-rg'
  location: location
}

module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: rg    // Deployed in the scope of resource group we created above
  params: {
    storageAccountName: 'theflorinstoredev'
  }
}
