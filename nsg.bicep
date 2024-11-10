param location string = 'eastus'
param nsgname string = 'nsg-bicep'

resource nsg 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: nsgname
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowPort22'
        properties: {
          description: 'description'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 350
          direction: 'Inbound'
        }
      }
    ]
  }
}

output nsgId string = nsg.id
