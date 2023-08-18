### Example 1: Creates HyperV Disk to migrate
```powershell
New-AzMigrateHCIDiskMapping -HyperV -DiskID a -IsOSDisk true -IsDynamic true -Size 1 -Format VHD
```

```output
DiskFileFormat     : VHD
DiskId             : a
DiskSizeGb         : 1
IsDynamic          : True
IsOSDisk           : True
StorageContainerId : 
InstanceType       : HyperV
```

Get HyperV disk object to provide input for New-AzMigrateHCIServerReplication

### Example 2: Creates VMware Disk to migrate
```powershell
New-AzMigrateHCIDiskMapping -VMware -DiskID a -IsOSDisk true -IsDynamic true -Size 1 -Format VHD
```

```output
DiskFileFormat     : VHD
DiskId             : a
DiskSizeGb         : 1
IsDynamic          : True
IsOSDisk           : True
StorageContainerId : 
InstanceType       : VMware
```

Get VMware disk object to provide input for New-AzMigrateHCIServerReplication
