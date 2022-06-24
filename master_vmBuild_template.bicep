@description('Username for the Virtual Machine.')
param adminUsername string = ''

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string = ''


@description('Available Publishers')
@allowed([
'Choose VM publisher'
'MicrosoftWindowsServer'
'canonical'
'Oracle'
])
param publisher_type string = 'Choose VM publisher'


@description('Available Offers')
@allowed([
'Choose VM offer'
'WindowsServer'
'0001-com-ubuntu-server-focal'
'Oracle-Linux'
])
param offer_type string = 'Choose VM offer'

@description('Available OS Sku')
@allowed([
  'Choose VM version'
  '2022-datacenter-g2'
  '20_04-lts-gen2'
  '81-gen2'

])
param OSVersion string =  'Choose VM version'

@description('Size of the virtual machine.')
param vmSize string = 'Standard_D2s_v3'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the virtual machine.')
param vmName string = ''

@description('Available Vnets')
@allowed([
'Choose existing VNet'

])
param virtualNetworkName_var string = 'Choose existing VNet'

@description('Available Subnets')
@allowed([
'Choose a subnet'

])
param subnetName string = 'Choose a subnet'



@description('AdressPrefix for existing vnet')
@allowed([
'Choose AdressPrefix for Vnet'

])
param addressPrefix string = 'Choose AdressPrefix for Vnet'

@description('AdressPrefix for existing subnet')
@allowed([
'Choose AdressPrefix for subnet'

])
param subnetPrefix string = 'Choose AdressPrefix for subnet'

var nicName_var = vmName


//Tasks:

resource virtualNetworkName 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: virtualNetworkName_var
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix

      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          // networkSecurityGroup: {
          //   id: networkSecurityGroupName.id
          // }
        }
      }
    ]
  }
}

resource nicName 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name:   '${nicName_var}-NIC'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
     


          
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName_var, subnetName)
          }
        }
      }
    ]
  }
  dependsOn: [

    virtualNetworkName
  ]
}

resource vmName_resource 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: publisher_type
        offer: offer_type
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: [
        {
          diskSizeGB: 30
          lun: 0
          createOption: 'Empty'
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicName.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false

      }
    }
  }
}


