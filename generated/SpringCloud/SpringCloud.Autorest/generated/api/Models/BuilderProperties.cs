// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Extensions;

    /// <summary>KPack Builder properties payload</summary>
    public partial class BuilderProperties :
        Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuilderProperties,
        Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuilderPropertiesInternal
    {

        /// <summary>Backing field for <see cref="BuildpackGroup" /> property.</summary>
        private System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuildpacksGroupProperties> _buildpackGroup;

        /// <summary>Builder buildpack groups.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PropertyOrigin.Owned)]
        public System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuildpacksGroupProperties> BuildpackGroup { get => this._buildpackGroup; set => this._buildpackGroup = value; }

        /// <summary>Internal Acessors for ProvisioningState</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuilderPropertiesInternal.ProvisioningState { get => this._provisioningState; set { {_provisioningState = value;} } }

        /// <summary>Internal Acessors for Stack</summary>
        Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackProperties Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuilderPropertiesInternal.Stack { get => (this._stack = this._stack ?? new Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.StackProperties()); set { {_stack = value;} } }

        /// <summary>Backing field for <see cref="ProvisioningState" /> property.</summary>
        private string _provisioningState;

        /// <summary>Builder provision status.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PropertyOrigin.Owned)]
        public string ProvisioningState { get => this._provisioningState; }

        /// <summary>Backing field for <see cref="Stack" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackProperties _stack;

        /// <summary>Builder cluster stack property.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackProperties Stack { get => (this._stack = this._stack ?? new Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.StackProperties()); set => this._stack = value; }

        /// <summary>Id of the ClusterStack.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PropertyOrigin.Inlined)]
        public string StackId { get => ((Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackPropertiesInternal)Stack).Id; set => ((Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackPropertiesInternal)Stack).Id = value ?? null; }

        /// <summary>Version of the ClusterStack</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PropertyOrigin.Inlined)]
        public string StackVersion { get => ((Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackPropertiesInternal)Stack).Version; set => ((Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackPropertiesInternal)Stack).Version = value ?? null; }

        /// <summary>Creates an new <see cref="BuilderProperties" /> instance.</summary>
        public BuilderProperties()
        {

        }
    }
    /// KPack Builder properties payload
    public partial interface IBuilderProperties :
        Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.IJsonSerializable
    {
        /// <summary>Builder buildpack groups.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Builder buildpack groups.",
        SerializedName = @"buildpackGroups",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuildpacksGroupProperties) })]
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuildpacksGroupProperties> BuildpackGroup { get; set; }
        /// <summary>Builder provision status.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Builder provision status.",
        SerializedName = @"provisioningState",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PSArgumentCompleterAttribute("Creating", "Updating", "Succeeded", "Failed", "Deleting")]
        string ProvisioningState { get;  }
        /// <summary>Id of the ClusterStack.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Id of the ClusterStack.",
        SerializedName = @"id",
        PossibleTypes = new [] { typeof(string) })]
        string StackId { get; set; }
        /// <summary>Version of the ClusterStack</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Version of the ClusterStack",
        SerializedName = @"version",
        PossibleTypes = new [] { typeof(string) })]
        string StackVersion { get; set; }

    }
    /// KPack Builder properties payload
    internal partial interface IBuilderPropertiesInternal

    {
        /// <summary>Builder buildpack groups.</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IBuildpacksGroupProperties> BuildpackGroup { get; set; }
        /// <summary>Builder provision status.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.PSArgumentCompleterAttribute("Creating", "Updating", "Succeeded", "Failed", "Deleting")]
        string ProvisioningState { get; set; }
        /// <summary>Builder cluster stack property.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.SpringCloud.Models.IStackProperties Stack { get; set; }
        /// <summary>Id of the ClusterStack.</summary>
        string StackId { get; set; }
        /// <summary>Version of the ClusterStack</summary>
        string StackVersion { get; set; }

    }
}