@description('Specifies the location for resources.')
param location string = 'westeurope'
param EMAILPASSWORD string
param EMAILSENDER string
param SMTPSERVER string
param API_KEY string


targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'the-store-rg'
  location: location
}

module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: rg    // Deployed in the scope of resource group we created above
  params: {
    storageAccountName: 'theflostoredev'
  }
}


module apps './apps.bicep' = {
  name: 'appsDeployment'
  scope: rg    // Deployed in the scope of resource group we created above
  params:{
    webAppNamespace: 'theflostoredev'
    EMAILPASSWORD: EMAILPASSWORD
    EMAILSENDER: EMAILSENDER
    SMTPSERVER: SMTPSERVER
    API_KEY: API_KEY
  }
}
