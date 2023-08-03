### Example 1: Make disks
```powershell
New-AzMigrateDiskMapping -DiskID a -DiskType Standard -IsOSDisk 'true'
```

```output
DiskEncryptionSetId DiskId   DiskType  IsOSDisk LogStorageAccountId LogStorageAccountSasSecretName  
------------------- ------   --------  -------- ------------------- ------------------------------   
                      a      Standard  true  
```

Get disks object to provide input for New-AzMigrateServerReplication

### Example 2: Disks to migrate to Azure Stack HCI
```powershell
New-AzMigrateDiskMapping -Scenario AzStackHCI -DiskID a -IsOSDisk true -IsDynamic $true -Size 1 -Format VHD
```

```output
Name                           Value
----                           -----
IsDynamic                      True
DiskFileFormat                 VHD
DiskId                         a
IsOSDisk                       true
DiskSizeGB                     1

Get disks object to provide input for New-AzMigrateServerReplication

