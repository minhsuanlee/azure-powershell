### Example 1: Create a NIC object
```powershell
New-AzMigrateNicMapping -NicID a2399354-653a-464e-a567-d30ef5467a31 -TargetNicSelectionType primary -TargetNicIP "172.17.1.17"
```

```output
IsPrimaryNic IsSelectedForMigration NicId                                TargetStaticIPAddress TargetSubnetName
------------ ---------------------- -----                                --------------------- ----------------
false        false                  a2399354-653a-464e-a567-d30ef5467a31
```

Creates a NIC update object.

### Example 2: Create a NIC object for Azure Stack HCI migration
```powershell
New-AzMigrateNicMapping -Scenario AzStackHCI -NicID a -TargetNetworkId "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external"
```

```output
Name                           Value
----                           -----
TargetNetworkId                /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
TestNetworkId                  /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
NicId                          a
SelectionTypeForFailover       SelectedByUser
```

Creates a NIC update object.






