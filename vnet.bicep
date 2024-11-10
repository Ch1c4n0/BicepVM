param location string
param vnetname string
param subnetname1 string
param subnetname2 string
param nsgId string


resource vnet1 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetname
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetname1
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: nsgId
          }
        }
      }
      {
        name: subnetname2
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsgId
          }
        }
      }
    ]
  }
}

output vnetId string = vnet1.id
output vnetName2 string = vnet1.name
output subId string = vnet1.properties.subnets[0].id
