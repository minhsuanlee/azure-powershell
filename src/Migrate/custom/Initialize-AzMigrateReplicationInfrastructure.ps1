
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
function Initialize-AzMigrateReplicationInfrastructure {
    [OutputType([System.Boolean], ParameterSetName = "AzStackHCI")]
    [OutputType([System.Boolean], ParameterSetName = "agentlessVMware")]
    [CmdletBinding(DefaultParameterSetName = 'agentlessVMware', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
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
        [ValidateSet("agentlessVMware", "AzStackHCI")]
        [ArgumentCompleter( { "agentlessVMware", "AzStackHCI" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the server migration scenario.
        ${Scenario},

        [Parameter(ParameterSetName = "agentlessVMware", Mandatory)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the target Azure region for server migrations.
        ${TargetRegion},

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
        if ($Scenario -eq "agentlessVMware") {
            Import-Module Az.Resources
            Import-Module Az.KeyVault
            Import-Module Az.Storage
            Import-Module Az.ServiceBus
        
            # Validate user specified target region
            $TargetRegion = $TargetRegion.ToLower()
            $allAvailableAzureLocations = Get-AzLocation
            $matchingLocationByLocationName = $allAvailableAzureLocations | Where-Object { $_.Location -eq $TargetRegion }
            $matchingLocationByDisplayName = $allAvailableAzureLocations | Where-Object { $_.DisplayName -eq $TargetRegion }
       
            if ($matchingLocationByLocationName) {
                $TargetRegion = $matchingLocationByLocationName.Location
            }
            elseif ($matchingLocationByDisplayName) {
                $TargetRegion = $matchingLocationByDisplayName.Location
            }
            elseif ($TargetRegion -match "euap") {
            }
            else {
                throw "Creation of resources required for replication failed due to invalid location. Run Get-AzLocation to verify the validity of the location and retry this step."
            }
       
            # Get/Set SubscriptionId
            if (($null -eq $SubscriptionId) -or ($SubscriptionId -eq "")) {
                $context = Get-AzContext
                $SubscriptionId = $context.Subscription.Id
                if (($null -eq $SubscriptionId) -or ($SubscriptionId -eq "")) {
                    throw "Please login to Azure to select a subscription."
                }
            }
            else {
                Select-AzSubscription -SubscriptionId $SubscriptionId
            }
            $context = Get-AzContext
            Write-Host "Using Subscription Id: ", $SubscriptionId
            Write-Host "Selected Target Region: ", $TargetRegion
        
            $rg = Get-AzResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
            if (!$rg) {
                Write-Host "Creating Resource Group ", $ResourceGroupName
                $output = New-AzResourceGroup -Name $ResourceGroupName -Location $TargetRegion
                Write-Host $ResourceGroupName, " created."
            }
            Write-Host "Selected resource group : ", $ResourceGroupName

            $LogStringCreated = "Created : "
            $LogStringSkipping = " already exists."

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

            # Hash code source code
            $Source = @"
using System;
public class HashFunctions
{
public static int hashForArtifact(String artifact)
{
    int hash = 0;
    int al = artifact.Length;
    int tl = 0;
    char[] ac = artifact.ToCharArray();
    while (tl < al)
    {
        hash = ((hash << 5) - hash) + ac[tl++] | 0;
    }
    return Math.Abs(hash);
}
}
"@

            #Get vault name from SMS solution.
            $smsSolution = Get-AzMigrateSolution -MigrateProjectName $ProjectName -ResourceGroupName $ResourceGroupName -Name "Servers-Migration-ServerMigration"
            if (-not $smsSolution.DetailExtendedDetail.AdditionalProperties.vaultId) {
                throw 'Azure Migrate appliance not configured. Setup Azure Migrate appliance before proceeding.'
            }
            $VaultName = $smsSolution.DetailExtendedDetail.AdditionalProperties.vaultId.Split("/")[8]

            # Get all appliances and sites in the project from SDS solution.
            $sdsSolution = Get-AzMigrateSolution -MigrateProjectName $ProjectName -ResourceGroupName $ResourceGroupName -Name "Servers-Discovery-ServerDiscovery"
            $appMap = @{}

            if ($null -ne $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"]) {
                $appMapV2 = $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] | ConvertFrom-Json
                # Fetch all appliance from V2 map first. Then these can be updated if found again in V3 map.
                foreach ($item in $appMapV2) {
                    $appMap[$item.ApplianceName] = $item.SiteId
                }
            }

            if ($null -ne $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"]) {
                $appMapV3 = $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] | ConvertFrom-Json
                foreach ($item in $appMapV3) {
                    $t = $item.psobject.properties
                    $appMap[$t.Name] = $t.Value.SiteId
                }
            }

            if ($null -eq $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] -And
                $null -eq $sdsSolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] ) {
                throw "Server Discovery Solution missing Appliance Details. Invalid Solution."           
            }

            foreach ($eachApp in $appMap.GetEnumerator()) {
                $SiteName = $eachApp.Value.Split("/")[8]
                $applianceName = $eachApp.Key
                $HashCodeInput = $SiteName + $TargetRegion

                # User cannot change location if it's already set in mapping.
                $mappingName = "containermapping"
                $allFabrics = Get-AzMigrateReplicationFabric -ResourceGroupName $ResourceGroupName -ResourceName $VaultName

                foreach ($fabric in $allFabrics) {
                    if (($fabric.Property.CustomDetail.InstanceType -ceq "VMwareV2") -and ($fabric.Property.CustomDetail.VmwareSiteId.Split("/")[8] -ceq $SiteName)) {
                        $peContainers = Get-AzMigrateReplicationProtectionContainer -FabricName $fabric.Name -ResourceGroupName $ResourceGroupName -ResourceName $VaultName
                        $peContainer = $peContainers[0]
                        $existingMapping = Get-AzMigrateReplicationProtectionContainerMapping -ResourceGroupName $ResourceGroupName -ResourceName $VaultName -FabricName $fabric.Name -ProtectionContainerName $peContainer.Name -MappingName $mappingName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                        if (($existingMapping) -and ($existingMapping.ProviderSpecificDetail.TargetLocation -ne $TargetRegion)) {
                            $targetRegionMismatchExceptionMsg = $ProjectName + " is already configured for migrating servers to " + $TargetRegion + ". Target Region cannot be modified once configured."
                            throw $targetRegionMismatchExceptionMsg
                        }
                    }
                }

                $job = Start-Job -ScriptBlock {
                    Add-Type -TypeDefinition $args[0] -Language CSharp 
                    $hash = [HashFunctions]::hashForArtifact($args[1]) 
                    $hash
                } -ArgumentList $Source, $HashCodeInput
                Wait-Job $job
                $hash = Receive-Job $job

                Write-Host "Initiating Artifact Creation for Appliance: ", $applianceName
                $MigratePrefix = "migrate"

                if ([string]::IsNullOrEmpty($CacheStorageAccountId)) {
                    # Phase 1
                    # Storage account
                    $LogStorageAcName = $MigratePrefix + "lsa" + $hash
                    $GateWayStorageAcName = $MigratePrefix + "gwsa" + $hash
                    $StorageType = "Microsoft.Storage/storageAccounts"
                    $StorageApiVersion = "2017-10-01" 
                    $LogStorageProperties = @{
                        encryption               = @{
                            services  = @{
                                blob  = @{enabled = $true };
                                file  = @{enabled = $true };
                                table = @{enabled = $true };
                                queue = @{enabled = $true }
                            };
                            keySource = "Microsoft.Storage"
                        };
                        supportsHttpsTrafficOnly = $true
                    }
                    $ResourceTag = @{"Migrate Project" = $ProjectName }
                    $StorageSku = @{name = "Standard_LRS" }
                    $ResourceKind = "Storage"

                    $lsaStorageAccount = Get-AzResource -ResourceGroupName $ResourceGroupName -Name $LogStorageAcName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$lsaStorageAccount) {
                        $output = New-AzResource -ResourceGroupName $ResourceGroupName -Location $TargetRegion -Properties  $LogStorageProperties -ResourceName $LogStorageAcName -ResourceType  $StorageType -ApiVersion $StorageApiVersion -Kind  $ResourceKind -Sku  $StorageSku -Tag $ResourceTag -Force
                        Write-Host $LogStringCreated, $LogStorageAcName
                    }
                    else {
                        Write-Host $LogStorageAcName, $LogStringSkipping
                    }

                    $gwyStorageAccount = Get-AzResource -ResourceGroupName $ResourceGroupName -Name $GateWayStorageAcName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$gwyStorageAccount) {
                        $output = New-AzResource -ResourceGroupName $ResourceGroupName -Location $TargetRegion -Properties  $LogStorageProperties -ResourceName $GateWayStorageAcName -ResourceType  $StorageType -ApiVersion $StorageApiVersion -Kind  $ResourceKind -Sku  $StorageSku -Tag $ResourceTag -Force
                        Write-Host $LogStringCreated, $GateWayStorageAcName
                    }
                    else {
                        Write-Host $GateWayStorageAcName, $LogStringSkipping
                    }

                    # Service bus namespace
                    $ServiceBusNamespace = $MigratePrefix + "sbns" + $hash
                    $ServiceBusType = "Microsoft.ServiceBus/namespaces"
                    $ServiceBusApiVersion = "2017-04-01"
                    $ServiceBusSku = @{
                        name = "Standard";
                        tier = "Standard"
                    }
                    $ServiceBusProperties = @{}
                    $ServieBusKind = "ServiceBusNameSpace"

                    $serviceBusAccount = Get-AzResource -ResourceGroupName $ResourceGroupName -Name $ServiceBusNamespace -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$serviceBusAccount) {
                        $output = New-AzResource -ResourceGroupName $ResourceGroupName -Location $TargetRegion -Properties  $ServiceBusProperties -ResourceName $ServiceBusNamespace -ResourceType  $ServiceBusType -ApiVersion $ServiceBusApiVersion -Kind  $ServieBusKind -Sku  $ServiceBusSku -Tag $ResourceTag -Force
                        Write-Host $LogStringCreated, $ServiceBusNamespace
                    }
                    else {
                        Write-Host $ServiceBusNamespace, $LogStringSkipping
                    }

                    # Key vault
                    $KeyVaultName = $MigratePrefix + "kv" + $hash
                    $KeyVaultType = "Microsoft.KeyVault/vaults"
                    $KeyVaultApiVersion = "2016-10-01"
                    $KeyVaultKind = "KeyVault"

                    $existingKeyVaultAccount = Get-AzResource -ResourceGroupName $ResourceGroupName -Name $KeyVaultName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if ($existingKeyVaultAccount) {
                        Write-Host $KeyVaultName, $LogStringSkipping
                    }
                    else {
                        $tenantID = $context.Tenant.TenantId
                        $KeyVaultPermissions = @{
                            keys         = @("Get", "List", "Create", "Update", "Delete");
                            secrets      = @("Get", "Set", "List", "Delete");
                            certificates = @("Get", "List");
                            storage      = @("get", "list", "delete", "set", "update", "regeneratekey", "getsas",
                                "listsas", "deletesas", "setsas", "recover", "backup", "restore", "purge")
                        }

                        $CloudEnvironMent = $context.Environment.Name
                        $HyperVManagerAppId = "b8340c3b-9267-498f-b21a-15d5547fd85e"
                        if ($CloudEnvironMent -eq "AzureUSGovernment") {
                            $HyperVManagerAppId = "AFAE2AF7-62E0-4AA4-8F66-B11F74F56326"
                        }
                        $hyperVManagerObject = Get-AzADServicePrincipal -ApplicationID $HyperVManagerAppId
                        $accessPolicies = @()
                        $userAccessPolicy = @{
                            "tenantId"    = $tenantID;
                            "objectId"    = $userObject.Id;
                            "permissions" = $KeyVaultPermissions
                        }
                        $hyperVAccessPolicy = @{
                            "tenantId"    = $tenantID;
                            "objectId"    = $hyperVManagerObject.Id;
                            "permissions" = $KeyVaultPermissions
                        }
                        $accessPolicies += $userAccessPolicy
                        $accessPolicies += $hyperVAccessPolicy

                        $allFabrics = Get-AzMigrateReplicationFabric -ResourceGroupName $ResourceGroupName -ResourceName $VaultName
                        $selectedFabricName = ""
                        foreach ($fabric in $allFabrics) {
                            if (($fabric.Property.CustomDetail.InstanceType -ceq "VMwareV2") -and ($fabric.Property.CustomDetail.VmwareSiteId.Split("/")[8] -ceq $SiteName)) {
                                $projectRSPObject = Get-AzMigrateReplicationRecoveryServicesProvider -ResourceGroupName $ResourceGroupName -ResourceName $VaultName
                                foreach ($projectRSP in $projectRSPObject) {
                                    $projectRSPFabricName = $projectRSP.Id.Split("/")[10]
                                    if (($projectRSP.FabricType -eq "VMwareV2") -and ($fabric.Name -eq $projectRSPFabricName)) {
                                        $projectAccessPolicy = @{
                                            "tenantId"    = $tenantID;
                                            "objectId"    = $projectRSP.ResourceAccessIdentityDetailObjectId;
                                            "permissions" = $KeyVaultPermissions
                                        }
                                        $accessPolicies += $projectAccessPolicy
                                    }
                                }
                            }
                        }
                        $keyVaultProperties = @{
                            sku                          = @{
                                family = "A";
                                name   = "standard"
                            };
                            tenantId                     = $tenantID;
                            enabledForDeployment         = $true;
                            enabledForDiskEncryption     = $false;
                            enabledForTemplateDeployment = $true;
                            enableSoftDelete             = $true;
                            accessPolicies               = $accessPolicies
                        }

                        $output = New-AzResource -ResourceGroupName $ResourceGroupName -Location $TargetRegion -Properties  $keyVaultProperties -ResourceName $KeyVaultName -ResourceType  $KeyVaultType -ApiVersion $KeyVaultApiVersion -Kind $KeyVaultKind -Tag $ResourceTag -Force
                        Write-Host $LogStringCreated, $KeyVaultName
                    }

                    # Locks
                    $CommonLockName = $ProjectName + "lock"
                    $lockNotes = "This is in use by Azure Migrate project"
                    $lsaLock = Get-AzResourceLock -LockName $CommonLockName -ResourceName $LogStorageAcName -ResourceType $StorageType -ResourceGroupName $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$lsaLock) {
                        $output = New-AzResourceLock -LockLevel CanNotDelete -LockName $CommonLockName -ResourceName $LogStorageAcName -ResourceType $StorageType -ResourceGroupName $ResourceGroupName -LockNotes $lockNotes -Force
                        Write-Host $LogStringCreated, $CommonLockName, " for ", $LogStorageAcName
                    }
                    else {
                        Write-Host $CommonLockName, " for ", $LogStorageAcName, $LogStringSkipping
                    }

                    $gwyLock = Get-AzResourceLock -LockName $CommonLockName -ResourceName $GateWayStorageAcName -ResourceType $StorageType -ResourceGroupName $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$gwyLock) {
                        $output = New-AzResourceLock -LockLevel CanNotDelete -LockName $CommonLockName -ResourceName $GateWayStorageAcName -ResourceType $StorageType -ResourceGroupName $ResourceGroupName -LockNotes $lockNotes -Force
                        Write-Host $LogStringCreated, $CommonLockName, " for ", $GateWayStorageAcName
                    }
                    else {
                        Write-Host $CommonLockName, " for ", $LogStorageAcName, $LogStringSkipping
                    }

                    $sbsnsLock = Get-AzResourceLock -LockName $CommonLockName -ResourceName $ServiceBusNamespace -ResourceType $ServiceBusType -ResourceGroupName $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$sbsnsLock) {
                        $output = New-AzResourceLock -LockLevel CanNotDelete -LockName $CommonLockName -ResourceName $ServiceBusNamespace -ResourceType $ServiceBusType -ResourceGroupName $ResourceGroupName -LockNotes $lockNotes -Force
                        Write-Host $LogStringCreated, $CommonLockName, " for ", $ServiceBusNamespace
                    }
                    else {
                        Write-Host $CommonLockName, " for ", $ServiceBusNamespace, $LogStringSkipping
                    }

                    $kvLock = Get-AzResourceLock -LockName $CommonLockName -ResourceName $KeyVaultName -ResourceType $KeyVaultType -ResourceGroupName $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (!$kvLock) {
                        $output = New-AzResourceLock -LockLevel CanNotDelete -LockName $CommonLockName -ResourceName $KeyVaultName -ResourceType $KeyVaultType -ResourceGroupName $ResourceGroupName -LockNotes $lockNotes -Force
                        Write-Host $LogStringCreated, $CommonLockName, " for ", $KeyVaultName
                    }
                    else {
                        Write-Host $CommonLockName, " for ", $KeyVaultName, $LogStringSkipping
                    }

                    # Intermediate phase
                    # RoleAssignments
            
                    $roleDefinitionId = "81a9662b-bebf-436f-a333-f67b29880f12"
                    $kvspnid = Get-AzADServicePrincipal -DisplayName "Azure Key Vault"
                    $Id = ""
                    if ($kvspnid -ne $null) {
                        $type = $kvspnid.GetType().BaseType
                        Write-Host $type.Name
                        if ($type.Name -eq "Array") {
                            $Id = $kvspnid[0].Id
                        }
                        else {
                            $Id = $kvspnid.Id
                        }
                    }
                    else {
                        Write-Host "Unable to retrieve KV SPN Id"
                    }
                    Write-Host $Id

                    $kvspnid = $Id
                    $gwyStorageAccount = Get-AzResource -ResourceName $GateWayStorageAcName -ResourceGroupName $ResourceGroupName 
                    $lsaStorageAccount = Get-AzResource -ResourceName $LogStorageAcName -ResourceGroupName $ResourceGroupName
                    $gwyRoleAssignments = Get-AzRoleAssignment -ObjectId $kvspnid -Scope $gwyStorageAccount.Id -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    $lsaRoleAssignments = Get-AzRoleAssignment -ObjectId $kvspnid -Scope $lsaStorageAccount.Id -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (-not $lsaRoleAssignments) {
                        $output = New-AzRoleAssignment -ObjectId $kvspnid -Scope $lsaStorageAccount.Id -RoleDefinitionId $roleDefinitionId
                    }
                    if (-not $gwyRoleAssignments) {
                        $output = New-AzRoleAssignment -ObjectId $kvspnid -Scope $gwyStorageAccount.Id -RoleDefinitionId $roleDefinitionId
                    }

                    if (-not $lsaRoleAssignments -or -not $gwyRoleAssignments) {
                        for ($i = 1; $i -le 18; $i++) {
                            Write-Information "Waiting for Role Assignments to be available... $( $i * 10 ) seconds" -InformationAction Continue
                            Start-Sleep -Seconds 10

                            $gwyRoleAssignments = Get-AzRoleAssignment -ObjectId $kvspnid -Scope $gwyStorageAccount.Id -ErrorVariable notPresent -ErrorAction SilentlyContinue
                            $lsaRoleAssignments = Get-AzRoleAssignment -ObjectId $kvspnid -Scope $lsaStorageAccount.Id -ErrorVariable notPresent -ErrorAction SilentlyContinue

                            if ($gwyRoleAssignments -and $lsaRoleAssignments) {
                                break
                            }
                        }
                    }

                    # SA. SAS definition

                    $gatewayStorageAccountSasSecretName = "gwySas"
                    $cacheStorageAccountSasSecretName = "cacheSas"
                    $regenerationPeriod = [System.Timespan]::FromDays(30)
                    $keyName = 'Key2'
                    Add-AzKeyVaultManagedStorageAccount -VaultName $KeyVaultName -AccountName $LogStorageAcName -AccountResourceId  $lsaStorageAccount.Id  -ActiveKeyName $keyName -RegenerationPeriod $regenerationPeriod
                    Add-AzKeyVaultManagedStorageAccount -VaultName $KeyVaultName -AccountName $GateWayStorageAcName -AccountResourceId  $gwyStorageAccount.Id  -ActiveKeyName $keyName -RegenerationPeriod $regenerationPeriod

                    $lsasctx = New-AzStorageContext -StorageAccountName $LogStorageAcName -Protocol Https -StorageAccountKey $keyName
                    $gwysctx = New-AzStorageContext -StorageAccountName $GateWayStorageAcName -Protocol Https -StorageAccountKey $keyName

                    $lsaat = New-AzStorageAccountSasToken -Service blob, file, Table, Queue -ResourceType Service, Container, Object -Permission "racwdlup" -Protocol HttpsOnly -Context $lsasctx
                    $gwyat = New-AzStorageAccountSasToken -Service blob, file, Table, Queue -ResourceType Service, Container, Object -Permission "racwdlup" -Protocol HttpsOnly -Context $gwysctx

                    Set-AzKeyVaultManagedStorageSasDefinition -AccountName $LogStorageAcName -VaultName $KeyVaultName -Name $cacheStorageAccountSasSecretName -TemplateUri $lsaat -SasType 'account' -ValidityPeriod ([System.Timespan]::FromDays(30))
                    Set-AzKeyVaultManagedStorageSasDefinition -AccountName $GateWayStorageAcName -VaultName $KeyVaultName -Name $gatewayStorageAccountSasSecretName -TemplateUri $gwyat -SasType 'account' -ValidityPeriod ([System.Timespan]::FromDays(30))

                    # Phase 2

                    # ServiceBusConnectionString
                    $serviceBusConnString = "ServiceBusConnectionString"
                    $serviceBusSecretObject = Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $serviceBusConnString -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if ($serviceBusSecretObject) {
                        Write-Host $serviceBusConnString, " for ", $applianceName, $LogStringSkipping
                    }
                    else {
                        $serviceBusRootKey = Get-AzServiceBusKey -ResourceGroupName $ResourceGroupName -Namespace $ServiceBusNamespace -Name "RootManageSharedAccessKey"
                        $secret = ConvertTo-SecureString -String $serviceBusRootKey.PrimaryConnectionString -AsPlainText -Force
                        $output = Set-AzKeyVaultSecret -VaultName $KeyVaultName -Name $serviceBusConnString -SecretValue $secret
                        Write-Host $LogStringCreated, $serviceBusConnString, " for ", $applianceName
                    }
                }
                else {
                    $response = Get-AzResource -ResourceId $CacheStorageAccountId -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if ($response -eq $null) {
                        throw "Storage account '$($CacheStorageAccountId)' does not exist."
                    }

                    Import-Module Az.Network
                    $res = Get-AzPrivateEndpointConnection -privatelinkresourceid $CacheStorageAccountId -ErrorVariable notPresent -ErrorAction SilentlyContinue
                    if (($res -eq $null) -or ($res.PrivateEndpoint -eq $null) -or ($res.PrivateEndpoint.Count -eq 0)) {
                        throw "Storage account '$($CacheStorageAccountId)' is not private endpoint enabled."
                    }
                }

                # Policy
                $policyName = $MigratePrefix + $SiteName + "policy"
                $existingPolicyObject = Get-AzMigrateReplicationPolicy -PolicyName $policyName -ResourceGroupName $ResourceGroupName -ResourceName $VaultName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                if (!$existingPolicyObject) {
                    $providerSpecificPolicy = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.VMwareCbtPolicyCreationInput]::new()
                    $providerSpecificPolicy.AppConsistentFrequencyInMinute = 240
                    $providerSpecificPolicy.InstanceType = "VMwareCbt"
                    $providerSpecificPolicy.RecoveryPointHistoryInMinute = 360
                    $providerSpecificPolicy.CrashConsistentFrequencyInMinute = 60
                    $existingPolicyObject = New-AzMigrateReplicationPolicy -PolicyName $policyName -ResourceGroupName $ResourceGroupName -ResourceName $VaultName -ProviderSpecificInput $providerSpecificPolicy
                    Write-Host $LogStringCreated, $policyName
                }
                else {
                    Write-Host $policyName, $LogStringSkipping
                }

                # Policy-container mapping
                $mappingName = "containermapping"
                $allFabrics = Get-AzMigrateReplicationFabric -ResourceGroupName $ResourceGroupName -ResourceName $VaultName
                foreach ($fabric in $allFabrics) {
                    if (($fabric.Property.CustomDetail.InstanceType -ceq "VMwareV2") -and ($fabric.Property.CustomDetail.VmwareSiteId.Split("/")[8] -ceq $SiteName)) {
                        $peContainers = Get-AzMigrateReplicationProtectionContainer -FabricName $fabric.Name -ResourceGroupName $ResourceGroupName -ResourceName $VaultName
                        $peContainer = $peContainers[0]
                        $existingMapping = Get-AzMigrateReplicationProtectionContainerMapping -ResourceGroupName $ResourceGroupName -ResourceName $VaultName -FabricName $fabric.Name -ProtectionContainerName $peContainer.Name -MappingName $mappingName -ErrorVariable notPresent -ErrorAction SilentlyContinue
                        if ($existingMapping) {
                            Write-Host $mappingName, " for ", $applianceName, $LogStringSkipping
                        }
                        else {
                            $providerSpecificInput = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.VMwareCbtContainerMappingInput]::new()
                            $providerSpecificInput.InstanceType = "VMwareCbt"
                            $providerSpecificInput.TargetLocation = $TargetRegion
                            if ([string]::IsNullOrEmpty($CacheStorageAccountId)) {
                                $keyVaultAccountDetails = Get-AzKeyVault -ResourceGroupName $ResourceGroupName -Name $KeyVaultName
                                $gwyStorageAccount = Get-AzResource -ResourceGroupName $ResourceGroupName -ResourceName $GateWayStorageAcName
                                $providerSpecificInput.KeyVaultId = $keyVaultAccountDetails.ResourceId
                                $providerSpecificInput.KeyVaultUri = $keyVaultAccountDetails.VaultUri
                                $providerSpecificInput.ServiceBusConnectionStringSecretName = $serviceBusConnString
                                $providerSpecificInput.StorageAccountId = $gwyStorageAccount.Id
                                $providerSpecificInput.StorageAccountSasSecretName = $GateWayStorageAcName + "-gwySas"
                            }
                            else {
                                $providerSpecificInput.StorageAccountId = $CacheStorageAccountId
                            }

                            $output = New-AzMigrateReplicationProtectionContainerMapping -FabricName $fabric.Name -MappingName $mappingName -ProtectionContainerName $peContainer.Name -ResourceGroupName $ResourceGroupName -ResourceName $VaultName -PolicyId $existingPolicyObject.Id -ProviderSpecificInput $providerSpecificInput -TargetProtectionContainerId  "Microsoft Azure"
                            Write-Host $LogStringCreated, $mappingName, " for ", $applianceName
                        }
                    }
                }
            }
            Write-Host "Finished successfully."
            return $true
        }
        else {
            # AzStackHCI scenario
            Import-Module $PSScriptRoot\AzStackHCICommonSettings.ps1
            Import-Module Az.Resources
            Import-Module Az.Storage

            # Get Scenario global variable
            $scenarioObject = Get-Variable `
                -Name $AzStackHCIGlobalVariableNames.Scenario `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $scenarioObject) {
                $scenario = $AzStackHCIInstanceTypes.AzStackHCI
                Set-Variable -Name $AzStackHCIGlobalVariableNames.Scenario -Value $scenario -Option constant -Scope global
            }
            else {
                $scenario = $scenarioObject.Value
            }
            Write-Host "Running $scenario scenario to initialize AzMigrate Replication Infrastructure." 

            $context = Get-AzContext
            # Get SubscriptionId
            if ([string]::IsNullOrEmpty($SubscriptionId)) {
                Write-Host "No -SubscriptionId provided."

                $SubscriptionId = $context.Subscription.Id
                if ([string]::IsNullOrEmpty($SubscriptionId)) {
                    throw "Please login to Azure to select a subscription."
                }
            }
            Write-Host "*Selected Subscription Id: '$($SubscriptionId)'."
        
            # Get resource group
            $resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue
            if ($null -eq $resourceGroup) {
                throw "Resource group '$($ResourceGroupName)' does not exist in the subscription. Please create the resource group and try again."
            }
            Write-Host "*Selected Resource Group: '$($resourceGroup.ResourceGroupName)'."

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

            # Get AzStackHCI InstanceType global variable
            $azstackHCIInstanceTypeObject = Get-Variable `
                -Name $AzStackHCIGlobalVariableNames.InstanceType `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $azstackHCIInstanceTypeObject) {
                $hyperVSiteTypeRegex = "(?<=/Microsoft.OffAzure/HyperVSites/).*$"
                $vmwareSiteTypeRegex = "(?<=/Microsoft.OffAzure/VMwareSites/).*$"
                if ($appMap[$SourceApplianceName.ToLower()] -match $hyperVSiteTypeRegex) {
                    $instanceType = $AzStackHCIInstanceTypes.HyperVToAzStackHCI
                }
                elseif ($appMap[$SourceApplianceName.ToLower()] -match $vmwareSiteTypeRegex) {
                    $instanceType = $AzStackHCIInstanceTypes.VMwareToAzStackHCI
                }
                else {
                    throw "Unknown VM site type encountered. Please verify the VM site type to be either for HyperV or VMware."
                }
                Set-Variable -Name $AzStackHCIGlobalVariableNames.InstanceType -Value $instanceType -Option constant -Scope global
            }
            else {
                $instanceType = $azstackHCIInstanceTypeObject.Value
                if (($instanceType -ne $AzStackHCIInstanceTypes.HyperVToAzStackHCI) -or
                    ($instanceType -ne $AzStackHCIInstanceTypes.VMwareToAzStackHCI)) {
                    throw "Currently, for AzStackHCI scenario, only HyperV and VMware as the source is supported."
                }
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
            $policyName = $replicationVault.Name + $instanceType + "policy"
            $policy = Get-AzMigratePolicy `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -Name $policyName `
                -VaultName $replicationVault.Name `
                -SubscriptionId $SubscriptionId `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $policy) {
                Write-Host "Creating Policy..."

                $params = @{
                    InstanceType                     = $instanceType;
                    RecoveryPointHistoryInMinute     = $ReplicationDetails.PolicyDetails.DefaultRecoveryPointHistoryInMinutes;
                    CrashConsistentFrequencyInMinute = $ReplicationDetails.PolicyDetails.DefaultCrashConsistentFrequencyInMinutes;
                    AppConsistentFrequencyInMinute   = $ReplicationDetails.PolicyDetails.DefaultAppConsistentFrequencyInMinutes;
                }

                # Setup Policy deployment parameters
                $policyProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.PolicyModelProperties]::new()
                if ($instanceType -eq $AzStackHCIInstanceTypes.HyperVToAzStackHCI) {
                    $policyCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHcipolicyModelCustomProperties]::new()
                }
                elseif ($instanceType -eq $AzStackHCIInstanceTypes.VMwareToAzStackHCI) {
                    $policyCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHcipolicyModelCustomProperties]::new()
                }
                else {
                    throw "Currently, for AzStackHCI scenario, only HyperV and VMware as the source is supported."
                }
                $policyCustomProperties.InstanceType = $params.InstanceType
                $policyCustomProperties.RecoveryPointHistoryInMinute = $params.RecoveryPointHistoryInMinute
                $policyCustomProperties.CrashConsistentFrequencyInMinute = $params.CrashConsistentFrequencyInMinute
                $policyCustomProperties.AppConsistentFrequencyInMinute = $params.AppConsistentFrequencyInMinute
                $policyProperties.CustomProperty = $policyCustomProperties
            
                $policyOperation = New-AzMigratePolicy `
                    -Name $policyName `
                    -ResourceGroupName $resourceGroup.ResourceGroupName `
                    -VaultName $replicationVaultName `
                    -Property $policyProperties `
                    -SubscriptionId $SubscriptionId
                $operationId = $policyOperation.Name

                # Check Policy creation status every 5s
                do {
                    $operationStatus = Get-AzMigratePolicyOperationStatus `
                        -PolicyName $policyName `
                        -ResourceGroupName $resourceGroup.ResourceGroupName `
                        -VaultName $replicationVault.Name `
                        -SubscriptionId $SubscriptionId `
                        -OperationId $operationId `
                        -ErrorVariable notPresent `
                        -ErrorAction SilentlyContinue
                    Start-Sleep -Seconds 5
                } while ($null -ne $operationStatus -and $operationStatus.Status -ne "Succeeded")

                Write-Host "New Policy created."
            }
            else {
                Write-Host "Existing Policy found."
            }
        
            $policy = Get-AzMigratePolicy `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -Name $policyName `
                -VaultName $replicationVault.Name `
                -SubscriptionId $SubscriptionId `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $policy) {
                throw "Policy '$($policyName)' may have been accidently deleted. Please re-run this command to re-create it."
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

            # Get Cache Storage Account
            $cacheStorageAccount = Get-AzStorageAccount `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -Name $cacheStorageAccountName `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $cacheStorageAccount) {
                # This should never throw.
                throw "Cache Storage Account '$($cacheStorageAccountName)' may have been accidently deleted. Please re-run this command to re-create it."
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
            Write-Host "*Selected Cache Stroage Account: '$($cacheStorageAccount.StorageAccountName)' in Location '$($cacheStorageAccount.Location)'."
        
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
                Write-Host "Waiting 2 minutes for Cache Storage Account permissions to sync before creating Replication Extension..."
                Start-Sleep -Seconds 120
                Write-Host "Creating Replication Extension..."

                $params = @{
                    InstanceType                = $instanceType;
                    SourceFabricArmId           = $sourceFabric.Id;
                    TargetFabricArmId           = $targetFabric.Id;
                    StorageAccountId            = $cacheStorageAccount.Id;
                    StorageAccountSasSecretName = $null;
                }

                # Setup Replication Extension deployment parameters
                $replicationExtensionProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.ReplicationExtensionModelProperties]::new()
            
                if ($instanceType -eq $AzStackHCIInstanceTypes.HyperVToAzStackHCI) {
                    $replicationExtensionCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHcireplicationExtensionModelCustomProperties]::new()
                    $replicationExtensionCustomProperties.HyperVFabricArmId = $params.SourceFabricArmId
                    
                }
                elseif ($instanceType -eq $AzStackHCIInstanceTypes.VMwareToAzStackHCI) {
                    $replicationExtensionCustomProperties = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.VMwareToAzStackHcireplicationExtensionModelCustomProperties]::new()
                    $replicationExtensionCustomProperties.VMwareFabricArmId = $params.SourceFabricArmId
                }
                else {
                    throw "Currently, for AzStackHCI scenario, only HyperV and VMware as the source is supported."
                }
                $replicationExtensionCustomProperties.InstanceType = $params.InstanceType
                $replicationExtensionCustomProperties.AzStackHCIFabricArmId = $params.TargetFabricArmId
                $replicationExtensionCustomProperties.StorageAccountId = $params.StorageAccountId
                $replicationExtensionCustomProperties.StorageAccountSasSecretName = $params.StorageAccountSasSecretName
                $replicationExtensionProperties.CustomProperty = $replicationExtensionCustomProperties
            
                $replicationExtensionOperation = New-AzMigrateReplicationExtension `
                    -Name $replicationExtensionName `
                    -ResourceGroupName $resourceGroup.ResourceGroupName `
                    -VaultName $replicationVaultName `
                    -Property $replicationExtensionProperties `
                    -SubscriptionId $SubscriptionId
                $operationId = $replicationExtensionOperation.Name

                # Check Replication Extension creation status every 5s
                do {
                    $operationStatus = Get-AzMigrateReplicationExtensionOperationStatus `
                        -ReplicationExtensionName $replicationExtensionName `
                        -ResourceGroupName $resourceGroup.ResourceGroupName `
                        -VaultName $replicationVault.Name `
                        -SubscriptionId $SubscriptionId `
                        -OperationId $operationId `
                        -ErrorVariable notPresent `
                        -ErrorAction SilentlyContinue
                    Start-Sleep -Seconds 5
                } while ($null -ne $operationStatus -and $operationStatus.Status -ne "Succeeded")

                Write-Host "New Replication Extension created."
            }
            else {
                Write-Host "Existing Replication Extension found."
            }

            # Get Replication Extension
            $replicationExtension = Get-AzMigrateReplicationExtension `
                -ResourceGroupName $resourceGroup.ResourceGroupName `
                -Name $replicationExtensionName `
                -VaultName $replicationVaultName `
                -SubscriptionId $SubscriptionId `
                -ErrorVariable notPresent `
                -ErrorAction SilentlyContinue
            if ($null -eq $replicationExtension) {
                # This should never throw.
                throw "Replication Extension '$($replicationExtensionName)' may have been accidently deleted. Please re-run this command to re-create it."
            }
            Write-Host "*Selected Replication Extension: '$($replicationExtension.Name)'."

            return $true
        }        
    }
}
