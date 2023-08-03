
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
Starts the migration for the replicating server.
.Description
Starts the migration for the replicating server.
.Link
https://learn.microsoft.com/powershell/module/az.migrate/start-azmigrateservermigration
#>
function Start-AzMigrateServerMigration {
    [OutputType(
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IWorkflowModel],
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.IJob])]
    param(    
        [Parameter(ParameterSetName = 'ByID', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the replcating server for which migration needs to be initiated. The ID should be retrieved using the Get-AzMigrateServerReplication cmdlet.
        ${TargetObjectID},

        [Parameter()]
        [ValidateSet("agentlessVMware", "AzStackHCI")]
        [ArgumentCompleter( { "agentlessVMware", "AzStackHCI" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the server migration scenario. Highly recommended to include for 'AzStackHCI' scenario.
        ${Scenario},

        [Parameter(ParameterSetName = 'ByInputObject', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        # Specifies the replicating server for which migration needs to be initiated. The server object can be retrieved using the Get-AzMigrateServerReplication cmdlet.
        [System.Object]
        ${InputObject},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the target version to which the Os has to be upgraded to. This is only supported in 'agentlessVMware' scenario. The valid values can be selected from SupportedOSVersions retrieved using Get-AzMigrateServerReplication cmdlet.
        ${OsUpgradeVersion},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Management.Automation.SwitchParameter]
        # Specifies whether the source server should be turned off post migration.
        ${TurnOffSourceServer},
    
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
        if ($PSBoundParameters.ContainsKey('Scenario')) {
            # Remove common optional parameter -Scenario
            $null = $PSBoundParameters.Remove('Scenario')
        }
        elseif ($PSDefaultParameterValues.ContainsKey('InitializeReplicationInfrastructure:Sceanrio')) {
            $Scenario = $PSDefaultParameterValues['InitializeReplicationInfrastructure:Sceanrio']
        }

        if ([string]::IsNullOrEmpty($Scenario) -or ($Scenario -eq $AzMigrateSupportedScenarios.agentlessVMware)) {
            # 'agenlessVMware' scenario for migrating to Azure
            if ($TurnOffSourceServer.IsPresent) {
                $PerformShutDown = "true"
            }
            else {
                $PerformShutDown = "false"
            }
            $null = $PSBoundParameters.Remove('TurnOffSourceServer')
            $null = $PSBoundParameters.Remove('OsUpgradeVersion')
            $null = $PSBoundParameters.Remove('TargetObjectID')
            $null = $PSBoundParameters.Remove('ResourceGroupName')
            $null = $PSBoundParameters.Remove('ProjectName')
            $null = $PSBoundParameters.Remove('MachineName')
            $null = $PSBoundParameters.Remove('InputObject')
            $parameterSet = $PSCmdlet.ParameterSetName

                
            if ($parameterSet -eq 'ByInputObject') {
                if ($InputObject -isnot [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.IMigrationItem]) {
                    throw "-InputObject must be of type [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.IMigrationItem]. Please verify the Scenario that you are in."
                }

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

            $ReplicationMigrationItem = Az.Migrate.internal\Get-AzMigrateReplicationMigrationItem @PSBoundParameters
            if ($ReplicationMigrationItem -and ($ReplicationMigrationItem.ProviderSpecificDetail.InstanceType -eq 'VMwarecbt') -and ($ReplicationMigrationItem.AllowedOperation -contains 'Migrate' )) {
                $ProviderSpecificDetailInput = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.VMwareCbtMigrateInput]::new()
                $ProviderSpecificDetailInput.InstanceType = 'VMwareCbt'
                $ProviderSpecificDetailInput.PerformShutdown = $PerformShutDown
                if ($OsUpgradeVersion) {
                    $SupportedOSVersions = $ReplicationMigrationItem.ProviderSpecificDetail.SupportedOSVersion
                    if ($null -eq $SupportedOSVersions) {
                        throw "There is no supported target OS available. Please check or remove the OsUpgradeVersion input." 
                    }
                    elseif ($SupportedOSVersions -contains $OsUpgradeVersion) {
                        $ProviderSpecificDetailInput.OSUpgradeVersion = $OsUpgradeVersion
                    }
                    else {
                        throw "Please choose the appropriate option from SupportedOSVersions retrieved using Get-AzMigrateServerReplication cmdlet"
                    }
                }
                    
                $null = $PSBoundParameters.Add('ProviderSpecificDetail', $ProviderSpecificDetailInput)
                $null = $PSBoundParameters.Add('NoWait', $true)
                $output = Az.Migrate.internal\Move-AzMigrateReplicationMigrationItem @PSBoundParameters
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
                throw "Either machine doesn't exist or provider/action isn't supported for this machine"
            }
        }
        elseif ($Scenario -eq $AzMigrateSupportedScenarios.AzStackHCI) {
            if ($PSBoundParameters.ContainsKey('OsUpgradeVersion')) {
                Write-Information "The parameter -OsUpgradeVersion is not supported for scenario '$($Scenario)'. Therefore, it will be ignored."
            }

            $PerformShutDown = $TurnOffSourceServer.IsPresent
            $null = $PSBoundParameters.Remove('TurnOffSourceServer')
            $null = $PSBoundParameters.Remove('OsUpgradeVersion')
            $null = $PSBoundParameters.Remove('TargetObjectID')
            $null = $PSBoundParameters.Remove('ResourceGroupName')
            $null = $PSBoundParameters.Remove('ProjectName')
            $null = $PSBoundParameters.Remove('MachineName')
            $null = $PSBoundParameters.Remove('InputObject')
            $parameterSet = $PSCmdlet.ParameterSetName

            if ($parameterSet -eq 'ByInputObject') {
                if ($InputObject -isnot [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IProtectedItemModel]) {
                    throw "-InputObject must be of type [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IProtectedItemModel]. Please verify the Scenario that you are in."
                }

                $TargetObjectID = $InputObject.Id
            }

            $protectedItemIdArray = $TargetObjectID.Split("/")
            $resourceGroupName = $protectedItemIdArray[4]
            $vaultName = $protectedItemIdArray[8]
            $protectedItemName = $protectedItemIdArray[10]

            $null = $PSBoundParameters.Add("ResourceGroupName", $resourceGroupName)
            $null = $PSBoundParameters.Add("VaultName", $vaultName)
            $null = $PSBoundParameters.Add("Name", $protectedItemName)

            $protectedItem = Az.Migrate\Get-AzMigrateProtectedItem @PSBoundParameters
            if ($null -eq $protectedItem) {
                throw "The replicating server doesn't exist. Please check the input and try again."
            }
            elseif (
                (!$protectedItem.Property.AllowedJob.contains("PlannedFailover")) -and
                (!$ProtectedItem.Property.AllowedJob.contains("Restart"))) {
                # AllowJob must contains either 'PlannedFailover' or 'Restart' to allow migration
                throw "The replicating server cannot be migrated right now. Current protection state is '$($protectedItem.Property.ProtectionStateDescription)'."
            }

            $null = $PSBoundParameters.Remove("ResourceGroupName")
            $null = $PSBoundParameters.Remove("VaultName")
            $null = $PSBoundParameters.Remove("Name")

            # Get the instance type from the protected item
            $instanceType = $protectedItem.Property.CustomProperty.InstanceType

            # Setup PlannedFailover deployment parameters
            $properties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PlannedFailoverModelProperties]::new()
            
            if ($instanceType -eq $AzStackHCIInstanceTypes.HyperVToAzStackHCI) {
                $customProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHciPlannedFailoverModelCustomProperties]::new()
            }
            elseif ($instanceType -eq $AzStackHCIInstanceTypes.VMwareToAzStackHCI) {
                $customProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHciPlannedFailoverModelCustomProperties]::new()
            }
            else {
                throw "Currently, for AzStackHCI scenario, only HyperV and VMware as the source is supported."
            }
            $customProperties.InstanceType = $instanceType
            $customProperties.ShutdownSourceVM = $PerformShutDown
            $properties.CustomProperty = $customProperties

            $null = $PSBoundParameters.Add('ResourceGroupName', $resourceGroupName)
            $null = $PSBoundParameters.Add('VaultName', $vaultName)
            $null = $PSBoundParameters.Add('ProtectedItemName', $protectedItemName)
            $null = $PSBoundParameters.Add('NoWait', $true)
            $null = $PSBoundParameters.Add('Property', $properties)

            $operation = Az.Migrate.Internal\Invoke-AzMigratePlannedProtectedItemFailover @PSBoundParameters
            $jobName = $operation.Target.Split("/")[14].Split("?")[0]

            $null = $PSBoundParameters.Remove('ProtectedItemName')  
            $null = $PSBoundParameters.Remove('NoWait')
            $null = $PSBoundParameters.Remove('Property')
            $null = $PSBoundParameters.Add('Name', $jobName)

            return Az.Migrate\Get-AzMigrateWorkflow @PSBoundParameters
        }
        else {
            throw "Unknown Scenario '$($Scenario)' is set. Please set -Scenario to 'agentlessVMware' or 'AzStackHCI'."
        }
    }
}
