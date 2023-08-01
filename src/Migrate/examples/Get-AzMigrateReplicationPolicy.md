### Example 1: List all policies in a vault in 'agentlessVMware' scenario
```powershell
Get-AzMigrateReplicationPolicy -ResourceGroupName azmigratepwshtestasr13072020 -ResourceName AzMigrateTestProjectPWSH02aarsvault
```

```output
Location Name                                Type
-------- ----                                ----
         samplepolicy2                       Microsoft.RecoveryServices/vaults/replicationPolicies
         samplepolicy1                       Microsoft.RecoveryServices/vaults/replicationPolicies
         samplePolicy3                       Microsoft.RecoveryServices/vaults/replicationPolicies
         migrateAzMigratePWSHTc8d1sitepolicy Microsoft.RecoveryServices/vaults/replicationPolicies
```

List all policies in 'agentlessVMware' scenario.

### Example 2: Get a specific policy in 'agentlessVMware' scenario
```powershell
Get-AzMigrateReplicationPolicy -ResourceGroupName azmigratepwshtestasr13072020 -ResourceName AzMigrateTestProjectPWSH02aarsvault -PolicyName  migrateAzMigratePWSHTc8d1sitepolicy
```

```output
Location Name                                Type
-------- ----                                ----
         migrateAzMigratePWSHTc8d1sitepolicy Microsoft.RecoveryServices/vaults/replicationPolicies
```

Get a specific policy in 'agentlessVMware' scenario.

### Example 3: List all policies in a vault in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*
```powershell
Get-AzMigrateReplicationPolicy -Scenario "AzStackHCI" -ResourceGroupName "test-rg" -ResourceName "testproj1234replicationvault"
```

```output
Id                           : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Mi
                               crosoft.DataReplication/replicationVaults/testproj1234replicationvault/replicationPolic
                               ies/testproj1234replicationvaultHyperVToAzStackHCIpolicy
Name                         : testproj1234replicationvaultHyperVToAzStackHCIpolicy
Property                     : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelProperties
SystemDataCreatedAt          :
SystemDataCreatedBy          :
SystemDataCreatedByType      :
SystemDataLastModifiedAt     :
SystemDataLastModifiedBy     :
SystemDataLastModifiedByType :
Tag                          : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelTags
Type                         : Microsoft.DataReplication/replicationVaults/replicationPolicies
```

List all policies in 'AzStackHCI' scenario.

### Example 4: Get a specific policy in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*
```powershell
Get-AzMigrateReplicationPolicy -Scenario "AzStackHCI" -ResourceGroupName "test-rg" -ResourceName "testproj1234replicationvault" -PolicyName  "testproj1234replicationvaultHyperVToAzStackHCIpolicy"
```

```output
Id                           : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Mi
                               crosoft.DataReplication/replicationVaults/testproj1234replicationvault/replicationPolic
                               ies/testproj1234replicationvaultHyperVToAzStackHCIpolicy
Name                         : testproj1234replicationvaultHyperVToAzStackHCIpolicy
Property                     : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelProperties
SystemDataCreatedAt          :
SystemDataCreatedBy          :
SystemDataCreatedByType      :
SystemDataLastModifiedAt     :
SystemDataLastModifiedBy     :
SystemDataLastModifiedByType :
Tag                          : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelTags
Type                         : Microsoft.DataReplication/replicationVaults/replicationPolicies
```

Get a specific policy in 'AzStackHCI' scenario.