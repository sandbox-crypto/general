// VNET NAMES 
param virtualNetworks_TEST_BO_P_N_ACC_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_CAC_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_CDM_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_CRE_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_CTR_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_DMZ_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_RES_VN_name string = ''
param virtualNetworks_TEST_BO_P_N_TRU_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_ACC_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_CAC_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_CDM_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_CRE_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_CTR_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_DMZ_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_RES_VN_name string = ''
param virtualNetworks_TEST_BO_P_S_TRU_VN_name string = ''
param virtualNetworks_TEST_HT_P_N_DMZ_VN_name string = ''
param virtualNetworks_TEST_HT_P_N_TRU_VN_name string = ''
param virtualNetworks_TEST_HT_P_S_DMZ_VN_name string = ''
param virtualNetworks_TEST_HT_P_S_TRU_VN_name string = ''

// VNET LOCATIONS
param south_central_loc string = 'southcentralus'
param north_central_loc string = 'northcentralus'

// VNET PEERING SOUTH AND NORTH CENTRAL
param virtualNetworks_om_p_s_ftd_vnet_externalid string = '/subscriptions/3bds480a3/resourceGroups/P-S-FTD/providers/Microsoft.Network/virtualNetworks/s-ftd-vnet'
param virtualNetworks_om_p_n_ftd_vnet_externalid string = '/subscriptions/3bss4cer/resourceGroups/P-N-FTD/providers/Microsoft.Network/virtualNetworks/n-ftd-vnet'

param southcentral_fw_peer string = ''
param northcentral_fw_peer string = ''


resource virtualNetworks_TEST_BO_P_N_ACC_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_ACC_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.19.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-BWP'
        properties: {
          addressPrefix: '10.62.19.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-NPS'
        properties: {
          addressPrefix: '10.62.19.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_CAC_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_CAC_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.23.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-PPS'
        properties: {
          addressPrefix: '10.62.23.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-SWP'
        properties: {
          addressPrefix: '10.62.23.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_CDM_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_CDM_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.20.0/24'
      ]
    }
    subnets: [
      {
        name: 'BO-P-N-CDM'
        properties: {
          addressPrefix: '10.62.20.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_CRE_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_CRE_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.22.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-SWD'
        properties: {
          addressPrefix: '10.62.22.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_CTR_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_CTR_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.21.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-SWS'
        properties: {
          addressPrefix: '10.62.21.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_DMZ_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_DMZ_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.24.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-DMZ'
        properties: {
          addressPrefix: '10.62.24.0/24'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_RES_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_RES_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.18.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-CBD'
        properties: {
          addressPrefix: '10.62.18.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-DWD'
        properties: {
          addressPrefix: '10.62.18.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-LRD'
        properties: {
          addressPrefix: '10.62.18.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-RPD'
        properties: {
          addressPrefix: '10.62.18.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_N_TRU_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.17.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-N-BWS'
        properties: {
          addressPrefix: '10.62.17.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-CBS'
        properties: {
          addressPrefix: '10.62.17.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-DWS'
        properties: {
          addressPrefix: '10.62.17.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-IVS'
        properties: {
          addressPrefix: '10.62.17.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-JGS'
        properties: {
          addressPrefix: '10.62.17.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-KSH'
        properties: {
          addressPrefix: '10.62.17.80/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-N-MSS'
        properties: {
          addressPrefix: '10.62.17.96/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_ACC_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_ACC_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.3.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-BWP'
        properties: {
          addressPrefix: '10.62.3.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-NPS'
        properties: {
          addressPrefix: '10.62.3.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_CAC_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_CAC_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.7.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-PPS'
        properties: {
          addressPrefix: '10.62.7.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-SWP'
        properties: {
          addressPrefix: '10.62.7.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_CDM_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_CDM_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.4.0/24'
      ]
    }
    subnets: [
      {
        name: 'BO-P-S-CDM'
        properties: {
          addressPrefix: '10.62.4.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_CRE_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_CRE_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.6.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-SWD'
        properties: {
          addressPrefix: '10.62.6.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_CTR_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_CTR_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.5.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-SWS'
        properties: {
          addressPrefix: '10.62.5.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_DMZ_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_DMZ_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.0.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-DMZ'
        properties: {
          addressPrefix: '10.62.0.0/24'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_RES_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_RES_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.2.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-CBD'
        properties: {
          addressPrefix: '10.62.2.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-DWD'
        properties: {
          addressPrefix: '10.62.2.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-LRD'
        properties: {
          addressPrefix: '10.62.2.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-RPD'
        properties: {
          addressPrefix: '10.62.2.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_BO_P_S_TRU_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.1.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'BO-P-S-BWS'
        properties: {
          addressPrefix: '10.62.1.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-CBS'
        properties: {
          addressPrefix: '10.62.1.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-DWS'
        properties: {
          addressPrefix: '10.62.1.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-IVS'
        properties: {
          addressPrefix: '10.62.1.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-JGS'
        properties: {
          addressPrefix: '10.62.1.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-KSH'
        properties: {
          addressPrefix: '10.62.1.80/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'BO-P-S-MSS'
        properties: {
          addressPrefix: '10.62.1.96/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_HT_P_N_DMZ_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_HT_P_N_DMZ_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.24.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'HT-P-N-DMZ'
        properties: {
          addressPrefix: '10.62.24.0/24'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_HT_P_N_TRU_VN_name
  location: north_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.25.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'HT-P-N-DVS'
        properties: {
          addressPrefix: '10.62.25.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-HAS'
        properties: {
          addressPrefix: '10.62.25.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-VAS'
        properties: {
          addressPrefix: '10.62.25.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-VOS'
        properties: {
          addressPrefix: '10.62.25.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-HBD'
        properties: {
          addressPrefix: '10.62.25.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-HWD'
        properties: {
          addressPrefix: '10.62.25.80/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-N-LNS'
        properties: {
          addressPrefix: '10.62.25.96/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: northcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_n_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.128/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_HT_P_S_DMZ_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_HT_P_S_DMZ_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.8.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'HT-P-S-DMZ'
        properties: {
          addressPrefix: '10.62.8.0/24'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_TEST_HT_P_S_TRU_VN_name
  location: south_central_loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.62.9.0/24'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'HT-P-S-DVS'
        properties: {
          addressPrefix: '10.62.9.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-HAS'
        properties: {
          addressPrefix: '10.62.9.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-VAS'
        properties: {
          addressPrefix: '10.62.9.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-VOS'
        properties: {
          addressPrefix: '10.62.9.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-HBD'
        properties: {
          addressPrefix: '10.62.9.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-HWD'
        properties: {
          addressPrefix: '10.62.9.80/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'HT-P-S-LNS'
        properties: {
          addressPrefix: '10.62.9.96/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: [
      {
        name: southcentral_fw_peer
        properties: {
          peeringState: 'Connected'
          remoteVirtualNetwork: {
            id: virtualNetworks_om_p_s_ftd_vnet_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: true
          allowGatewayTransit: false
          useRemoteGateways: true
          remoteAddressSpace: {
            addressPrefixes: [
              '10.62.251.0/25'
            ]
          }
        }
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_TEST_BO_P_N_ACC_VN_name_BO_P_N_BWP 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_ACC_VN_name_resource
  name: 'BO-P-N-BWP'
  properties: {
    addressPrefix: '10.62.19.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_BWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-BWS'
  properties: {
    addressPrefix: '10.62.17.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_RES_VN_name_BO_P_N_CBD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_RES_VN_name_resource
  name: 'BO-P-N-CBD'
  properties: {
    addressPrefix: '10.62.18.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_CBS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-CBS'
  properties: {
    addressPrefix: '10.62.17.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_CDM_VN_name_BO_P_N_CDM 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_CDM_VN_name_resource
  name: 'BO-P-N-CDM'
  properties: {
    addressPrefix: '10.62.20.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_DMZ_VN_name_BO_P_N_DMZ 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_DMZ_VN_name_resource
  name: 'BO-P-N-DMZ'
  properties: {
    addressPrefix: '10.62.24.0/24'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_RES_VN_name_BO_P_N_DWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_RES_VN_name_resource
  name: 'BO-P-N-DWD'
  properties: {
    addressPrefix: '10.62.18.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_DWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-DWS'
  properties: {
    addressPrefix: '10.62.17.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_IVS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-IVS'
  properties: {
    addressPrefix: '10.62.17.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_JGS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-JGS'
  properties: {
    addressPrefix: '10.62.17.64/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_KSH 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-KSH'
  properties: {
    addressPrefix: '10.62.17.80/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_RES_VN_name_BO_P_N_LRD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_RES_VN_name_resource
  name: 'BO-P-N-LRD'
  properties: {
    addressPrefix: '10.62.18.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_TRU_VN_name_BO_P_N_MSS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_TRU_VN_name_resource
  name: 'BO-P-N-MSS'
  properties: {
    addressPrefix: '10.62.17.96/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_ACC_VN_name_BO_P_N_NPS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_ACC_VN_name_resource
  name: 'BO-P-N-NPS'
  properties: {
    addressPrefix: '10.62.19.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_CAC_VN_name_BO_P_N_PPS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_CAC_VN_name_resource
  name: 'BO-P-N-PPS'
  properties: {
    addressPrefix: '10.62.23.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_RES_VN_name_BO_P_N_RPD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_RES_VN_name_resource
  name: 'BO-P-N-RPD'
  properties: {
    addressPrefix: '10.62.18.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_CRE_VN_name_BO_P_N_SWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_CRE_VN_name_resource
  name: 'BO-P-N-SWD'
  properties: {
    addressPrefix: '10.62.22.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_CAC_VN_name_BO_P_N_SWP 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_CAC_VN_name_resource
  name: 'BO-P-N-SWP'
  properties: {
    addressPrefix: '10.62.23.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_N_CTR_VN_name_BO_P_N_SWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_N_CTR_VN_name_resource
  name: 'BO-P-N-SWS'
  properties: {
    addressPrefix: '10.62.21.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_ACC_VN_name_BO_P_S_BWP 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_ACC_VN_name_resource
  name: 'BO-P-S-BWP'
  properties: {
    addressPrefix: '10.62.3.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_BWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-BWS'
  properties: {
    addressPrefix: '10.62.1.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_RES_VN_name_BO_P_S_CBD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_RES_VN_name_resource
  name: 'BO-P-S-CBD'
  properties: {
    addressPrefix: '10.62.2.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_CBS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-CBS'
  properties: {
    addressPrefix: '10.62.1.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_CDM_VN_name_BO_P_S_CDM 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_CDM_VN_name_resource
  name: 'BO-P-S-CDM'
  properties: {
    addressPrefix: '10.62.4.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_DMZ_VN_name_BO_P_S_DMZ 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_DMZ_VN_name_resource
  name: 'BO-P-S-DMZ'
  properties: {
    addressPrefix: '10.62.0.0/24'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_RES_VN_name_BO_P_S_DWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_RES_VN_name_resource
  name: 'BO-P-S-DWD'
  properties: {
    addressPrefix: '10.62.2.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_DWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-DWS'
  properties: {
    addressPrefix: '10.62.1.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_IVS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-IVS'
  properties: {
    addressPrefix: '10.62.1.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_JGS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-JGS'
  properties: {
    addressPrefix: '10.62.1.64/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_KSH 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-KSH'
  properties: {
    addressPrefix: '10.62.1.80/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_RES_VN_name_BO_P_S_LRD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_RES_VN_name_resource
  name: 'BO-P-S-LRD'
  properties: {
    addressPrefix: '10.62.2.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_TRU_VN_name_BO_P_S_MSS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_TRU_VN_name_resource
  name: 'BO-P-S-MSS'
  properties: {
    addressPrefix: '10.62.1.96/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_ACC_VN_name_BO_P_S_NPS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_ACC_VN_name_resource
  name: 'BO-P-S-NPS'
  properties: {
    addressPrefix: '10.62.3.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_CAC_VN_name_BO_P_S_PPS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_CAC_VN_name_resource
  name: 'BO-P-S-PPS'
  properties: {
    addressPrefix: '10.62.7.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_RES_VN_name_BO_P_S_RPD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_RES_VN_name_resource
  name: 'BO-P-S-RPD'
  properties: {
    addressPrefix: '10.62.2.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_CRE_VN_name_BO_P_S_SWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_CRE_VN_name_resource
  name: 'BO-P-S-SWD'
  properties: {
    addressPrefix: '10.62.6.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_CAC_VN_name_BO_P_S_SWP 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_CAC_VN_name_resource
  name: 'BO-P-S-SWP'
  properties: {
    addressPrefix: '10.62.7.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_BO_P_S_CTR_VN_name_BO_P_S_SWS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_BO_P_S_CTR_VN_name_resource
  name: 'BO-P-S-SWS'
  properties: {
    addressPrefix: '10.62.5.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_DMZ_VN_name_HT_P_N_DMZ 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_DMZ_VN_name_resource
  name: 'HT-P-N-DMZ'
  properties: {
    addressPrefix: '10.62.24.0/24'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_DVS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-DVS'
  properties: {
    addressPrefix: '10.62.25.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_HAS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-HAS'
  properties: {
    addressPrefix: '10.62.25.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_HBD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-HBD'
  properties: {
    addressPrefix: '10.62.25.64/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_HWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-HWD'
  properties: {
    addressPrefix: '10.62.25.80/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_LNS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-LNS'
  properties: {
    addressPrefix: '10.62.25.96/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_VAS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-VAS'
  properties: {
    addressPrefix: '10.62.25.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_N_TRU_VN_name_HT_P_N_VOS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_N_TRU_VN_name_resource
  name: 'HT-P-N-VOS'
  properties: {
    addressPrefix: '10.62.25.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_DMZ_VN_name_HT_P_S_DMZ 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_DMZ_VN_name_resource
  name: 'HT-P-S-DMZ'
  properties: {
    addressPrefix: '10.62.8.0/24'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_DVS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-DVS'
  properties: {
    addressPrefix: '10.62.9.0/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_HAS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-HAS'
  properties: {
    addressPrefix: '10.62.9.16/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_HBD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-HBD'
  properties: {
    addressPrefix: '10.62.9.64/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_HWD 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-HWD'
  properties: {
    addressPrefix: '10.62.9.80/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_LNS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-LNS'
  properties: {
    addressPrefix: '10.62.9.96/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_VAS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-VAS'
  properties: {
    addressPrefix: '10.62.9.32/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource virtualNetworks_TEST_HT_P_S_TRU_VN_name_HT_P_S_VOS 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_TEST_HT_P_S_TRU_VN_name_resource
  name: 'HT-P-S-VOS'
  properties: {
    addressPrefix: '10.62.9.48/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}
