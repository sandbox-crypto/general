   $subnets1 = Import-Csv ".\subnet_assignList.csv"
    #$subnets1.subnetName
    foreach ($subnet in $subnets1){
    $dmz = New-AzVirtualNetworkSubnetConfig -Name $subnet.SubnetName -AddressPrefix $subnet.AddressPrefix
    
    $vnet=Get-AzVirtualNetwork -Name $subnet.VirtNetwork -ResourceGroupName $subnet.RG
    $updatedvnet=Add-AzVirtualNetworkSubnetConfig -Name $dmz.Name -VirtualNetwork $vnet -AddressPrefix $dmz.AddressPrefix
    
    $updatedvnet | Set-AzVirtualNetwork
    
    
    }