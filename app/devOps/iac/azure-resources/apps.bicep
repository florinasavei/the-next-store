param webAppNamespace string = uniqueString(resourceGroup().id)
param EMAILPASSWORD string
param EMAILSENDER string
param SMTPSERVER string
param API_KEY string

var appServicePlanName = toLower('ASP-${webAppNamespace}')
var FEhomeSiteName = toLower('fe-home-${webAppNamespace}')
var FEShopFrontName = toLower('fe-shopfront-${webAppNamespace}')
var FEShopBackOfficeName = toLower('fe-shopback-${webAppNamespace}')
var BEShopName = toLower('be-shop-${webAppNamespace}')
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

// Company Homepage

resource PROD_FEHomepageAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'prod-${FEhomeSiteName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

resource QA_FEHomepageAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'qa-${FEhomeSiteName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

// Shop front-facing website

resource PROD_FEShopFrontAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'prod-${FEShopFrontName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

resource QA_FEShopFrontAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'qa-${FEShopFrontName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

resource PROD_FEShopBackAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'prod-${FEShopBackOfficeName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

resource QA_FEShopBackAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'qa-${FEShopBackOfficeName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'node|18-lts'
      appSettings: [
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT'
          value: 'false'
        }
      ]
    }
  }
}

resource PROD_BEShopAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'prod-${BEShopName}'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOTNET|6.0'
    }
  }
}

resource QA_BEShopAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'qa-${BEShopName}'
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
