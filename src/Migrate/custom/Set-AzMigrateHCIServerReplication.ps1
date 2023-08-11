
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
Updates the target properties for the replicating server.
.Description
The Set-AzMigrateHCIServerReplication cmdlet updates the target properties for the replicating server.
.Link
https://learn.microsoft.com/powershell/module/az.migrate/set-azmigratehciserverreplication
#>
function Set-AzMigrateHCIServerReplication {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IWorkflowModel])]
    [CmdletBinding(DefaultParameterSetName = 'ByID', PositionalBinding = $false)]
    param(
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the replicating server for which the properties need to be updated. The ID should be retrieved using the Get-AzMigrateServerReplication cmdlet.
        ${TargetObjectID},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the replcating server for which the properties need to be updated. The ID should be retrieved using the Get-AzMigrateServerReplication cmdlet.
        ${TargetVMName},

        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Int32]
        # Specifies the number of CPU cores.
        ${TargetVMCPUCores},

        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the virtual switch to use. 
        ${TargetVirtualSwitch},

        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Boolean]
        # Specifies if RAM is dynamic or not. 
        ${IsDynamicMemoryEnabled},
        
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.ProtectedItemDynamicMemoryConfig]
        # Specifies the dynamic memory configration of RAM.
        ${DynamicMemoryConfig},

        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Int64]
        # Specifies the target RAM size in MB. 
        ${TargetVMRam},
		
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.AzStackHCINicInput[]]
        # Specifies the nics on the source server to be included for replication.
        ${NicToInclude},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # The subscription Id.
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
        $HasTargetVMName = $PSBoundParameters.ContainsKey('TargetVMName')
        $HasTargetVMCPUCores = $PSBoundParameters.ContainsKey('TargetVMCPUCores')
        $HasTargetVirtualSwitch = $PSBoundParameters.ContainsKey('TargetVirtualSwitch')
        $HasIsDynamicMemoryEnabled = $PSBoundParameters.ContainsKey('IsDynamicMemoryEnabled')
        $HasDynamicMemoryConfig = $PSBoundParameters.ContainsKey('DynamicMemoryConfig')
        $HasTargetVMRam = $PSBoundParameters.ContainsKey('TargetVMRam')
        $HasNicToInclude = $PSBoundParameters.ContainsKey('NicToInclude')

        $null = $PSBoundParameters.Remove('TargetVMName')
        $null = $PSBoundParameters.Remove('TargetVMCPUCores')
        $null = $PSBoundParameters.Remove('TargetVirtualSwitch')
        $null = $PSBoundParameters.Remove('IsDynamicMemoryEnabled')
        $null = $PSBoundParameters.Remove('DynamicMemoryConfig')
        $null = $PSBoundParameters.Remove('TargetVMRam')
        $null = $PSBoundParameters.Remove('NicToInclude')
        
        $MachineIdArray = $TargetObjectID.Split("/")
        $ResourceGroupName = $MachineIdArray[4]
        $VaultName = $MachineIdArray[8]
        $MachineName = $MachineIdArray[10]
        
        $null = $PSBoundParameters.Add("ResourceGroupName", $ResourceGroupName)
        $null = $PSBoundParameters.Add("VaultName", $VaultName)
        $null = $PSBoundParameters.Add("Name", $MachineName)

        $ProtectedItem = Az.Migrate.Internal\Get-AzMigrateProtectedItem @PSBoundParameters

        $customProperties = $ProtectedItem.Property.CustomProperty
        if ($HasTargetVMName) {
            if ($TargetVMName.length -gt 64 -or $TargetVMName.length -eq 0) {
                throw "The target virtual machine name must be between 1 and 64 characters long."
            }
            $vmId = $customProperties.TargetResourceGroupId + "/providers/Microsoft.Compute/virtualMachines/" + $TargetVMName
            $VMNamePresentinRg = Get-AzResource -ResourceId $vmId -ErrorVariable notPresent -ErrorAction SilentlyContinue
            if ($VMNamePresentinRg) {
                throw "The target virtual machine name must be unique in the target resource group."
            }

            if ($TargetVMName -notmatch "^[^_\W][a-zA-Z0-9\-]{0,63}(?<![-._])$") {
                throw "The target virtual machine name must begin with a letter or number, and can contain only letters, numbers, or hyphens(-). The names cannot contain special characters \/""[]:|<>+=;,?*@&, whitespace, or begin with '_' or end with '.' or '-'."
            }

            $customProperties.TargetVMName = $TargetVMName
        }

        if ($HasTargetVMCPUCores) {
            $customProperties.TargetVMCPUCore = $TargetVMCPUCores
        }

        if ($HasTargetVirtualSwitch) {
            $customProperties.TargetVirtualSwitch = $TargetVirtualSwitch
        }

        if ($HasTargetVMRam) {
            $customProperties.TargetMemoryInMegaBytes = $TargetVMRam
        }

        # TODO: target memory needs to be atleast 1024 
        # TODO: validate memory is multiple of 2
        # TODO: DynamicMemoryConfig is updated but not
        if ($HasIsDynamicMemoryEnabled) {
            if ($IsDynamicRam) {
                if ($HasDynamicMemoryConfig) {
                    # Validate DynamicMemoryConfig
                    if ($customProperties.TargetMemoryInMegaBytes -lt $DynamicMemoryConfig.MinimumMemoryInMegaByte) {
                        throw "Minimum memory cannot be greater than target memory of $($customProperties.TargetMemoryInMegaBytes)"
                    }
                    if ($customProperties.TargetMemoryInMegaBytes -gt $DynamicMemoryConfig.MaximumMemoryInMegaByte) {
                        throw "Maximum memory cannot be less than target memory of $($customProperties.TargetMemoryInMegaBytes)"
                    }

                    $customProperties.DynamicMemoryConfig = $DynamicMemoryConfig
                }
                # Set default DynamicMemoryConfig if first time setup
                elseif (!$customProperties.IsDynamicRam) {
                    $memoryConfig = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.ProtectedItemDynamicMemoryConfig]::new()

                    $memoryConfig.MinimumMemoryInMegaByte = [System.Math]::Min($customProperties.TargetMemoryInMegaByte, $DynamicRAMConfig.MinimumMemoryInMegaByte)
                    $memoryConfig.MaximumMemoryInMegaByte = [System.Math]::Max($customProperties.TargetMemoryInMegaByte, $DynamicRAMConfig.MaximumMemoryInMegaByte)
                    $memoryConfig.TargetMemoryBufferPercentage = $DynamicRAMConfig.TargetMemoryBufferPercentage
                    $customProperties.DynamicMemoryConfig = $memoryConfig
                }
            }
            else {
                $customProperties.DynamicMemoryConfig = $null
            }

            $customProperties.IsDynamicRam = $IsDynamicRam
        }

        if ($HasNicToInclude -and $NicToInclude.length -gt 0) {
            # TODO: cast input
            $customProperties.NicToInclude = $NicToInclude;
        }               

        $output = Az.Migrate.Internal\New-AzMigrateProtectedItem `
            -Name $MachineName `
            -ResourceGroupName $ResourceGroupName `
            -VaultName $VaultName `
            -Property $ProtectedItem
                
        $null = $PSBoundParameters.Add('ResourceGroupName', $ResourceGroupName)
        $null = $PSBoundParameters.Add('VaultName', $VaultName)
        $null = $PSBoundParameters.Add('Name', $output.Name)

        return Az.Migrate.Internal\Get-AzMigrateWorkflow @PSBoundParameters;
    }
}   