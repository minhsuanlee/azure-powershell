
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
Stops replication for the migrated server. 
.Description
The Remove-AzMigrateServerReplication cmdlet stops the replication for a migrated server. 
.Link
https://learn.microsoft.com/powershell/module/az.migrate/remove-azmigrateserverreplication
#>
function Remove-AzMigrateServerReplication {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.IJob])]
    [CmdletBinding(DefaultParameterSetName = 'ByID', PositionalBinding = $false)]
    param(
        [Parameter(ParameterSetName = 'ByID', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the replcating server for which the replication needs to be disabled. The ID should be retrieved using the Get-AzMigrateServerReplication cmdlet.
        ${TargetObjectID},

        [Parameter(ParameterSetName = 'ByInputObject', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        # Specifies the machine object of the replicating server.
        ${InputObject},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Query')]
        [System.String]
        # Specifies whether the replication needs to be force removed.
        ${ForceRemove},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Azure Subscription ID.
        ${SubscriptionId},

        [Parameter()]
        [ValidateSet("agentlessVMware", "AzStackHCI")]
        [ArgumentCompleter( { "agentlessVMware", "AzStackHCI" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the server migration scenario for which the replication infrastructure needs to be initialized.
        ${Scenario},

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
        # Honor -Scenario if it is provided.
        if ($PSBoundParameters.ContainsKey('Scenario')) {
            if ($Scenario -eq "agentlessVMware") {
                $scenario = "agentlessVMware"
            }
            else {
                # AzStackHCI
                $scenario = $AzStackHCIInstanceTypes.AzStackHCI
            }
        }
        else {
            # Get Scenario global variable
            $scenarioObject = Get-Variable `
                -Name $AzStackHCIGlobalVariableNames.Scenario `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $scenarioObject) {
                # Default to agentlessVMware
                $scenario = "agentlessVMware"
            }
            else {
                $scenario = $scenarioObject.Value
                if ($scenario -ne $AzStackHCIInstanceTypes.AzStackHCI) {
                    throw "Unknown Scenario '$($scenario)' is set. Please set -Scenario to 'agentlessVMware' or 'AzStackHCI'."
                }
            }
        }

        # Remove common optional parameter -Scenario
        $null = $PSBoundParameters.Remove('Scenario')

        if ($scenario -eq "agentlessVMware") {
            $hasDeleteOption = $PSBoundParameters.ContainsKey('ForceRemove')
            $null = $PSBoundParameters.Remove('ForceRemove')
            $null = $PSBoundParameters.Remove('TargetObjectID')
            $null = $PSBoundParameters.Remove('ResourceGroupName')
            $null = $PSBoundParameters.Remove('ProjectName')
            $null = $PSBoundParameters.Remove('MachineName')
            $null = $PSBoundParameters.Remove('InputObject')
            $parameterSet = $PSCmdlet.ParameterSetName

            if ($parameterSet -eq 'ByInputObject') {
                $TargetObjectID = $InputObject.Id
            }
            $MachineIdArray = $TargetObjectID.Split("/")
            $ResourceGroupName = $MachineIdArray[4]
            $VaultName = $MachineIdArray[8]
            $FabricName = $MachineIdArray[10]
            $ProtectionContainerName = $MachineIdArray[12]
            $MachineName = $MachineIdArray[14]
                
            $null = $PSBoundParameters.Add("ResourceGroupName", $ResourceGroupName)
            $null = $PSBoundParameters.Add("ResourceName", $VaultName)
            $null = $PSBoundParameters.Add("FabricName", $FabricName)
            $null = $PSBoundParameters.Add("MigrationItemName", $MachineName)
            $null = $PSBoundParameters.Add("ProtectionContainerName", $ProtectionContainerName)
            if ($hasDeleteOption) { $null = $PSBoundParameters.Add('DeleteOption', $ForceRemove) }
            $null = $PSBoundParameters.Add('NoWait', $true)
            $output = Az.Migrate.internal\Remove-AzMigrateReplicationMigrationItem @PSBoundParameters
            $JobName = $output.Target.Split("/")[12].Split("?")[0]
            $null = $PSBoundParameters.Remove('NoWait')
            $null = $PSBoundParameters.Remove('ProviderSpecificDetail')
            $null = $PSBoundParameters.Remove("ResourceGroupName")
            $null = $PSBoundParameters.Remove("ResourceName")
            $null = $PSBoundParameters.Remove("FabricName")
            $null = $PSBoundParameters.Remove("MigrationItemName")
            $null = $PSBoundParameters.Remove("ProtectionContainerName")

            $null = $PSBoundParameters.Add('JobName', $JobName)
            $null = $PSBoundParameters.Add('ResourceName', $VaultName)
            $null = $PSBoundParameters.Add('ResourceGroupName', $ResourceGroupName)
            
            return Az.Migrate.internal\Get-AzMigrateReplicationJob @PSBoundParameters
        }
        else {
            $hasDeleteOption = $PSBoundParameters.ContainsKey('ForceRemove')
            $null = $PSBoundParameters.Remove('ForceRemove')
            $null = $PSBoundParameters.Remove('TargetObjectID')
            $null = $PSBoundParameters.Remove('InputObject')
            $parameterSet = $PSCmdlet.ParameterSetName

            if ($parameterSet -eq 'ByInputObject') {
                $TargetObjectID = $InputObject.Id
            }
            $protectedItemIdArray = $TargetObjectID.Split("/")
            $resourceGroupName = $protectedItemIdArray[4]
            $vaultName = $protectedItemIdArray[8]
            $protectedItemName = $protectedItemIdArray[10]
            $null = $PSBoundParameters.Add('ResourceGroupName', $resourceGroupName)
            $null = $PSBoundParameters.Add('VaultName', $vaultName)
            $null = $PSBoundParameters.Add('ProtectedItemName', $protectedItemName)
            $null = $PSBoundParameters.Add('NoWait', $true)

            if ($hasDeleteOption) {
                $null = $PSBoundParameters.Add('ForceDelete', [System.Convert]::ToBoolean($ForceRemove))
            }

            $output = Remove-AzMigrateProtectedItem @PSBoundParameters

            return $output

            # TODO: wait for Get-AzMigrateJob update.
            # $jobName = $output.Target.Split("/")[14].Split("?")[0]

            # $null = $PSBoundParameters.Remove('ForceDelete')
            # $null = $PSBoundParameters.Remove('NoWait')
            # $null = $PSBoundParameters.Remove('VaultName')
            # $null = $PSBoundParameters.Remove('ProtectedItemName')

            # $null = $PSBoundParameters.Add('ResourceName', $vaultName)
            # $null = $PSBoundParameters.Add('JobName', $jobName)

            # return Az.Migrate.internal\Get-AzMigrateReplicationJob @PSBoundParameters

            # $null = $PSBoundParameters.Add('OperationId', $jobName)

            # return Get-AzMigrateProtectedItemOperationStatus @PSBoundParameters
        }
    }
}   