### Example 1: Create HyperV NIC to migrate
```powershell
New-AzMigrateHCINicMapping -HyperV -NicID a -TargetNetworkId "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external"
```

```output
NetworkName              : 
NicId                    : a
TargetNetworkId          : /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
TestNetworkId            : /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
SelectionTypeForFailover : SelectedByUser
InstanceType             : HyperV    
```
Get HyperV NIC object to provide input for New-AzMigrateHCIServerReplication and Set-AzMigrateHCIServerReplication

### Example 2: Create VMware NIC to migrate
```powershell
New-AzMigrateHCINicMapping -VMware -NicID a -TargetNetworkId "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external"
```

```output
NetworkName              : 
NicId                    : a
TargetNetworkId          : /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
TestNetworkId            : /subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external
SelectionTypeForFailover : SelectedByUser
InstanceType             : VMware    
```

Get VMware NIC object to provide input for New-AzMigrateHCIServerReplication and Set-AzMigrateHCIServerReplication

