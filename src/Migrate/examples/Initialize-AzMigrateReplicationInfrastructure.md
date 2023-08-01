### Example 1: Initializes the infrastructure for the migrate project.
```powershell
Initialize-AzMigrateReplicationInfrastructure -ResourceGroupName TestRG -ProjectName TestProject -TargetRegion centralus
```

```output
True
```

Initializes the infrastructure for the migrate project.

### Example 2: Initializes the infrastructure for the migrate project for private endpoint scenario.
```powershell
Initialize-AzMigrateReplicationInfrastructure -ResourceGroupName "TestRG" -ProjectName "TestPEProject" -TargetRegion "centraluseuap" -Scenario "agentlessVMware" -CacheStorageAccountId "/subscriptions/b364ed8d-4279-4bf8-8fd1-56f8fa0ae05c/resourceGroups/singhabh-rg/providers/Microsoft.Storage/storageAccounts/singhabhstoragepe1"
```

```output
True
```

Initializes the infrastructure for the migrate project for private endpoint scenario.

### Example 3: Initializes / validates the infrastructure for the migrate project for 'AzStackHCI' scenario.
```powershell
$ReplicationInfrastructureObject = Initialize-AzMigrateReplicationInfrastructure -ResourceGroupName "test-rg" -ProjectName "testproj" -Scenario "AzStackHCI" -CacheStorageAccountId "/subscriptions/566c5c68-8912-4b4f-bcba-f9932c62a15e/resourceGroups/test-rg/providers/Microsoft.Storage/storageAccounts/testprojmigratesa" -SourceApplianceName "testSrcApp" -TargetApplianceName "testTgtApp"

$ReplicationInfrastructureObject
```

```output
Name                                    Value
----                                    -----
ReplicationExtensionName                testsrcapp1111replicationfabric-testtgtapp2222replicationfabric-MigReplicationExtn
CacheStorageAccountName                 testprojmigratesa
PolicyName                              testproj3333replicationvaultHyperVToAzStackHCIpolicy
ReplicationVaultName                    testproj4444replicationvault
```

Initializes the infrastructure for the migrate project for 'AzStackHCI' scenario.
