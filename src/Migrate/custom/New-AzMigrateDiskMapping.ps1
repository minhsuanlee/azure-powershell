
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
Creates a new disk mapping
.Description
The New-AzMigrateDiskMapping cmdlet creates a mapping of the source disk attached to the server to be migrated
.Link
https://learn.microsoft.com/powershell/module/az.migrate/new-azmigratediskmapping
#>
function New-AzMigrateDiskMapping {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.IHyperVToAzStackHCIDiskInput], ParameterSetName = "AzStackHCI")]
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.IVMwareCbtDiskInput], ParameterSetName = "agentlessVMware")]
    [CmdletBinding(DefaultParameterSetName = 'agentlessVMware', PositionalBinding = $false)]
    param(
        [Parameter(ParameterSetName = 'AzStackHCI', Mandatory, Position = 0)]
        [Switch]
        # Specifies the migration target is AzStackHCI.
        ${AzStackHCI},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the disk ID of the disk attached to the discovered server to be migrated.
        ${DiskID},

        [Parameter(Mandatory)]
        [ValidateSet("true" , "false")]
        [ArgumentCompleter( { "true" , "false" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies whether the disk contains the Operating System for the source server to be migrated.
        ${IsOSDisk},

        [Parameter(ParameterSetName = 'agentlessVMware', Mandatory)]
        [ValidateSet("Standard_LRS", "Premium_LRS", "StandardSSD_LRS")]
        [ArgumentCompleter( { "Standard_LRS", "Premium_LRS", "StandardSSD_LRS" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the type of disks to be used for the Azure VM.
        ${DiskType},

        [Parameter(ParameterSetName = 'agentlessVMware')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the disk encyption set to be used.
        ${DiskEncryptionSetID},

        [Parameter(ParameterSetName = 'AzStackHCI', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Boolean]
        # Specifies whether the disk is dynamic.
        ${IsDynamic},

        [Parameter(ParameterSetName = 'AzStackHCI', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.Int64]
        # Specifies the disk size in GB.
        ${Size},

        [Parameter(ParameterSetName = 'AzStackHCI', Mandatory)]
        [ValidateSet("VHD", "VHDX")]
        [ArgumentCompleter( { "VHD", "VHDX" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the disk format.
        ${Format}
    )
    
    process {
        if ($PSBoundParameters.ContainsKey('AzStackHCI')) {
            $scenario = "AzStackHCI"
        }
        else {
            $scenario = "agentlessVMware"
        }

        # Remove common optional parameter -AzStackHCI
        $null = $PSBoundParameters.Remove('AzStackHCI')

        if ($scenario -eq "agentlessVMware") {
            $DiskObject = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202301.VMwareCbtDiskInput]::new()
            $DiskObject.DiskId = $DiskID

            $validDiskTypeSpellings = @{ 
                Standard_LRS    = "Standard_LRS";
                Premium_LRS     = "Premium_LRS";
                StandardSSD_LRS = "StandardSSD_LRS"
            }
            $DiskObject.DiskType = $validDiskTypeSpellings[$DiskType]

            $validBooleanSpellings = @{ 
                true  = "true";
                false = "false"
            }
            $DiskObject.IsOSDisk = $validBooleanSpellings[$IsOSDisk]
            if ($PSBoundParameters.ContainsKey('DiskEncryptionSetID')) {
                $DiskObject.DiskEncryptionSetId = $DiskEncryptionSetID
            }
            return $DiskObject 
        }
        else {
            $DiskObject = [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20210216Preview.HyperVToAzStackHCIDiskInput]::new()
            $DiskObject.DiskId = $DiskID
            $DiskObject.IsDynamic = $IsDynamic
            $DiskObject.DiskSizeGB = $Size
            $DiskObject.DiskFileFormat = $Format

            $validBooleanSpellings = @{ 
                true  = "true";
                false = "false"
            }
            $DiskObject.IsOSDisk = $validBooleanSpellings[$IsOSDisk]

            return $DiskObject 
        }
    }
}   