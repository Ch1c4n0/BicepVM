param location string = 'eastus'
param vnetname string = 'vnet-bicep'
param subnetname1 string = 'SubServer'
param subnetname2 string = 'SubClient'
param vmname1 string = 'vm-bicep'

@description('Username for the Virtual Machine.')
param adminUsername string

@description('Password for the Virtual Machine.')
@minLength(6)
@secure()
param adminPassword string


module vnetmodule 'vnet.bicep' = {
  name: 'vnetmodule'
  params: {
    location: location
    vnetname: vnetname
    subnetname1: subnetname1
    subnetname2: subnetname2
    nsgId: nsgmodule.outputs.nsgId
  }
  dependsOn: [
    nsgmodule
  ]
}

module nsgmodule 'nsg.bicep' = {
  name: 'nsgmodule'
  params: {
    location: location
    nsgname: 'nsg-bicep'
  }
  
}

module vmmodule 'vm.bicep' = {
  name: 'vmmodule'
  params: {
    location: location
    adminPassword: adminPassword
    adminUsername: adminUsername
    vmname: vmname1
    subnetId: vnetmodule.outputs.subId
   
    
  }
  dependsOn: [
    vnetmodule
  ]
}
