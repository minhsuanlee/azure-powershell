### Example 1: When there is only OS disk to migrate to Azure
```powershell
New-AzMigrateServerReplication -MachineId "/subscriptions/xxx-xxx-xxx4/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.OffAzure/VMwareSites/AzMigratePWSHTc8d1site/machines/bcdr-vcenter-fareast-corp-micro-cfcc5a24-a40e-56b9-a6af-e206c9ca4f93_50063baa-9806-d6d6-7e09-c0ae87309b4f" -LicenseType NoLicenseType -TargetResourceGroupId "/subscriptions/xxx-xxx-xxx/resourceGroups/AzMigratePWSHtargetRG" -TargetNetworkId  "/subscriptions/xxx-xxx-xxx/resourceGroups/AzMigratePWSHtargetRG/providers/Microsoft.Network/virtualNetworks/AzMigrateTargetNetwork" -TargetSubnetName default -TargetVMName "prsadhu-TestVM" -DiskType "Standard_LRS" -OSDiskID "6000C299-343d-7bcd-c05e-a94bd63316dd"
```

```output
ActivityId                       : 68af14b4-46ae-48d1-b3e9-cdcffb9e8a93 ActivityId: 74d1a396-1d37-4264-8a5b-b727aaef0171
AllowedAction                    : {}
CustomDetailAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20180110.JobDetailsAffectedObjectDetails
CustomDetailInstanceType         : AsrJobDetails
EndTime                          : 9/16/20 11:57:33 AM
Error                            : {}
FriendlyName                     : Enable
Id                               : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.Recover
                                   yServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationJobs/997e2a92-5afe-49c7-a81a-89660aec9b7b
Location                         :
Name                             : 997e2a92-5afe-49c7-a81a-89660aec9b7b
ScenarioName                     : Enable
StartTime                        : 9/16/20 11:57:32 AM
State                            : Succeeded
StateDescription                 : Completed
TargetInstanceType               : ProtectionProfile
TargetObjectId                   : 42752b89-5fad-52fd-bf93-679fbdb6fed9
TargetObjectName                 : migrateAzMigratePWSHTc8d1sitepolicy
Task                             : {CloudPairingPrerequisitesCheck, CloudPairingPrepareSite}
Type                             : Microsoft.RecoveryServices/vaults/replicationJobs
```

This is for the scenario, when there is only one single disk that has to be protected.

### Example 2: When there are multiple disks to migrate to Azure
```powershell
$OSDisk = New-AzMigrateDiskMapping -DiskID '6000C299-343d-7bcd-c05e-a94bd63316dd' -DiskType 'Standard_LRS' -IsOSDisk 'true'
$DataDisk = New-AzMigrateDiskMapping -DiskID '7000C299-343d-7bcd-c05e-a94bd63316dd' -DiskType 'Standard_LRS' -IsOSDisk 'false'
$DisksToInclude += $OSDisk
$DisksToInclude += $DataDisk
New-AzMigrateServerReplication -MachineId "/subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.OffAzure/VMwareSites/AzMigratePWSHTc8d1site/machines/bcdr-vcenter-fareast-corp-micro-cfcc5a24-a40e-56b9-a6af-e206c9ca4f93_50063baa-9806-d6d6-7e09-c0ae87309b4f" -LicenseType NoLicenseType -TargetResourceGroupId "/subscriptions/xxx-xxx-xxx/resourceGroups/AzMigratePWSHtargetRG" -TargetNetworkId  "/subscriptions/xxx-xxx-xxx/resourceGroups/AzMigratePWSHtargetRG/providers/Microsoft.Network/virtualNetworks/AzMigrateTargetNetwork" -TargetSubnetName default -TargetVMName "prsadhu-TestVM" -DiskToInclude $DisksToInclude -PerformAutoResync true
```

```output
ActivityId                       : 68af14b4-46ae-48d1-b3e9-cdcffb9e8a93 ActivityId: 74d1a396-1d37-4264-8a5b-b727aaef0171
AllowedAction                    : {}
CustomDetailAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20180110.JobDetailsAffectedObjectDetails
CustomDetailInstanceType         : AsrJobDetails
EndTime                          : 9/16/20 11:57:33 AM
Error                            : {}
FriendlyName                     : Enable
Id                               : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.Recover
                                   yServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationJobs/997e2a92-5afe-49c7-a81a-89660aec9b7b
Location                         :
Name                             : 997e2a92-5afe-49c7-a81a-89660aec9b7b
ScenarioName                     : Enable
StartTime                        : 9/16/20 11:57:32 AM
State                            : Succeeded
StateDescription                 : Completed
TargetInstanceType               : ProtectionProfile
TargetObjectId                   : 42752b89-5fad-52fd-bf93-679fbdb6fed9
TargetObjectName                 : migrateAzMigratePWSHTc8d1sitepolicy
Task                             : {CloudPairingPrerequisitesCheck, CloudPairingPrepareSite}
Type                             : Microsoft.RecoveryServices/vaults/replicationJobs
```

This is for the scenario, when there are multiple disks that has to be protected.

### Example 3: When there is only OS disk to migrate to Azure Stack HCI
```powershell
New-AzMigrateServerReplication -Scenario "AzStackHCI" -MachineId "/subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.OffAzure/HyperVSites/testsrc7972site/machines/005-005-005" -OSDiskID "Microsoft:0EC082D5-6827-457A-BAE2-F986E1B94851\83F8638B-8DCA-4152-9EDA-2CA8B33039B4\0\0\L" -TargetStoragePathId "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/storagecontainers/testStorageContainer1" -TargetVirtualSwitch "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external" -TargetResourceGroupId "/subscriptions//xxx-xxx-xxx/resourceGroups/target-rg"-TargetVMName "targetVM"
```

```output
ActivityId                         :  ActivityId: 00000000-0000-0000-0000-000000000000
AllowedAction                      : {}
CustomPropertyAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.WorkflowModelCustomPropertiesAffectedObjectDetails
CustomPropertyInstanceType         : WorkflowDetails
DisplayName                        : Create or update protected item
EndTime                            : 8/2/2023 8:54:47 PM
Error                              : {}
Id                                 : /subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/proj62434replicationvault/jobs/f2d3430a-2977-419f-abd5-11d171e17f5e
Name                               : f2d3430a-2977-419f-abd5-11d171e17f5e
ObjectId                           : /subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/proj62434replicationvault/protectedItems/0ec082d5-6827-457a-bae2-f986e1b94555     
ObjectInternalId                   : a8b5ee68-102c-5aae-9499-c57a475a8fd4
ObjectInternalName                 : test_vm
ObjectName                         : 0ec082d5-6827-457a-bae2-f986e1b94555
ObjectType                         : ProtectedItem
ReplicationProviderId              : xxx-xxx-xxx
SourceFabricProviderId             : b35da11c-d69e-4220-9a90-d81ed93ad2fc
StartTime                          : 8/2/2023 8:49:27 PM
State                              : Succeeded
SystemDataCreatedAt                : 
SystemDataCreatedBy                : 
SystemDataCreatedByType            : 
SystemDataLastModifiedAt           : 
SystemDataLastModifiedBy           : 
SystemDataLastModifiedByType       : 
Tag                                : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.WorkflowModelTags
TargetFabricProviderId             : 22f00372-a1b7-467f-87ce-d95e17a6e7c7
Task                               : {Creating or updating the protected item, Initializing Protection, Enabling Protection, Starting Replication}
Type                               : Microsoft.DataReplication/replicationVaults/jobs	
```

This is for the scenario, when there is only one single disk that has to be protected.

### Example 4: When there are multiple disks or NICs to migrate to Azure Stack HCI
```powershell
[PSCustomObject[]]$DisksToInclude = @()
$OSDisk = New-AzMigrateDiskMapping -Scenario AzStackHCI -DiskID "Microsoft:C1A34301-3BFF-4EC6-97F1-6C4BD5ADCDE0\83F8638B-8DCA-4152-9EDA-2CA8B33039B4\0\0\L" -IsOSDisk true -IsDynamic $true -Size 42 -Format VHD
$DataDisk = New-AzMigrateDiskMapping -Scenario AzStackHCI -DiskID "Microsoft:C1A34301-3BFF-4EC6-97F1-6C4BD5ADCDE0\C92FAB89-DA8B-47E9-92F3-364642ECDF39\0\0\L" -IsOSDisk false -IsDynamic $true -Size 5 -Format VHD
$DisksToInclude += $OSDisk
$DisksToInclude += $DataDisk

[PSCustomObject[]]$NicsToInclude = @()
$Nic = New-AzMigrateNicMapping -Scenario AzStackHCI -NicID "Microsoft:C1A34301-3BFF-4EC6-97F1-6C4BD5ADCDE0\99CDFD2E-D60C-4218-AC2E-E7C2D8253EB9"
$NicsToInclude += $Nic

New-AzMigrateServerReplication -Scenario "AzStackHCI" -MachineId "/subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.OffAzure/HyperVSites/testsrc7972site/machines/005-005-005" -TargetStoragePathId "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/storagecontainers/testStorageContainer1" -TargetVirtualSwitch "/subscriptions/xxx-xxx-xxx/resourceGroups/hciclus-rg/providers/Microsoft.AzureStackHCI/virtualnetworks/external" -TargetResourceGroupId "/subscriptions//xxx-xxx-xxx/resourceGroups/target-rg"-TargetVMName "targetVM" -DiskToInclude $DisksToInclude -NicToInclude $NicsToInclude
```

```output
ActivityId                         :  ActivityId: 00000000-0000-0000-0000-000000000000
AllowedAction                      : {}
CustomPropertyAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.WorkflowModelCustomPropertiesAffectedObjectDetails
CustomPropertyInstanceType         : WorkflowDetails
DisplayName                        : Create or update protected item
EndTime                            : 8/3/2023 2:27:14 PM
Error                              : {}
Id                                 : /subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/proj62434replicationvault/jobs/f855305c-5bed-4bc6-996e-d273115ab833
Name                               : f855305c-5bed-4bc6-996e-d273115ab833
ObjectId                           : /subscriptions/xxx-xxx-xxx/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/proj62434replicationvault/protectedItems/c1a34301-3bff-4ec6-97f1-6c4bd5adcde0     
ObjectInternalId                   : a40ecd8e-6413-574d-b1f8-2ef925e087fc
ObjectInternalName                 : test_vm
ObjectName                         : c1a34301-3bff-4ec6-97f1-6c4bd5adcde0
ObjectType                         : ProtectedItem
ReplicationProviderId              : 4de0fddc-bdfe-40d9-b60e-678bdce89630
SourceFabricProviderId             : b35da11c-d69e-4220-9a90-d81ed93ad2fc
StartTime                          : 8/3/2023 2:21:50 PM
State                              : Succeeded
SystemDataCreatedAt                : 
SystemDataCreatedBy                : 
SystemDataCreatedByType            : 
SystemDataLastModifiedAt           : 
SystemDataLastModifiedBy           : 
SystemDataLastModifiedByType       : 
Tag                                : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.WorkflowModelTags
TargetFabricProviderId             : 22f00372-a1b7-467f-87ce-d95e17a6e7c7
Task                               : {Creating or updating the protected item, Initializing Protection, Enabling Protection, Starting Replication}
Type                               : Microsoft.DataReplication/replicationVaults/jobs
```

This is for the scenario, when there are multiple disks that has to be protected.