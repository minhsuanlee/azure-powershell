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
Initialises the infrastructure for the migrate project.
.Description
The Initialize-AzMigrateReplicationInfrastructure cmdlet initialises the infrastructure for the migrate project.
.Link
https://learn.microsoft.com/powershell/module/az.migrate/initialize-azmigratereplicationinfrastructure
#>
function Initialize-AzMigrateReplicationInfrastructureToAzStackHCI {
    [OutputType([System.Boolean], ParameterSetName = "AzStackHCI")]
    [CmdletBinding(DefaultParameterSetName = 'AzStackHCI', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Resource Group of the Azure Migrate Project in the current subscription.
        ${ResourceGroupName},

        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the name of the Azure Migrate project to be used for server migration.
        ${ProjectName},

        [Parameter(Mandatory)]
        [ValidateSet("AzStackHCI")]
        [ArgumentCompleter( { "AzStackHCI" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the server migration scenario for which the replication infrastructure needs to be initialized.
        ${Scenario},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Storage Account Id to be used for private endpoint scenario.
        ${CacheStorageAccountId},

        [Parameter()]
        [System.String]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        # Azure Subscription ID.
        ${SubscriptionId},

        [Parameter(ParameterSetName = "AzStackHCI", Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Source Appliance name for the AzStackHCI scenario.
        ${SourceApplianceName},

        [Parameter(ParameterSetName = "AzStackHCI", Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the Target Appliance name for the AzStackHCI scenario.
        ${TargetApplianceName},

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
        . "$PSScriptRoot\AzStackHCICommonSettings.ps1"
        Import-Module Az.Resources
        Import-Module Az.Storage

        Write-Host "Running AzStackHCI scenario to initialize AzMigrate Replication Infrastructure."    

        $context = Get-AzContext
        # Get SubscriptionId
        if ([string]::IsNullOrEmpty($SubscriptionId)) {
            Write-Host "No -SubscriptionId provided."

            $SubscriptionId = $context.Subscription.Id
            if ([string]::IsNullOrEmpty($SubscriptionId)) {
                throw "Please login to Azure to select a subscription."
            }
        }
        Write-Host "*Selected Subscription Id: ", $SubscriptionId
        
        # Get resource group
        $resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
        if ($null -eq $resourceGroup) {
            throw "Resource group '$($ResourceGroupName)' does not exist in the subscription. Please create the resource group and try again."
        }
        Write-Host "*Selected Resource Group: ", $resourceGroup.ResourceGroupName

        # Verify user validity
        $userObject = Get-AzADUser -UserPrincipalName $context.Subscription.ExtendedProperties.Account

        if (-not $userObject) {
            $userObject = Get-AzADUser -Mail $context.Subscription.ExtendedProperties.Account
        }

        if (-not $userObject) {
            $mailNickname = "{0}#EXT#" -f $($context.Account.Id -replace '@', '_')

            $userObject = Get-AzADUser | 
            Where-Object { $_.MailNickname -eq $mailNickname }
        }

        if (-not $userObject) {
            $userObject = Get-AzADServicePrincipal -ApplicationID $context.Account.Id
        }

        if (-not $userObject) {
            throw 'User Object Id Not Found!'
        }

        # Get Migrate Project
        $migrateProject = Get-AzMigrateProject `
            -Name $ProjectName `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $migrateProject) {
            throw "Migrate project '$($ProjectName)' not found."
        }

        # Access Discovery Service
        $discoverySolutionName = "Servers-Discovery-ServerDiscovery"
        $discoverySolution = Get-AzMigrateSolution `
            -SubscriptionId $SubscriptionId `
            -ResourceGroupName $ResourceGroupName `
            -MigrateProjectName $ProjectName `
            -Name $discoverySolutionName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($discoverySolution.Name -ne $discoverySolutionName) {
            throw "Server Discovery Solution not found."
        }

        # Get Appliances Mapping
        $appMap = @{}
        if ($null -ne $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"]) {
            $appMapV2 = $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] | ConvertFrom-Json
            # Fetch all appliance from V2 map first. Then these can be updated if found again in V3 map.
            foreach ($item in $appMapV2) {
                $appMap[$item.ApplianceName.ToLower()] = $item.SiteId
            }
        }
        
        if ($null -ne $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"]) {
            $appMapV3 = $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] | ConvertFrom-Json
            foreach ($item in $appMapV3) {
                $t = $item.psobject.properties
                $appMap[$t.Name.ToLower()] = $t.Value.SiteId
            }
        }

        if ($null -eq $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] -And
            $null -eq $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] ) {
            throw "Server Discovery Solution missing Appliance Details. Invalid Solution."           
        }

        # TODO: update to support VMwareToAzStackHCI senario
        # Set AzStackHCI instance type
        $hyperVSiteTypeRegex = "(?<=/Microsoft.OffAzure/HyperVSites/).*$"
        if (-not ($appMap[$SourceApplianceName.ToLower()] -match $hyperVSiteTypeRegex)) {
            $instanceType = $AzStackHCIInstanceTypes.VMwareToAzStackHCI
            throw "Currently, for AzStackHCI scenario, only HyperV as the source is supported."
        }
        else {
            $instanceType = $AzStackHCIInstanceTypes.HyperVToAzStackHCI
        }
        Write-Host "Running $instanceType scenario."

        # Get Source and Target Fabrics
        $allFabrics = Get-AzMigrateFabric -ResourceGroupName $resourceGroup.ResourceGroupName
        foreach ($fabric in $allFabrics) {
            if (($fabric.CustomPropertyInstanceType -ceq $FabricInstanceTypes.HyperVInstance)) {
                $sourceFabric = $fabric
            }
            elseif ($fabric.CustomPropertyInstanceType -ceq $FabricInstanceTypes.AzStackHCIInstance) {
                $targetFabric = $fabric
            }
        }

        if ($null -eq $sourceFabric) {
            throw "Source Fabric not found. Please verify your appliance setup."
        }
        Write-Host "*Selected Source Fabric: '$($sourceFabric.Name)'."

        if ($null -eq $targetFabric) {
            throw "Target Fabric not found. Please verify your appliance setup."
        }
        Write-Host "*Selected Target Fabric: '$($targetFabric.Name)'."

        # Get Source and Target Dras from Fabrics
        $sourceDras = Get-AzMigrateDra `
            -FabricName $sourceFabric.Name `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $sourceDras) {
            throw "Source Dra found. Please verify your appliance setup."
        }
        $sourceDra = $sourceDras[0]
        Write-Host "*Selected Source Dra: '$($sourceDra.Name)'."

        $targetDras = Get-AzMigrateDra `
            -FabricName $targetFabric.Name `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $targetDras) {
            throw "Source Dra found. Please verify your appliance setup."
        }
        $targetDra = $targetDras[0]
        Write-Host "*Selected Target Dra: '$($targetDra.Name)'."

        # Get Data Replication Service
        $dataReplicationSolutionName = "Servers-Migration-ServerMigration_DataReplication"
        $dataReplicationSolution = Get-AzMigrateSolution `
            -SubscriptionId $SubscriptionId `
            -ResourceGroupName $ResourceGroupName `
            -MigrateProjectName $ProjectName `
            -Name $dataReplicationSolutionName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($dataReplicationSolution.Name -ne $dataReplicationSolutionName) {
            throw "Data Replication Service not found."
        }

        # Get Replication Vault
        $replicationVaultId = $dataReplicationSolution.DetailExtendedDetail["vaultId"]
        $replicationVaultName = $replicationVaultId.Split("/")[8]
        $replicationVault = Get-AzMigrateVault -ResourceGroupName $resourceGroup.ResourceGroupName -Name $replicationVaultName
        if ($null -eq $replicationVault) {
            throw "No Replication Vault found in Resource Group '$($resourceGroup.ResourceGroupName)'."
        }

        # Put Policy
        $policyName = $replicationVaultName + $instanceType + "policy"
        $policy = Get-AzMigratePolicy `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -Name $policyName `
            -VaultName $replicationVaultName `
            -SubscriptionId $SubscriptionId `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $policy) {
            Write-Host "Creating Policy..."

            # Setup Policy deployment parameters
            $policyProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelProperties]::new()
            
            if ($instanceType -eq $AzStackHCIInstanceTypes.HyperVToAzStackHCI) {
                $policyCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHcipolicyModelCustomProperties]::new()
            }
            else {
                $policyCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHcipolicyModelCustomProperties]::new()
            }
            $policyCustomProperties.InstanceType = $instanceType
            $policyCustomProperties.RecoveryPointHistoryInMinute = $ReplicationDetails.PolicyDetails.DefaultRecoveryPointHistoryInMinutes
            $policyCustomProperties.CrashConsistentFrequencyInMinute = $ReplicationDetails.PolicyDetails.DefaultCrashConsistentFrequencyInMinutes
            $policyCustomProperties.AppConsistentFrequencyInMinute = $ReplicationDetails.PolicyDetails.DefaultAppConsistentFrequencyInMinutes
            $policyProperties.CustomPropertyInstanceType = $policyCustomProperties
            $policyCustomPropertyInstanceType = $policyCustomProperties | ConvertTo-Json

            $policy = New-AzMigratePolicy `
                -Name $policyName `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -VaultName $replicationVaultName `
                -CustomPropertyInstanceType $policyCustomPropertyInstanceType `
                -SubscriptionId $SubscriptionId
            Write-Host "New Policy created."
        }
        else {
            Write-Host "Existing Policy found."
        }
        Write-Host "*Selected Policy: '$($policy.Name)'."

        # Put Cache Storage Account
        $params = @{
            contributorRoleDefId                = [System.Guid]::parse($RoleDefinitionIds.ContributorId);
            storageBlobDataContributorRoleDefId = [System.Guid]::parse($RoleDefinitionIds.StorageBlobDataContributorId);
            sourceAppAadId                      = $sourceDra.ResourceAccessIdentityObjectId;
            targetAppAadId                      = $targetDra.ResourceAccessIdentityObjectId;
        }

        if (![string]::IsNullOrEmpty($CacheStorageAccountId)) {
            $cacheStorageAccountName = $CacheStorageAccountId.Split("/")[8]
        }
        else {
            Write-Host "No custom Cache Stroage Account provided via -CacheStorageAccountId."

            $prefix = $migrateProject.Name.ToLower()
            $cacheStorageAccountName = $prefix + "migratesa"

            # Attempt to get Cache Storage Account by default name to avoid recreation
            $cacheStorageAccount = Get-AzStorageAccount `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -Name $cacheStorageAccountName `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $cacheStorageAccount) {
                # No conflict, create new Cache Storage Account
                Write-Host "Creating Cache Storage Account with default name '$($cacheStorageAccountName)'..."

                $params = @{
                    type                                = "Microsoft.Storage/storageAccounts";
                    apiVersion                          = $ApiVersions.StorageAccount;
                    name                                = $cacheStorageAccountName;
                    location                            = $migrateProject.Location;
                    migrateProjectName                  = $migrateProject.Name;
                    skuName                             = "Standard_LRS";
                    tags                                = @{ "Migrate Project" = $migrateProject.Name };
                    kind                                = "StorageV2";
                    encryption                          = @{ services = @{blob = @{ enabled = $true }; file = @{ enabled = $true } } };
                    contributorRoleDefId                = [System.Guid]::parse($RoleDefinitionIds.ContributorId);
                    storageBlobDataContributorRoleDefId = [System.Guid]::parse($RoleDefinitionIds.StorageBlobDataContributorId);
                    sourceAppAadId                      = $sourceDra.ResourceAccessIdentityObjectId;
                    targetAppAadId                      = $targetDra.ResourceAccessIdentityObjectId;
                }

                # Create Cache Storage Account
                $cacheStorageAccount = New-AzStorageAccount `
                    -ResourceGroupName $resourceGroup.ResourceGroupName `
                    -Name $params.name `
                    -SkuName $params.skuName `
                    -Location $params.location `
                    -Kind $params.kind `
                    -Tags $params.tags `
                    -AllowBlobPublicAccess $true
                
                # Grant Source Dra AAD App access to Cache Storage Account.
                # As "Contributor"
                New-AzRoleAssignment `
                    -ObjectId $params.sourceAppAadId `
                    -RoleDefinitionId $params.contributorRoleDefId `
                    -Scope $cacheStorageAccount.Id

                # As "StorageBlobDataContributor"
                New-AzRoleAssignment `
                    -ObjectId $params.sourceAppAadId `
                    -RoleDefinitionId $params.storageBlobDataContributorRoleDefId `
                    -Scope $cacheStorageAccount.Id

                # Grant Target Dra AAD App access to Cache Storage Account.
                # As "Contributor"
                New-AzRoleAssignment `
                    -ObjectId $params.targetAppAadId `
                    -RoleDefinitionId $params.contributorRoleDefId `
                    -Scope $cacheStorageAccount.Id

                # As "StorageBlobDataContributor"
                New-AzRoleAssignment `
                    -ObjectId $params.targetAppAadId `
                    -RoleDefinitionId $params.storageBlobDataContributorRoleDefId `
                    -Scope $cacheStorageAccount.Id

                Write-Host "New Cache Storage Account created."
            }
        }

        # Get Cache Storage Account by Id
        $cacheStorageAccount = Get-AzStorageAccount `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -Name $cacheStorageAccountName `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $cacheStorageAccount) {
            # This should never throw.
            throw "Cache Storage Account '$($cacheStorageAccountName)' does not exist."
        }
        Write-Host "Existing Cache Stroage Account found."

        # Verify Source Dra AAD App access to Cache Storage Account.
        # As "Contributor"
        $hasAadAppAccess = Get-AzRoleAssignment `
            -ObjectId $params.sourceAppAadId `
            -RoleDefinitionId $params.contributorRoleDefId `
            -Scope $cacheStorageAccount.Id
        if ($null -eq $hasAadAppAccess) {
            throw "Invalid Cache Storage Account '$($cacheStorageAccount.StorageAccountName)'.`n" +
            "Please re-run without -CacheStorageAccountId to automatically create one."
        }

        # As "StorageBlobDataContributor"
        $hasAadAppAccess = Get-AzRoleAssignment `
            -ObjectId $params.sourceAppAadId `
            -RoleDefinitionId $params.storageBlobDataContributorRoleDefId `
            -Scope $cacheStorageAccount.Id
        if ($null -eq $hasAadAppAccess) {
            throw "Invalid Cache Storage Account '$($cacheStorageAccount.StorageAccountName)'.`n" +
            "Please re-run without -CacheStorageAccountId to automatically create one."
        }

        # Verify Target Dra AAD App access to Cache Storage Account.
        # As "Contributor"
        $hasAadAppAccess = Get-AzRoleAssignment `
            -ObjectId $params.targetAppAadId `
            -RoleDefinitionId $params.contributorRoleDefId `
            -Scope $cacheStorageAccount.Id
        if ($null -eq $hasAadAppAccess) {
            throw "Invalid Cache Storage Account '$($cacheStorageAccount.StorageAccountName)'.`n" +
            "Please re-run without -CacheStorageAccountId to automatically create one."
        }

        # As "StorageBlobDataContributor"
        $hasAadAppAccess = Get-AzRoleAssignment `
            -ObjectId $params.targetAppAadId `
            -RoleDefinitionId $params.storageBlobDataContributorRoleDefId `
            -Scope $cacheStorageAccount.Id
        if ($null -eq $hasAadAppAccess) {
            throw "Invalid Cache Storage Account '$($cacheStorageAccount.StorageAccountName)'.`n" +
            "Please re-run without -CacheStorageAccountId to automatically create one."
        }
        Write-Host "*Selected Cache Stroage Account: '$($cacheStorageAccount.StorageAccountName)' in Location '$($cacheStorageAccount.Location)'"
        
        # Put Replication Extension
        $replicationExtensionName = ($sourceFabric.Id -split '/')[-1] + "-" + ($targetFabric.Id -split '/')[-1] + "-MigReplicationExtn"
        $replicationExtension = Get-AzMigrateReplicationExtension `
            -ResourceGroupName $resourceGroup.ResourceGroupName `
            -Name $replicationExtensionName `
            -VaultName $replicationVaultName `
            -SubscriptionId $SubscriptionId `
            -ErrorVariable notPresent `
            -ErrorAction SilentlyContinue
        if ($null -eq $replicationExtension) {
            # TODO: Create replication extension
            Write-Host "New Replication Extension created."
        }
        else {
            Write-Host "Existing Replication Extension found."
        }
        Write-Host "*Selected Replication Extension: '$($replicationExtension.Name)'."

        return $true
    }
}