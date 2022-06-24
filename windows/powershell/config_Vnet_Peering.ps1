# Variables for common values


$peer1_src = Import-Csv ".\vnet_list.csv"
$peer2 = 'LA-OM-P-S-FTD-VNET'
$rg = "RG-LA-STAGING"
  
    foreach ($peer1 in $peer1_src.VnetName){ 


# virtual network 1 and 2
$vnet1 = get-AzVirtualNetwork -Name $peer1
$vnet2 = get-AzVirtualNetwork -Name $peer2

# Peer VNet1 to VNet2.
Add-AzVirtualNetworkPeering -Name $peer2-PEER -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id -AllowForwardedTraffic
# Peer VNet2 to VNet1.
Add-AzVirtualNetworkPeering -Name $peer1-PEER -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id -AllowForwardedTraffic -AllowGatewayTransit


# Setting remote gateway configs
$setRemoteGateway = Get-AzVirtualNetworkPeering -VirtualNetworkName $peer1 -ResourceGroupName $RG -Name $peer2-PEER

# Set UseRemoteGateways property to true
$setRemoteGateway.UseRemoteGateways = $True

# Update the virtual network peering
Set-AzVirtualNetworkPeering -VirtualNetworkPeering $setRemoteGateway

}
