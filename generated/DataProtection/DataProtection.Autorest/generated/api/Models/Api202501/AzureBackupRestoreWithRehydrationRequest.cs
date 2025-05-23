// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501
{
    using static Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.Extensions;

    /// <summary>AzureBackup Restore with Rehydration Request</summary>
    public partial class AzureBackupRestoreWithRehydrationRequest :
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreWithRehydrationRequest,
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreWithRehydrationRequestInternal,
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequest"
        /// />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequest __azureBackupRecoveryPointBasedRestoreRequest = new Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.AzureBackupRecoveryPointBasedRestoreRequest();

        /// <summary>
        /// Contains information of the Identity Details for the BI.
        /// If it is null, default will be considered as System Assigned.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IIdentityDetails IdentityDetail { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetail; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetail = value ?? null /* model class */; }

        /// <summary>Specifies if the BI is protected by System Identity.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public bool? IdentityDetailUseSystemAssignedIdentity { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetailUseSystemAssignedIdentity; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetailUseSystemAssignedIdentity = value ?? default(bool); }

        /// <summary>ARM URL for User Assigned Identity.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public string IdentityDetailUserAssignedIdentityArmUrl { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetailUserAssignedIdentityArmUrl; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).IdentityDetailUserAssignedIdentityArmUrl = value ?? null; }

        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public string ObjectType { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).ObjectType; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).ObjectType = value ; }

        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public string RecoveryPointId { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).RecoveryPointId; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).RecoveryPointId = value ; }

        /// <summary>Backing field for <see cref="RehydrationPriority" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.RehydrationPriority _rehydrationPriority;

        /// <summary>Priority to be used for rehydration. Values High or Standard</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Owned)]
        public Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.RehydrationPriority RehydrationPriority { get => this._rehydrationPriority; set => this._rehydrationPriority = value; }

        /// <summary>Backing field for <see cref="RehydrationRetentionDuration" /> property.</summary>
        private string _rehydrationRetentionDuration;

        /// <summary>Retention duration in ISO 8601 format i.e P10D .</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Owned)]
        public string RehydrationRetentionDuration { get => this._rehydrationRetentionDuration; set => this._rehydrationRetentionDuration = value; }

        /// <summary>ResourceGuardOperationRequests on which LAC check will be performed</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public string[] ResourceGuardOperationRequest { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).ResourceGuardOperationRequest; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).ResourceGuardOperationRequest = value ?? null /* arrayOf */; }

        /// <summary>Gets or sets the restore target information.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IRestoreTargetInfoBase RestoreTargetInfo { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).RestoreTargetInfo; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).RestoreTargetInfo = value ; }

        /// <summary>Gets or sets the type of the source data store.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.SourceDataStoreType SourceDataStoreType { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).SourceDataStoreType; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).SourceDataStoreType = value ; }

        /// <summary>
        /// Fully qualified Azure Resource Manager ID of the datasource which is being recovered.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.PropertyOrigin.Inherited)]
        public string SourceResourceId { get => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).SourceResourceId; set => ((Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRestoreRequestInternal)__azureBackupRecoveryPointBasedRestoreRequest).SourceResourceId = value ?? null; }

        /// <summary>
        /// Creates an new <see cref="AzureBackupRestoreWithRehydrationRequest" /> instance.
        /// </summary>
        public AzureBackupRestoreWithRehydrationRequest()
        {

        }

        /// <summary>Validates that this object meets the validation criteria.</summary>
        /// <param name="eventListener">an <see cref="Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.IEventListener" /> instance that will receive validation
        /// events.</param>
        /// <returns>
        /// A <see cref = "global::System.Threading.Tasks.Task" /> that will be complete when validation is completed.
        /// </returns>
        public async global::System.Threading.Tasks.Task Validate(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.IEventListener eventListener)
        {
            await eventListener.AssertNotNull(nameof(__azureBackupRecoveryPointBasedRestoreRequest), __azureBackupRecoveryPointBasedRestoreRequest);
            await eventListener.AssertObjectIsValid(nameof(__azureBackupRecoveryPointBasedRestoreRequest), __azureBackupRecoveryPointBasedRestoreRequest);
        }
    }
    /// AzureBackup Restore with Rehydration Request
    public partial interface IAzureBackupRestoreWithRehydrationRequest :
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequest
    {
        /// <summary>Priority to be used for rehydration. Values High or Standard</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.Info(
        Required = true,
        ReadOnly = false,
        Description = @"Priority to be used for rehydration. Values High or Standard",
        SerializedName = @"rehydrationPriority",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.RehydrationPriority) })]
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.RehydrationPriority RehydrationPriority { get; set; }
        /// <summary>Retention duration in ISO 8601 format i.e P10D .</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.Info(
        Required = true,
        ReadOnly = false,
        Description = @"Retention duration in ISO 8601 format i.e P10D .",
        SerializedName = @"rehydrationRetentionDuration",
        PossibleTypes = new [] { typeof(string) })]
        string RehydrationRetentionDuration { get; set; }

    }
    /// AzureBackup Restore with Rehydration Request
    internal partial interface IAzureBackupRestoreWithRehydrationRequestInternal :
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api202501.IAzureBackupRecoveryPointBasedRestoreRequestInternal
    {
        /// <summary>Priority to be used for rehydration. Values High or Standard</summary>
        Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.RehydrationPriority RehydrationPriority { get; set; }
        /// <summary>Retention duration in ISO 8601 format i.e P10D .</summary>
        string RehydrationRetentionDuration { get; set; }

    }
}