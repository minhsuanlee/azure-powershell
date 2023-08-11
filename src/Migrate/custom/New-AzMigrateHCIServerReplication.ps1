
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Starts replication for the specified server.
.Description
The New-AzMigrateHCIServerReplication cmdlet starts the replication for a particular discovered server in the Azure Migrate project.
.Link
https://learn.microsoft.com/powershell/module/az.migrate/new-azmigratehciserverreplication
#>
function New-AzMigrateHCIServerReplication {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IWorkflowModel])]
    [CmdletBinding(DefaultParameterSetName = 'ByIdDefaultUser', PositionalBinding = $false)]
    param(
        [Parameter(ParameterSetName = 'ByIdDefaultUser', Mandatory)]
        [Parameter(ParameterSetName = 'ByIdPowerUser', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the machine ID of the discovered server to be migrated.
        ${MachineId}, 

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the storage path used when setting up ARC.
        ${TargetStoragePathId},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Int32]
        # Specifies the number of CPU cores.
        ${TargetVMCPUCores},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the virtual switch to use. 
        ${TargetVirtualSwitch},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Boolean]
        # Specifies if RAM is dynamic or not. 
        ${IsDynamicMemoryEnabled},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Int64]
        # Specifies the target RAM size in MB. 
        ${TargetVMRam},

        [Parameter(ParameterSetName = 'ByIdPowerUser', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.AzStackHCIDiskInput[]]
        # Specifies the disks on the source server to be included for replication.
        ${DiskToInclude},

        [Parameter(ParameterSetName = 'ByIdPowerUser', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.AzStackHCINicInput[]]
        # Specifies the nics on the source server to be included for replication.
        ${NicToInclude},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Resource Group id within the destination Azure subscription to which the server needs to be migrated.
        ${TargetResourceGroupId},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the name of the Azure VM to be created.
        ${TargetVMName},

        [Parameter(ParameterSetName = 'ByIdDefaultUser', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Operating System disk for the source server to be migrated.
        ${OSDiskID},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Azure Subscription ID.
        ${SubscriptionId},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
        Import-Module $PSScriptRoot\AzStackHCICommonSettings.ps1

        $parameterSet = $PSCmdlet.ParameterSetName

        if ($parameterSet -inotmatch "AzStackHCI") {
            throw "TargetStoragePathId is required for Scenario '$($Scenario)'."
        }

        $HasTargetVMCPUCores = $PSBoundParameters.ContainsKey('TargetVMCPUCores')
        $HasIsDynamicMemoryEnabled = $PSBoundParameters.ContainsKey('IsDynamicMemoryEnabled')
        $HasTargetVMRam = $PSBoundParameters.ContainsKey('TargetVMRam')

        $null = $PSBoundParameters.Remove('TargetVMCPUCores')
        $null = $PSBoundParameters.Remove('IsDynamicMemoryEnabled')
        $null = $PSBoundParameters.Remove('TargetVMRam')
        $null = $PSBoundParameters.Remove('DiskToInclude')
        $null = $PSBoundParameters.Remove('NicToInclude')
        $null = $PSBoundParameters.Remove('TargetResourceGroupId')
        $null = $PSBoundParameters.Remove('TargetVMName')
        $null = $PSBoundParameters.Remove('TargetVirtualSwitch')
        $null = $PSBoundParameters.Remove('TargetStoragePathId')
        $null = $PSBoundParameters.Remove('OSDiskID')

        $null = $PSBoundParameters.Remove('MachineId')

        # Get the discovered machine object.
        $MachineIdArray = $MachineId.Split("/")
        $SiteType = $MachineIdArray[7]
        $SiteName = $MachineIdArray[8]
        $ResourceGroupName = $MachineIdArray[4]
        $MachineName = $MachineIdArray[10]
        
        $null = $PSBoundParameters.Add("ResourceGroupName", $ResourceGroupName)
        $null = $PSBoundParameters.Add("SiteName", $SiteName)
        $null = $PSBoundParameters.Add("MachineName", $MachineName)

        if ($SiteType -eq $SiteTypes.HyperVSites) {
            $InputObject = Az.Migrate.Internal\Get-AzMigrateHyperVMachine @PSBoundParameters
            $instanceType = $AzStackHCIInstanceTypes.HyperVToAzStackHCI
            
            # Get the site to get project name.
            $null = $PSBoundParameters.Remove('MachineName')
            $siteObject = Az.Migrate\Get-AzMigrateHyperVSite @PSBoundParameters
        }
        else {
            $InputObject = Az.Migrate.Internal\Get-AzMigrateMachine @PSBoundParameters
            $instanceType = $AzStackHCIInstanceTypes.VMwareToAzStackHCI
            
            # Get the site to get project name.
            $null = $PSBoundParameters.Remove('MachineName')
            $siteObject = Az.Migrate\Get-AzMigrateSite @PSBoundParameters
        }

        $null = $PSBoundParameters.Remove('ResourceGroupName')
        $null = $PSBoundParameters.Remove('SiteName')

        if ($siteObject -and ($siteObject.Count -ge 1)) {
            $ProjectName = $siteObject.DiscoverySolutionId.Split("/")[8]
        }
        else {
            throw "Site not found"
        }

        # Get the solution to get vault name.
        $null = $PSBoundParameters.Add("ResourceGroupName", $ResourceGroupName)
        $null = $PSBoundParameters.Add("Name", "Servers-Migration-ServerMigration_DataReplication")
        $null = $PSBoundParameters.Add("MigrateProjectName", $ProjectName)
        
        $solution = Az.Migrate\Get-AzMigrateSolution @PSBoundParameters
        $vaultName = $solution.DetailExtendedDetail.AdditionalProperties.vaultId.Split("/")[8]

        $null = $PSBoundParameters.Remove('ResourceGroupName')
        $null = $PSBoundParameters.Remove("Name")
        $null = $PSBoundParameters.Remove("MigrateProjectName")

        # Get Policy
        $policyName = $vaultName + $instanceType + "policy"
        $policyObj = Az.Migrate.Internal\Get-AzMigratePolicy `
            -ResourceGroupName $ResourceGroupName `
            -Name $policyName `
            -VaultName $vaultName `
            -SubscriptionId $SubscriptionId `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($policyObj -and ($policyObj.Count -ge 1)) {
            $policyId = $policyObj.Id
        }
        else {
            throw "The replication infrastructure is not initialized. Run the initialize-azmigratereplicationinfrastructure script again."
        }

        # Get Source and Target Fabrics
        $allFabrics = Az.Migrate.Internal\Get-AzMigrateFabric -ResourceGroupName $ResourceGroupName
        foreach ($fabric in $allFabrics) {
            if ($fabric.Property.CustomProperty.InstanceType -ceq $FabricInstanceTypes.HyperVInstance) {
                $sourceFabric = $fabric
            }
            elseif ($fabric.Property.CustomProperty.InstanceType -ceq $FabricInstanceTypes.VmwareInstance) {
                $sourceFabric = $fabric
            }
            elseif ($fabric.Property.CustomProperty.InstanceType -ceq $FabricInstanceTypes.AzStackHCIInstance) {
                $targetFabric = $fabric
            }
        }

        if ($null -eq $sourceFabric -or $null -eq $targetFabric) {
            throw "The replication infrastructure is not initialized. Run the initialize-azmigratereplicationinfrastructure script again."
        }

        # Get Source and Target Dras
        $sourceDras = Az.Migrate.Internal\Get-AzMigrateDra `
            -FabricName $sourceFabric.Name `
            -ResourceGroupName $ResourceGroupName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $sourceDras) {
            throw "Source Dra not found. Please verify your appliance setup."
        }
        $sourceDra = $sourceDras[0]

        $targetDras = Az.Migrate.Internal\Get-AzMigrateDra `
            -FabricName $targetFabric.Name `
            -ResourceGroupName $ResourceGroupName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $targetDras) {
            throw "Target Dra not found. Please verify your appliance setup."
        }
        $targetDra = $targetDras[0]

        # Get Replication Extension
        $replicationExtensionName = ($sourceFabric.Id -split '/')[-1] + "-" + ($targetFabric.Id -split '/')[-1] + "-MigReplicationExtn"
        $replicationExtension = Az.Migrate.Internal\Get-AzMigrateReplicationExtension `
            -ResourceGroupName $ResourceGroupName `
            -Name $replicationExtensionName `
            -VaultName $vaultName `
            -SubscriptionId $SubscriptionId `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue

        if ($null -eq $replicationExtension) {
            throw "The replication infrastructure is not initialized. Run the initialize-azmigratereplicationinfrastructure script again."
        }

        # Get Storage Container
        $storageContainerAPI = "{0}?api-version={1}" -f $TargetStoragePathId, $ApiVersions.AzStackHCI
        $response = Invoke-AzRestMethod -Path $storageContainerAPI -Method GET
        if($response.StatusCode -ne 200)
        {
            throw "Provided target storage path is not found."
        }
        $storageContainer = ConvertFrom-Json $response.Content

        # Get RunAsAccount
        if ($SiteType -eq $SiteTypes.HyperVSites) {
            $runAsAccounts = Az.Migrate\Get-AzMigrateHyperVRunAsAccount `
                -ResourceGroupName $ResourceGroupName `
                -SiteName $SiteName `
                -SubscriptionId $SubscriptionId
            $runAsAccount = $runAsAccounts | Where-Object { $_.CredentialType -eq $RunAsAccountCredentialTypes.HyperVFabric}
        }
        else {
            $runAsAccounts = Az.Migrate\Get-AzMigrateRunAsAccount `
                -ResourceGroupName $ResourceGroupName `
                -SiteName $SiteName `
                -SubscriptionId $SubscriptionId
            $runAsAccount = $runAsAccounts | Where-Object { $_.CredentialType -eq $RunAsAccountCredentialTypes.VMwareFabric}
        }
            
        if ($null -eq $runAsAccount) {
            throw "Site run as account is not found."
        }

        # Validate TargetVMName
        Import-Module Az.Resources
        $vmId = $customProperties.TargetResourceGroupId + "/providers/Microsoft.Compute/virtualMachines/" + $TargetVMName
        $VMNamePresentInRg = Get-AzResource -ResourceId $vmId -ErrorVariable notPresent -ErrorAction SilentlyContinue
        if ($VMNamePresentInRg) {
            throw "The target virtual machine name must be unique in the target resource group."
        }

        if ($TargetVMName -notmatch "^[^_\W][a-zA-Z0-9\-]{0,63}(?<![-._])$") {
            throw "The target virtual machine name must begin with a letter or number, and can contain only letters, numbers, or hyphens(-). The names cannot contain special characters \/""[]:|<>+=;,?*@&, whitespace, or begin with '_' or end with '.' or '-'."
        }

        $protectedItemProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.ProtectedItemModelProperties]::new()
        $protectedItemProperties.PolicyName = $policyName
        $protectedItemProperties.ReplicationExtensionName = $replicationExtensionName

        if ($SiteType -eq $SiteTypes.HyperVSites) {     
            $customProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHCIProtectedItemModelCustomProperties]::new()
        }
        else {
            $customProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHCIProtectedItemModelCustomProperties]::new()
        }

        $customProperties.InstanceType                        = $instanceType
        $customProperties.CustomLocationRegion                = $storageContainer.Location
        $customProperties.FabricDiscoveryMachineId            = $InputObject.Id
        $customProperties.HyperVGeneration                    = $InputObject.Generation
        $customProperties.RunAsAccountId                      = $runAsAccount.Id
        $customProperties.SourceDraName                       = $sourceDra.Name
        $customProperties.StorageContainerId                  = $storageContainer.Id
        $customProperties.TargetArcClusterCustomLocationId    = $storageContainer.ExtendedLocation.Name
        $customProperties.TargetDraName                       = $targetDra.Name
        $customProperties.TargetHciClusterId                  = $targetFabric.Property.CustomProperty.Cluster.ResourceName
        $customProperties.TargetResourceGroupId               = $TargetResourceGroupId
        $customProperties.TargetVMName                        = $TargetVMName
        $customProperties.TargetNetworkId                     = $TargetVirtualSwitch
        $customProperties.TestNetworkId                       = $TargetVirtualSwitch
        $customProperties.TargetCpuCore                       = if ($HasTargetVMCPUCores) { $TargetVMCPUCores } else { $InputObject.NumberOfProcessorCore }
        $customProperties.TargetMemoryInMegaByte              = if ($HasTargetVMRam) { $TargetVMRam } else { $InputObject.AllocatedMemoryInMB }
        $customProperties.IsDynamicRam                        = if ($HasIsDynamicMemoryEnabled) { $IsDynamicMemoryEnabled } else { $InputObject.IsDynamicMemoryEnabled }
        
        # TODO: target memory needs to be atleast 1024 
        # TODO: validate memory is multiple of 2
        if ($customProperties.IsDynamicRam) {
            $memoryConfig = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.ProtectedItemDynamicMemoryConfig]::new()

            $memoryConfig.MinimumMemoryInMegaByte = [System.Math]::Min($customProperties.TargetMemoryInMegaByte, $DynamicRAMConfig.MinimumMemoryInMegaByte)
            $memoryConfig.MaximumMemoryInMegaByte = [System.Math]::Max($customProperties.TargetMemoryInMegaByte, $DynamicRAMConfig.MaximumMemoryInMegaByte)
            $memoryConfig.TargetMemoryBufferPercentage = $DynamicRAMConfig.TargetMemoryBufferPercentage
            $customProperties.DynamicMemoryConfig = $memoryConfig
        }
        
        [PSCustomObject[]]$disks = @()
        [PSCustomObject[]]$nics = @()
        if ($parameterSet -match 'DefaultUser') {
            $osDisk = $InputObject.Disk | Where-Object { $_.InstanceId -eq $OSDiskID }
            if ($null -eq $osDisk) {
                throw "The OSDiskID provided is not found."
            }

            foreach ($sourceDisk in $InputObject.Disk) {
                $DiskObject = [PSCustomObject]@{
                    DiskId          = $sourceDisk.InstanceId
                    DiskSizeGb      = [long] [Math]::Ceiling($sourceDisk.MaxSizeInByte/1GB)
                    DiskFileFormat  = (((Split-Path $sourceDisk.Path -Leaf).Split('.'))[1] -replace 'a').ToUpper()
                    IsDynamic       = $sourceDisk.DiskType -ne "Fixed"
                    IsOSDisk        = $sourceDisk.InstanceId -eq $OSDiskID
                }
                $disks += $DiskObject
            }
            
            foreach ($sourceNic in $InputObject.NetworkAdapter) {
                $NicObject = [PSCustomObject]@{
                    NicId                    = $sourceNic.NicId
                    TargetNetworkId          = $TargetVirtualSwitch
                    TestNetworkId            = $TargetVirtualSwitch
                    SelectionTypeForFailover = "SelectedByUser"
                }
                $nics += $NicObject
            }
        }
        else {
            # Validate OSDisk is set.
            $osDisk = $DiskToInclude | Where-Object { $_.IsOSDisk -eq $True }
            if (($null -eq $osDisk) -or ($osDisk.length -ne 1)) {
                throw "One disk must be set as OS Disk."
            }
            
            # Validate no duplicates in the list of disks
            foreach ($disk in $DiskToInclude)
            {
                $discoveredDisk = $InputObject.Disk | Where-Object { $_.InstanceId -eq $disk.DiskId }
                if ($null -eq $discoveredDisk){
                    throw "The disk uuid '$($disk.DiskId)' is not found."
                }

                if (($null -ne $uniqueDisks) -and ($uniqueDisks.Contains($disk.DiskId))) {
                    throw "The disk uuid '$($disk.DiskId)' is already taken."
                }
                $uniqueDisks += $disk.DiskId

                # First convert to hashtable then to PS object for casting to work later
                $htDisk = @{}
                $disks += [PSCustomeObject]($disk.PSObject.Properties | ForEach-Object { $htDisk[$_.Name] = $_.Value })
            }
            # Validate no duplicates in the list of Nics
            foreach ($nic in $NicToInclude)
            {
                $discoveredNic = $InputObject.NetworkAdapter | Where-Object { $_.NicId -eq $nic.NicId }
                if ($null -eq $discoveredNic){
                    throw "The Nic id '$($nic.NicId)' is not found."
                }

                if (($null -ne $uniqueNics) -and ($uniqueNics.Contains($nic.NicId))) {
                    throw "The Nic id '$($nic.NicId)' is already taken."
                }
                
                $uniqueNics += $nic.NicId
                
                # First convert to hashtable then to PS object for casting to work later
                $htNic = @{}
                $nics += [PSCustomeObject]($nic.PSObject.Properties | ForEach-Object { $htNic[$_.Name] = $_.Value })
            }
        }

        if ($SiteType -eq $SiteTypes.HyperVSites) {     
            $customProperties.DisksToInclude = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHCIDiskInput[]]$disks
            $customProperties.NicsToInclude = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHCINicInput[]]$nics
        }
        else {
            $customProperties.DisksToInclude = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHCIDiskInput[]]$disks
            $customProperties.NicsToInclude = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHCINicInput[]]$nics
        }

        $protectedItemProperties.CustomProperty = $customProperties  

        $output = Az.Migrate.Internal\New-AzMigrateProtectedItem `
            -Name $MachineName `
            -ResourceGroupName $ResourceGroupName `
            -VaultName $vaultName `
            -Property $protectedItemProperties
                    
        $null = $PSBoundParameters.Add('ResourceGroupName', $ResourceGroupName)
        $null = $PSBoundParameters.Add('VaultName', $vaultName)
        $null = $PSBoundParameters.Add('Name', $output.Name)

        return Az.Migrate.Internal\Get-AzMigrateWorkflow @PSBoundParameters;
    }
}