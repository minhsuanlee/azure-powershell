### Example 1: By Id in 'agentlessVMware' scenario

```powershell
Start-AzMigrateServerMigration -TargetObjectID "/Subscriptions/7xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.RecoveryServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationFabrics/AzMigratePWSHTc8d1replicationfabric/replicationProtectionContainers/AzMigratePWSHTc8d1replicationcontainer/replicationMigrationItems/bcdr-vcenter-fareast-corp-micro-cfcc5a24-a40e-56b9-a6af-e206c9ca4f93_52f42ee7-8eb3-1aa4-e2d5-1ae83f86b085"
```

```output
ActivityId                       : da958651-96b3-4e65-a41e-897d4b06f7dd ActivityId: 3a4c8d4d-920a-47cd-82c3-f3dcce90a588
AllowedAction                    : {Cancel}
CustomDetailAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20180110.JobDetailsAffectedObjectDetails
CustomDetailInstanceType         : AsrJobDetails
EndTime                          :
Error                            : {}
FriendlyName                     : Migrate
Id                               : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.Recover
                                   yServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationJobs/931dde9a-de67-4a30-a045-bb9d6162f8ab
Location                         :
Name                             : 931dde9a-de67-4a30-a045-bb9d6162f8ab
ScenarioName                     : Migrate
StartTime                        : 9/25/20 9:20:08 PM
State                            : InProgress
StateDescription                 : InProgress
TargetInstanceType               : ProtectionEntity
TargetObjectId                   : 101883a0-23f7-538a-bbd5-6d8b4fa900e2
TargetObjectName                 : prsadhu-TestVM
Task                             : {DisableProtectionOnPrimary, UpdateDraState}
Type                             : Microsoft.RecoveryServices/vaults/replicationJobs
```

By id in 'agentlessVMware' scenario.

### Example 2: By Input Object in 'agentlessVMware' scenario

```powershell
$obj = Get-AzMigrateServerReplication -TargetObjectID "/Subscriptions/7xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.RecoveryServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationFabrics/AzMigratePWSHTc8d1replicationfabric/replicationProtectionContainers/AzMigratePWSHTc8d1replicationcontainer/replicationMigrationItems/bcdr-vcenter-fareast-corp-micro-cfcc5a24-a40e-56b9-a6af-e206c9ca4f93_52f42ee7-8eb3-1aa4-e2d5-1ae83f86b085"

Start-AzMigrateServerMigration -InputObject $obj
```

```output
ActivityId                       : da958651-96b3-4e65-a41e-897d4b06f7dd ActivityId: 3a4c8d4d-920a-47cd-82c3-f3dcce90a588
AllowedAction                    : {Cancel}
CustomDetailAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20180110.JobDetailsAffectedObjectDetails
CustomDetailInstanceType         : AsrJobDetails
EndTime                          :
Error                            : {}
FriendlyName                     : Migrate
Id                               : /Subscriptions/xxx-xxx-xxx/resourceGroups/azmigratepwshtestasr13072020/providers/Microsoft.Recover
                                   yServices/vaults/AzMigrateTestProjectPWSH02aarsvault/replicationJobs/931dde9a-de67-4a30-a045-bb9d6162f8ab
Location                         :
Name                             : 931dde9a-de67-4a30-a045-bb9d6162f8ab
ScenarioName                     : Migrate
StartTime                        : 9/25/20 9:20:08 PM
State                            : InProgress
StateDescription                 : InProgress
TargetInstanceType               : ProtectionEntity
TargetObjectId                   : 101883a0-23f7-538a-bbd5-6d8b4fa900e2
TargetObjectName                 : prsadhu-TestVM
Task                             : {DisableProtectionOnPrimary, UpdateDraState}
Type                             : Microsoft.RecoveryServices/vaults/replicationJobs
```

By Input Object in 'agentlessVMware' scenario.

### Example 3: By Id in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*

```powershell
Start-AzMigrateServerMigration -Scenario "AzStackHCI" -TargetObjectID "/subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/testproj1234replicationvault/protectedItems/0ec082d5-6827-457a-bae2-f986e1b94851"
```

```output
ActivityId                         :  ActivityId: 00000000-0000-0000-0000-000000000000
AllowedAction                      : {Cancel}
CustomPropertyAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api2021
                                     0216Preview.WorkflowModelCustomPropertiesAffectedObjectDe
                                     tails
CustomPropertyInstanceType         : FailoverWorkflowDetails
DisplayName                        : Planned failover
EndTime                            :
Error                              : {}
Id                                 : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resou
                                     rceGroups/test-rg/providers/Microsoft.DataReplication
                                     /replicationVaults/testproj1234replicationvault/jobs/
                                     af0e1bf6-e3e6-482c-8345-b1a06d87af96
Name                               : af0e1bf6-e3e6-482c-8345-b1a06d87af96
ObjectId                           : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resou
                                     rceGroups/test-rg/providers/Microsoft.DataReplication
                                     /replicationVaults/testproj1234replicationvault/prote
                                     ctedItems/0ec082d5-6827-457a-bae2-f986e1b94851/plannedFai
                                     lover
ObjectInternalId                   : a8b5ee68-102c-5aae-9499-c57a475a8fc4
ObjectInternalName                 : testsamlee2
ObjectName                         : 0ec082d5-6827-457a-bae2-f986e1b94851
ObjectType                         : ProtectedItem
ReplicationProviderId              : 4de0fddc-bdfe-40d9-b60e-678bdce89630
SourceFabricProviderId             : b35da11c-d69e-4220-9a90-d81ed93ad2fc
StartTime                          : 8/1/2023 12:42:19 AM
State                              : Started
SystemDataCreatedAt                :
SystemDataCreatedBy                :
SystemDataCreatedByType            :
SystemDataLastModifiedAt           :
SystemDataLastModifiedBy           :
SystemDataLastModifiedByType       :
Tag                                : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api2021
                                     0216Preview.WorkflowModelTags
TargetFabricProviderId             : 22f00372-a1b7-467f-87ce-d95e17a6e7c7
Task                               : {Prerequisite check, Turning off resource on primary,
                                     Starting failover, Preparing protected entities...}
Type                               : Microsoft.DataReplication/replicationVaults/jobs
```

By id in 'AzStackHCI' scenario.

### Example 4: By Input Object in 'AzStackHCI' scenario with *-Scenario "AzStackHCI"*

```powershell
$obj = Get-AzMigrateServerReplication -Scenario "AzStackHCI" -TargetObjectID "/subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resourceGroups/test-rg/providers/Microsoft.DataReplication/replicationVaults/testproj1234replicationvault/protectedItems/0ec082d5-6827-457a-bae2-f986e1b94851"

Start-AzMigrateServerMigration -Scenario "AzStackHCI" -InputObject $obj
```

```output
ActivityId                         :  ActivityId: 00000000-0000-0000-0000-000000000000
AllowedAction                      : {Cancel}
CustomPropertyAffectedObjectDetail : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api2021
                                     0216Preview.WorkflowModelCustomPropertiesAffectedObjectDe
                                     tails
CustomPropertyInstanceType         : FailoverWorkflowDetails
DisplayName                        : Planned failover
EndTime                            :
Error                              : {}
Id                                 : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resou
                                     rceGroups/test-rg/providers/Microsoft.DataReplication
                                     /replicationVaults/testproj1234replicationvault/jobs/
                                     af0e1bf6-e3e6-482c-8345-b1a06d87af96
Name                               : af0e1bf6-e3e6-482c-8345-b1a06d87af96
ObjectId                           : /subscriptions/43c52a6b-a338-4d19-8989-d9fc415d6ffe/resou
                                     rceGroups/test-rg/providers/Microsoft.DataReplication
                                     /replicationVaults/testproj1234replicationvault/prote
                                     ctedItems/0ec082d5-6827-457a-bae2-f986e1b94851/plannedFai
                                     lover
ObjectInternalId                   : a8b5ee68-102c-5aae-9499-c57a475a8fc4
ObjectInternalName                 : testsamlee2
ObjectName                         : 0ec082d5-6827-457a-bae2-f986e1b94851
ObjectType                         : ProtectedItem
ReplicationProviderId              : 4de0fddc-bdfe-40d9-b60e-678bdce89630
SourceFabricProviderId             : b35da11c-d69e-4220-9a90-d81ed93ad2fc
StartTime                          : 8/1/2023 12:42:19 AM
State                              : Started
SystemDataCreatedAt                :
SystemDataCreatedBy                :
SystemDataCreatedByType            :
SystemDataLastModifiedAt           :
SystemDataLastModifiedBy           :
SystemDataLastModifiedByType       :
Tag                                : Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api2021
                                     0216Preview.WorkflowModelTags
TargetFabricProviderId             : 22f00372-a1b7-467f-87ce-d95e17a6e7c7
Task                               : {Prerequisite check, Turning off resource on primary,
                                     Starting failover, Preparing protected entities...}
Type                               : Microsoft.DataReplication/replicationVaults/jobs
```

By Input Object in 'AzStackHCI' scenario.
