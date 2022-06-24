   $vnets1 = Import-Csv ".\vnet_list.csv"
    #$vnets1.VnetName
    foreach ($vnet in $vnets1){
New-AzVirtualNetwork -Name $vnet.VnetName -ResourceGroupName $vnet.rg  -Location $vnet.Location -AddressPrefix $vnet.AddressPrefix
    

    
    
    }
 
 