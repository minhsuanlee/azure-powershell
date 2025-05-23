// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Extensions;

    /// <summary>
    /// Specifies the vmmServer infrastructure specific settings for the virtual machine instance.
    /// </summary>
    public partial class InfrastructureProfile :
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfile,
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal
    {

        /// <summary>Backing field for <see cref="BiosGuid" /> property.</summary>
        private string _biosGuid;

        /// <summary>Gets or sets the bios guid for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string BiosGuid { get => this._biosGuid; set => this._biosGuid = value; }

        /// <summary>Backing field for <see cref="Checkpoint" /> property.</summary>
        private System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint> _checkpoint;

        /// <summary>Checkpoints in the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint> Checkpoint { get => this._checkpoint; }

        /// <summary>Backing field for <see cref="CheckpointType" /> property.</summary>
        private string _checkpointType;

        /// <summary>Type of checkpoint supported for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string CheckpointType { get => this._checkpointType; set => this._checkpointType = value; }

        /// <summary>Backing field for <see cref="CloudId" /> property.</summary>
        private string _cloudId;

        /// <summary>ARM Id of the cloud resource to use for deploying the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string CloudId { get => this._cloudId; set => this._cloudId = value; }

        /// <summary>Backing field for <see cref="Generation" /> property.</summary>
        private int? _generation;

        /// <summary>Gets or sets the generation for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Generation { get => this._generation; set => this._generation = value; }

        /// <summary>Backing field for <see cref="InventoryItemId" /> property.</summary>
        private string _inventoryItemId;

        /// <summary>Gets or sets the inventory Item ID for the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string InventoryItemId { get => this._inventoryItemId; set => this._inventoryItemId = value; }

        /// <summary>Backing field for <see cref="LastRestoredVMCheckpoint" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint _lastRestoredVMCheckpoint;

        /// <summary>Last restored checkpoint in the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint LastRestoredVMCheckpoint { get => (this._lastRestoredVMCheckpoint = this._lastRestoredVMCheckpoint ?? new Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.Checkpoint()); }

        /// <summary>Gets description of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Inlined)]
        public string LastRestoredVMCheckpointDescription { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Description; }

        /// <summary>Gets ID of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Inlined)]
        public string LastRestoredVMCheckpointId { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Id; }

        /// <summary>Gets name of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Inlined)]
        public string LastRestoredVMCheckpointName { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Name; }

        /// <summary>Gets ID of parent of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Inlined)]
        public string LastRestoredVMCheckpointParentCheckpointId { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).ParentCheckpointId; }

        /// <summary>Internal Acessors for Checkpoint</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint> Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.Checkpoint { get => this._checkpoint; set { {_checkpoint = value;} } }

        /// <summary>Internal Acessors for LastRestoredVMCheckpoint</summary>
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.LastRestoredVMCheckpoint { get => (this._lastRestoredVMCheckpoint = this._lastRestoredVMCheckpoint ?? new Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.Checkpoint()); set { {_lastRestoredVMCheckpoint = value;} } }

        /// <summary>Internal Acessors for LastRestoredVMCheckpointDescription</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.LastRestoredVMCheckpointDescription { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Description; set => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Description = value; }

        /// <summary>Internal Acessors for LastRestoredVMCheckpointId</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.LastRestoredVMCheckpointId { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Id; set => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Id = value; }

        /// <summary>Internal Acessors for LastRestoredVMCheckpointName</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.LastRestoredVMCheckpointName { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Name; set => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).Name = value; }

        /// <summary>Internal Acessors for LastRestoredVMCheckpointParentCheckpointId</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IInfrastructureProfileInternal.LastRestoredVMCheckpointParentCheckpointId { get => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).ParentCheckpointId; set => ((Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpointInternal)LastRestoredVMCheckpoint).ParentCheckpointId = value; }

        /// <summary>Backing field for <see cref="TemplateId" /> property.</summary>
        private string _templateId;

        /// <summary>ARM Id of the template resource to use for deploying the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string TemplateId { get => this._templateId; set => this._templateId = value; }

        /// <summary>Backing field for <see cref="Uuid" /> property.</summary>
        private string _uuid;

        /// <summary>Unique ID of the virtual machine.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string Uuid { get => this._uuid; set => this._uuid = value; }

        /// <summary>Backing field for <see cref="VMName" /> property.</summary>
        private string _vMName;

        /// <summary>VMName is the name of VM on the SCVmm server.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string VMName { get => this._vMName; set => this._vMName = value; }

        /// <summary>Backing field for <see cref="VmmServerId" /> property.</summary>
        private string _vmmServerId;

        /// <summary>ARM Id of the vmmServer resource in which this resource resides.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public string VmmServerId { get => this._vmmServerId; set => this._vmmServerId = value; }

        /// <summary>Creates an new <see cref="InfrastructureProfile" /> instance.</summary>
        public InfrastructureProfile()
        {

        }
    }
    /// Specifies the vmmServer infrastructure specific settings for the virtual machine instance.
    public partial interface IInfrastructureProfile :
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.IJsonSerializable
    {
        /// <summary>Gets or sets the bios guid for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"Gets or sets the bios guid for the vm.",
        SerializedName = @"biosGuid",
        PossibleTypes = new [] { typeof(string) })]
        string BiosGuid { get; set; }
        /// <summary>Checkpoints in the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Checkpoints in the vm.",
        SerializedName = @"checkpoints",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint) })]
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint> Checkpoint { get;  }
        /// <summary>Type of checkpoint supported for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Type of checkpoint supported for the vm.",
        SerializedName = @"checkpointType",
        PossibleTypes = new [] { typeof(string) })]
        string CheckpointType { get; set; }
        /// <summary>ARM Id of the cloud resource to use for deploying the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"ARM Id of the cloud resource to use for deploying the vm.",
        SerializedName = @"cloudId",
        PossibleTypes = new [] { typeof(string) })]
        string CloudId { get; set; }
        /// <summary>Gets or sets the generation for the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"Gets or sets the generation for the vm.",
        SerializedName = @"generation",
        PossibleTypes = new [] { typeof(int) })]
        int? Generation { get; set; }
        /// <summary>Gets or sets the inventory Item ID for the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"Gets or sets the inventory Item ID for the resource.",
        SerializedName = @"inventoryItemId",
        PossibleTypes = new [] { typeof(string) })]
        string InventoryItemId { get; set; }
        /// <summary>Gets description of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Gets description of the checkpoint.",
        SerializedName = @"description",
        PossibleTypes = new [] { typeof(string) })]
        string LastRestoredVMCheckpointDescription { get;  }
        /// <summary>Gets ID of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Gets ID of the checkpoint.",
        SerializedName = @"checkpointID",
        PossibleTypes = new [] { typeof(string) })]
        string LastRestoredVMCheckpointId { get;  }
        /// <summary>Gets name of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Gets name of the checkpoint.",
        SerializedName = @"name",
        PossibleTypes = new [] { typeof(string) })]
        string LastRestoredVMCheckpointName { get;  }
        /// <summary>Gets ID of parent of the checkpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Gets ID of parent of the checkpoint.",
        SerializedName = @"parentCheckpointID",
        PossibleTypes = new [] { typeof(string) })]
        string LastRestoredVMCheckpointParentCheckpointId { get;  }
        /// <summary>ARM Id of the template resource to use for deploying the vm.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"ARM Id of the template resource to use for deploying the vm.",
        SerializedName = @"templateId",
        PossibleTypes = new [] { typeof(string) })]
        string TemplateId { get; set; }
        /// <summary>Unique ID of the virtual machine.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"Unique ID of the virtual machine.",
        SerializedName = @"uuid",
        PossibleTypes = new [] { typeof(string) })]
        string Uuid { get; set; }
        /// <summary>VMName is the name of VM on the SCVmm server.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"VMName is the name of VM on the SCVmm server.",
        SerializedName = @"vmName",
        PossibleTypes = new [] { typeof(string) })]
        string VMName { get; set; }
        /// <summary>ARM Id of the vmmServer resource in which this resource resides.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = false,
        Description = @"ARM Id of the vmmServer resource in which this resource resides.",
        SerializedName = @"vmmServerId",
        PossibleTypes = new [] { typeof(string) })]
        string VmmServerId { get; set; }

    }
    /// Specifies the vmmServer infrastructure specific settings for the virtual machine instance.
    internal partial interface IInfrastructureProfileInternal

    {
        /// <summary>Gets or sets the bios guid for the vm.</summary>
        string BiosGuid { get; set; }
        /// <summary>Checkpoints in the vm.</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint> Checkpoint { get; set; }
        /// <summary>Type of checkpoint supported for the vm.</summary>
        string CheckpointType { get; set; }
        /// <summary>ARM Id of the cloud resource to use for deploying the vm.</summary>
        string CloudId { get; set; }
        /// <summary>Gets or sets the generation for the vm.</summary>
        int? Generation { get; set; }
        /// <summary>Gets or sets the inventory Item ID for the resource.</summary>
        string InventoryItemId { get; set; }
        /// <summary>Last restored checkpoint in the vm.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.ICheckpoint LastRestoredVMCheckpoint { get; set; }
        /// <summary>Gets description of the checkpoint.</summary>
        string LastRestoredVMCheckpointDescription { get; set; }
        /// <summary>Gets ID of the checkpoint.</summary>
        string LastRestoredVMCheckpointId { get; set; }
        /// <summary>Gets name of the checkpoint.</summary>
        string LastRestoredVMCheckpointName { get; set; }
        /// <summary>Gets ID of parent of the checkpoint.</summary>
        string LastRestoredVMCheckpointParentCheckpointId { get; set; }
        /// <summary>ARM Id of the template resource to use for deploying the vm.</summary>
        string TemplateId { get; set; }
        /// <summary>Unique ID of the virtual machine.</summary>
        string Uuid { get; set; }
        /// <summary>VMName is the name of VM on the SCVmm server.</summary>
        string VMName { get; set; }
        /// <summary>ARM Id of the vmmServer resource in which this resource resides.</summary>
        string VmmServerId { get; set; }

    }
}