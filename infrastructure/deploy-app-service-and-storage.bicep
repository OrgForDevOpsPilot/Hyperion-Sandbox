// locationの指定。リソースグループのロケーションを利用
param location string = resourceGroup().location

// 環境タイプを指定
@allowed([ 'nonprod', 'prod' ])
param environmentType string

/**
 * @param isDeployStorageAccount ストレージアカウントをデプロイするかどうか
 */
param isDeployStorageAccount bool

param resourceNameSuffix string = uniqueString(resourceGroup().id)

// リソース名の定義
var appServiceAppName = 'testapp-${resourceNameSuffix}'
var appServicePlanName = 'testapp-plan-${environmentType}'
var manualsStorageAccountName = 'testapp${resourceNameSuffix}'

// 環境ごとの���定
var environmentConfigurationMap = {
  nonprod: {
    appServicePlan: {
      sku: {
        name: 'F1'
        capacity: 1
      }
    }
    storageAccount: {
      sku: {
        name: 'Standard_LRS'
      }
    }
  }
  prod: {
    appServicePlan: {
      sku: {
        name: 'S1'
        capacity: 2
      }
    }
    storageAccount: {
      sku: {
        name: 'Standard_ZRS'
      }
    }
  }
}

// App Serviceプランのリソース定義
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: environmentConfigurationMap[environmentType].appServicePlan.sku
}

// App Serviceのリソース定義
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

// ストレージアカウントのリソース定義
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = if (isDeployStorageAccount) {
  name: manualsStorageAccountName
  location: location
  kind: 'StorageV2'
  sku: environmentConfigurationMap[environmentType].storageAccount.sku
}
