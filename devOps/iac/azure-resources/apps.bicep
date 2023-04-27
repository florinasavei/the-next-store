param webAppNamespace string = uniqueString(resourceGroup().id)
param EMAILPASSWORD string
param EMAILSENDER string
param SMTPSERVER string
param API_KEY string

var appServicePlanName = toLower('ASP-${webAppNamespace}')
var FEwebSiteName = toLower('fe-web-${webAppNamespace}')
var BEwebSiteName = toLower('be-web-${webAppNamespace}')
var BEFuncEmailSenerName = toLower('be-mail-${webAppNamespace}')


resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: resourceGroup().location
  properties: {
    reserved: true
  }
  sku: {
    name: 'B1'
  }
  kind: 'linux'
}

resource FEappService 'Microsoft.Web/sites@2020-06-01' = {
  name: FEwebSiteName
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
    }
  }
}

resource BEappService 'Microsoft.Web/sites@2020-06-01' = {
  name: BEwebSiteName
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOTNET|6.0'
    }
  }
}

resource mailSenderFunction 'Microsoft.Web/sites@2021-02-01' = {
  name: BEFuncEmailSenerName
  location: resourceGroup().location
  kind: 'functionapp,linux,container'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOCKER|asaveiflorin/sampleazurefunction-mail-sender:latest'
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://index.docker.io/v1/'
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'UseDevelopmentStorage=true'
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'EMAILPASSWORD'
          value: EMAILPASSWORD
        }
        {
          name: 'EMAILSENDER'
          value: EMAILSENDER
        }
        {
          name: 'SMTPSERVER'
          value: SMTPSERVER
        }
        {
          name: 'API_KEY'
          value: API_KEY
        }
      ]
    }
  }
}










