@description('Username for the Virtual Machine.')
param adminUsername string = 'kapsch'

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
'LA-BO-S-S-DMZ-VN'
'LA-BO-S-S-TRU-VN'
'LA-BO-S-S-RES-VN'
'LA-BO-S-S-ACC-VN'
'LA-BO-S-S-CDM-VN'
'LA-BO-S-S-CTR-VN'
'LA-BO-S-S-CRE-VN'
'LA-BO-S-S-CAC-VN'
'LA-HT-S-S-DMZ-VN'
'LA-HT-S-S-TRU-VN'
'LA-BO-S-N-DMZ-VN'
'LA-BO-S-N-TRU-VN'
'LA-BO-S-N-RES-VN'
'LA-BO-S-N-ACC-VN'
'LA-BO-S-N-CDM-VN'
'LA-BO-S-N-CTR-VN'
'LA-BO-S-N-CRE-VN'
'LA-BO-S-N-CAC-VN'
'LA-HT-S-N-DMZ-VN'
'LA-HT-S-N-TRU-VN'
])
param virtualNetworkName_var string = 'Choose existing VNet'

@description('Available Subnets')
@allowed([
'Choose a subnet'
'LA-BO-S-S-DMZ'
'LA-BO-S-S-BWS'
'LA-BO-S-S-CBS'
'LA-BO-S-S-DWS'
'LA-BO-S-S-IVS'
'LA-BO-S-S-JGS'
'LA-BO-S-S-KSH'
'LA-BO-S-S-MSS'
'LA-BO-S-S-CBD'
'LA-BO-S-S-DWD'
'LA-BO-S-S-LRD'
'LA-BO-S-S-RPD'
'LA-BO-S-S-BWP'
'LA-BO-S-S-NPS'
'LA-BO-S-S-CDM'
'LA-BO-S-S-SWS'
'LA-BO-S-S-SWD'
'LA-BO-S-S-PPS'
'LA-BO-S-S-SWP'
'LA-HT-S-S-DMZ'
'LA-HT-S-S-DVS'
'LA-HT-S-S-HAS'
'LA-HT-S-S-VAS'
'LA-HT-S-S-VOS'
'LA-HT-S-S-HBD'
'LA-HT-S-S-HWD'
'LA-HT-S-S-LNS'
'LA-BO-S-N-DMZ'
'LA-BO-S-N-BWS'
'LA-BO-S-N-CBS'
'LA-BO-S-N-DWS'
'LA-BO-S-N-IVS'
'LA-BO-S-N-JGS'
'LA-BO-S-N-KSH'
'LA-BO-S-N-MSS'
'LA-BO-S-N-CBD'
'LA-BO-S-N-DWD'
'LA-BO-S-N-LRD'
'LA-BO-S-N-RPD'
'LA-BO-S-N-BWP'
'LA-BO-S-N-NPS'
'LA-BO-S-N-CDM'
'LA-BO-S-N-SWS'
'LA-BO-S-N-SWD'
'LA-BO-S-N-PPS'
'LA-BO-S-N-SWP'
'LA-HT-S-N-DMZ'
'LA-HT-S-N-DVS'
'LA-HT-S-N-HAS'
'LA-HT-S-N-VAS'
'LA-HT-S-N-VOS'
'LA-HT-S-N-HBD'
'LA-HT-S-N-HWD'
'LA-HT-S-N-LNS'
])
param subnetName string = 'Choose a subnet'



@description('AdressPrefix for existing vnet')
@allowed([
'Choose AdressPrefix for Vnet'
'10.62.32.0/24'
'10.62.33.0/24'
'10.62.34.0/24'
'10.62.35.0/24'
'10.62.36.0/24'
'10.62.37.0/24'
'10.62.38.0/24'
'10.62.39.0/24'
'10.62.40.0/24'
'10.62.41.0/24'
'10.62.48.0/24'
'10.62.49.0/24'
'10.62.50.0/24'
'10.62.51.0/24'
'10.62.52.0/24'
'10.62.53.0/24'
'10.62.54.0/24'
'10.62.55.0/24'
'10.62.56.0/24'
'10.62.57.0/24'
])
param addressPrefix string = 'Choose AdressPrefix for Vnet'

@description('AdressPrefix for existing subnet')
@allowed([
'Choose AdressPrefix for subnet'
'10.62.32.0/24'
'10.62.33.0/28'
'10.62.33.16/28'
'10.62.33.32/28'
'10.62.33.48/28'
'10.62.33.64/28'
'10.62.33.80/28'
'10.62.33.96/28'
'10.62.34.0/28'
'10.62.34.16/28'
'10.62.34.32/28'
'10.62.34.48/28'
'10.62.35.0/28'
'10.62.35.16/28'
'10.62.36.0/24'
'10.62.37.0/28'
'10.62.38.0/28'
'10.62.39.0/28'
'10.62.39.16/28'
'10.62.40.0/24'
'10.62.41.0/28'
'10.62.41.16/28'
'10.62.41.32/28'
'10.62.41.48/28'
'10.62.41.64/28'
'10.62.41.80/28'
'10.62.41.96/28'
'10.62.48.0/24'
'10.62.49.0/28'
'10.62.49.16/28'
'10.62.49.32/28'
'10.62.49.48/28'
'10.62.49.64/28'
'10.62.49.80/28'
'10.62.49.96/28'
'10.62.50.0/28'
'10.62.50.16/28'
'10.62.50.32/28'
'10.62.50.48/28'
'10.62.51.0/28'
'10.62.51.16/28'
'10.62.52.0/24'
'10.62.53.0/28'
'10.62.54.0/28'
'10.62.55.0/28'
'10.62.55.16/28'
'10.62.56.0/24'
'10.62.57.0/28'
'10.62.57.16/28'
'10.62.57.32/28'
'10.62.57.48/28'
'10.62.57.64/28'
'10.62.57.80/28'
'10.62.57.96/28'
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


