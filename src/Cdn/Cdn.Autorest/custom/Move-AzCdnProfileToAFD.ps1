
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Migrate the CDN profile to Azure Frontdoor(Standard/Premium) profile.
This step prepares the profile for migration and will be followed by Commit to finalize the migration.
.Description
Migrate the CDN profile to Azure Frontdoor(Standard/Premium) profile.
This step prepares the profile for migration and will be followed by Commit to finalize the migration.

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.ICdnMigrationToAfdParameters
.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.ICdnIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.IMigrateResult
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <ICdnIdentity>: Identity Parameter
  [CustomDomainName <String>]: Name of the domain under the profile which is unique globally.
  [EndpointName <String>]: Name of the endpoint under the profile which is unique globally.
  [Id <String>]: Resource identity path
  [KeyGroupName <String>]: Name of the KeyGroup under the profile.
  [OriginGroupName <String>]: Name of the origin group which is unique within the endpoint.
  [OriginName <String>]: Name of the origin which is unique within the profile.
  [ProfileName <String>]: Name of the Azure Front Door Standard or Azure Front Door Premium which is unique within the resource group.
  [ResourceGroupName <String>]: Name of the Resource group within the Azure subscription.
  [RouteName <String>]: Name of the routing rule.
  [RuleName <String>]: Name of the delivery rule which is unique within the endpoint.
  [RuleSetName <String>]: Name of the rule set under the profile which is unique globally.
  [SecretName <String>]: Name of the Secret under the profile.
  [SecurityPolicyName <String>]: Name of the security policy under the profile.
  [SubscriptionId <String>]: Azure Subscription ID.

MIGRATIONENDPOINTMAPPING <IMigrationEndpointMapping[]>: A name map between classic CDN endpoints and AFD Premium/Standard endpoints.
  [MigratedFrom <String>]: The name of the old endpoint.
  [MigratedTo <String>]: The name for the new endpoint.

MIGRATIONPARAMETER <ICdnMigrationToAfdParameters>: Request body for Migrate operation.
  [MigrationEndpointMapping <IMigrationEndpointMapping[]>]: A name map between classic CDN endpoints and AFD Premium/Standard endpoints.
    [MigratedFrom <String>]: The name of the old endpoint.
    [MigratedTo <String>]: The name for the new endpoint.
  [SkuName <SkuName?>]: Name of the pricing tier.
.Link
https://learn.microsoft.com/powershell/module/az.cdn/move-azcdnprofiletoafd
#>
function Move-AzCdnProfileToAFD {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.IMigrateResult])]
    [CmdletBinding(DefaultParameterSetName='MigrateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(ParameterSetName='Migrate', Mandatory)]
        [Parameter(ParameterSetName='MigrateExpanded', Mandatory)]
        [Parameter(ParameterSetName='MigrateViaJsonFilePath', Mandatory)]
        [Parameter(ParameterSetName='MigrateViaJsonString', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [System.String]
        # Name of the Azure Front Door Standard or Azure Front Door Premium which is unique within the resource group.
        ${ProfileName},
    
        [Parameter(ParameterSetName='Migrate', Mandatory)]
        [Parameter(ParameterSetName='MigrateExpanded', Mandatory)]
        [Parameter(ParameterSetName='MigrateViaJsonFilePath', Mandatory)]
        [Parameter(ParameterSetName='MigrateViaJsonString', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},
    
        [Parameter(ParameterSetName='Migrate')]
        [Parameter(ParameterSetName='MigrateExpanded')]
        [Parameter(ParameterSetName='MigrateViaJsonFilePath')]
        [Parameter(ParameterSetName='MigrateViaJsonString')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # Azure Subscription ID.
        ${SubscriptionId},

        [Parameter(ParameterSetName='Migrate')]
        [Parameter(ParameterSetName='MigrateExpanded')]
        [Parameter(ParameterSetName='MigrateViaJsonFilePath')]
        [Parameter(ParameterSetName='MigrateViaJsonString')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [System.String]
        # Azure Subscription ID.
        ${IdentityType},
    
        [Parameter(ParameterSetName='MigrateViaIdentity', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName='MigrateViaIdentityExpanded', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.ICdnIdentity]
        # Identity Parameter
        ${InputObject},
    
        [Parameter(ParameterSetName='Migrate', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName='MigrateViaIdentity', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.ICdnMigrationToAfdParameters]
        # Request body for Migrate operation.
        ${MigrationParameter},
    
        [Parameter(ParameterSetName='MigrateExpanded')]
        [Parameter(ParameterSetName='MigrateViaIdentityExpanded')]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.IMigrationEndpointMapping[]]
        # A name map between classic CDN endpoints and AFD Premium/Standard endpoints.
        ${MigrationEndpointMapping},
    
        [Parameter(ParameterSetName='MigrateExpanded')]
        [Parameter(ParameterSetName='MigrateViaIdentityExpanded')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.PSArgumentCompleterAttribute("Standard_Verizon", "Premium_Verizon", "Custom_Verizon", "Standard_Akamai", "Standard_ChinaCdn", "Standard_Microsoft", "Standard_AzureFrontDoor", "Premium_AzureFrontDoor", "Standard_955BandWidth_ChinaCdn", "Standard_AvgBandWidth_ChinaCdn", "StandardPlus_ChinaCdn", "StandardPlus_955BandWidth_ChinaCdn", "StandardPlus_AvgBandWidth_ChinaCdn")]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [System.String]
        # Name of the pricing tier.
        ${SkuName},
    
        [Parameter(ParameterSetName='MigrateViaJsonFilePath', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [System.String]
        # Path of Json file supplied to the Migrate operation
        ${JsonFilePath},
    
        [Parameter(ParameterSetName='MigrateViaJsonString', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [System.String]
        # Json string supplied to the Migrate operation
        ${JsonString},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The DefaultProfile parameter is not functional.
        # Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.
        ${DefaultProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    process {
        ValidateIdentityType
        Write-Host("Start the initial progress of migration of CDN profile to Azure Front Door.")

        [void]$PSBoundParameters.Remove("IdentityType")
        [void]$PSBoundParameters.Remove("IdentityUserAssignedIdentity")

        Az.Cdn.internal\Move-AzFrontDoorCdnCdnProfilesTo @PSBoundParameters

        Write-Host("Migration of endpoint completed.")

        if (${IdentityType}) {
            Write-Host("Now enabling managed identity.")

            [void]$PSBoundParameters.Remove("MigrationParameter")
            [void]$PSBoundParameters.Remove("MigrationEndpointMapping")
            [void]$PSBoundParameters.Remove("SkuName")
            
            [void]$PSBoundParameters.Add("IdentityType", ${IdentityType})
            [void]$PSBoundParameters.Add("IdentityUserAssignedIdentity", ${IdentityUserAssignedIdentity})

            try {
                Az.Cdn.internal\Update-AzCdnProfile @PSBoundParameters
            }
            catch {
                Write-Host("Enabling managed identity failed, please check the error message.")
    
                Write-Error $_.Exception.Message
            }
        }

        Write-Host("Now you can commit the migration to finalize the migration process.")
    }
    }
    
function ValidateIdentityType {
    if (${IdentityType}) {
        $identityTypeArray =  ${IdentityType}.ToString().split(",")
        if (($identityTypeArray.Count -gt 2)) {
            throw "The IdentityType is invalid. The supported types are 'SystemAssigned,UserAssigned' when the CDN has Customer Certificates during migration."
        }
        foreach($identity in $identityTypeArray) {
            $id = $identity.Trim().ToLower()
            if (($id -ne "userassigned") -and ($id -ne "systemassigned")) {
                throw "The IdentityType is invalid. The supported types are 'SystemAssigned,UserAssigned' when the CDN has Customer Certificates during migration."
            }
            if ($id -eq "userassigned") {
                if (${IdentityUserAssignedIdentity}.count -eq 0) {
                    throw "Identities should not be empty or null to be assigned when using User Assigned type."
                }
            }
        }
    }
}