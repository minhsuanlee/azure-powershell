### Example 1: Get fabric by resource group, vault name and fabric name in 'agentlessVMware' scenario
```powershell
Get-AzMigrateReplicationFabric -ResourceGroupName azmigratepwshtestasr13072020 -ResourceName AzMigrateTestProjectPWSH02aarsvault -FabricName AzMigratePWSHTc8d1replicationfabric
```

```output
BcdrState                                 : Valid
CustomDetailInstanceType                  : VMwareV2
EncryptionDetailKekCertExpiryDate         :
EncryptionDetailKekCertThumbprint         :
EncryptionDetailKekState                  : None
FriendlyName                              : AzMigratePWSHTc8d1replicationfabric
Health                                    : Normal
HealthErrorDetail                         : {}
Id                                        : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsof
                                            t.RecoveryServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationFabrics/AzMigratePWSHTc8d1replicationfabr
                                            ic
InternalIdentifier                        : 501ff8f2-c9d7-5bf4-87ff-d0b3fc98aeb5
Location                                  :
Name                                      : AzMigratePWSHTc8d1replicationfabric
RolloverEncryptionDetailKekCertExpiryDate :
RolloverEncryptionDetailKekCertThumbprint :
RolloverEncryptionDetailKekState          : None
Type                                      : Microsoft.RecoveryServices/vaults/replicationFabrics
```

Get a specific fabric in 'agentlessVMware' scenario.

### Example 2: List all fabrics by resource group and vault name in 'agentlessVMware' scenario
```powershell
Get-AzMigrateReplicationFabric -ResourceGroupName azmigratepwshtestasr13072020 -ResourceName AzMigrateTestProjectPWSH02aarsvault
```

```output
BcdrState                                 : Valid
CustomDetailInstanceType                  : VMwareV2
EncryptionDetailKekCertExpiryDate         :
EncryptionDetailKekCertThumbprint         :
EncryptionDetailKekState                  : None
FriendlyName                              : AzMigratePWSHTc8d1replicationfabric
Health                                    : Normal
HealthErrorDetail                         : {}
Id                                        : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsof
                                            t.RecoveryServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationFabrics/AzMigratePWSHTc8d1replicationfabr
                                            ic
InternalIdentifier                        : 501ff8f2-c9d7-5bf4-87ff-d0b3fc98aeb5
Location                                  :
Name                                      : AzMigratePWSHTc8d1replicationfabric
RolloverEncryptionDetailKekCertExpiryDate :
RolloverEncryptionDetailKekCertThumbprint :
RolloverEncryptionDetailKekState          : None
Type                                      : Microsoft.RecoveryServices/vaults/replicationFabrics
```

List all fabrics in resource group and vault in 'agentlessVMware' scenario.

### Example 3: Get fabric by resource group and fabric name in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*
```powershell
Get-AzMigrateReplicationFabric -Scenario "AzStackHCI" -ResourceGroupName "test-rg" -FabricName "testsrc1111replicationfabric"
```

```output
Id                                        : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationFabrics/testsrc1111replicationfabric
Location                                  : 
Name                                      : testsrc1111replicationfabric
Property                                  : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelProperties
SystemDataCreatedAt                       : 7/20/2023 5:56:06 PM
SystemDataCreatedBy                       : 
SystemDataCreatedByType                   : User
SystemDataLastModifiedAt                  : 7/20/2023 6:04:38 PM
SystemDataLastModifiedBy                  : 
SystemDataLastModifiedByType              : User
Tag                                       : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelTags
Type                                      : Microsoft.DataReplication/replicationFabrics
```

Get a specific fabric in 'AzStackHCI' scenario.

### Example 4: List all fabrics by resource group in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*
```powershell
Get-AzMigrateReplicationFabric -Scenario "AzStackHCI" -ResourceGroupName "test-rg"
```

```output
Id                                        : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationFabrics/testsrc1111replicationfabric
Location                                  : 
Name                                      : testsrc1111replicationfabric
Property                                  : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelProperties
SystemDataCreatedAt                       : 7/20/2023 5:56:06 PM
SystemDataCreatedBy                       : 
SystemDataCreatedByType                   : User
SystemDataLastModifiedAt                  : 7/20/2023 6:04:38 PM
SystemDataLastModifiedBy                  : 
SystemDataLastModifiedByType              : User
Tag                                       : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelTags
Type                                      : Microsoft.DataReplication/replicationFabrics

Id                                        : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationFabrics/testtgt2222replicationfabric
Location                                  : 
Name                                      : testtgt2222replicationfabric
Property                                  : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelProperties
SystemDataCreatedAt                       : 7/20/2023 7:12:51 PM
SystemDataCreatedBy                       : 
SystemDataCreatedByType                   : User
SystemDataLastModifiedAt                  : 7/20/2023 7:12:51 PM
SystemDataLastModifiedBy                  : 
SystemDataLastModifiedByType              : User
Tag                                       : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.FabricModelTags
Type                                      : Microsoft.DataReplication/replicationFabrics
```

List all fabrics in resource group in 'AzStackHCI' scenario.