// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Extensions;

    /// <summary>
    /// Summarization of patches available for installation on the machine by classification.
    /// </summary>
    public partial class AvailablePatchCountByClassification :
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassification,
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal
    {

        /// <summary>Backing field for <see cref="Critical" /> property.</summary>
        private int? _critical;

        /// <summary>Number of critical patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Critical { get => this._critical; }

        /// <summary>Backing field for <see cref="Definition" /> property.</summary>
        private int? _definition;

        /// <summary>Number of definition patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Definition { get => this._definition; }

        /// <summary>Backing field for <see cref="FeaturePack" /> property.</summary>
        private int? _featurePack;

        /// <summary>Number of feature pack patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? FeaturePack { get => this._featurePack; }

        /// <summary>Internal Acessors for Critical</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Critical { get => this._critical; set { {_critical = value;} } }

        /// <summary>Internal Acessors for Definition</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Definition { get => this._definition; set { {_definition = value;} } }

        /// <summary>Internal Acessors for FeaturePack</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.FeaturePack { get => this._featurePack; set { {_featurePack = value;} } }

        /// <summary>Internal Acessors for Other</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Other { get => this._other; set { {_other = value;} } }

        /// <summary>Internal Acessors for Security</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Security { get => this._security; set { {_security = value;} } }

        /// <summary>Internal Acessors for ServicePack</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.ServicePack { get => this._servicePack; set { {_servicePack = value;} } }

        /// <summary>Internal Acessors for Tool</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Tool { get => this._tool; set { {_tool = value;} } }

        /// <summary>Internal Acessors for Update</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.Update { get => this._update; set { {_update = value;} } }

        /// <summary>Internal Acessors for UpdateRollup</summary>
        int? Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Models.IAvailablePatchCountByClassificationInternal.UpdateRollup { get => this._updateRollup; set { {_updateRollup = value;} } }

        /// <summary>Backing field for <see cref="Other" /> property.</summary>
        private int? _other;

        /// <summary>Number of other patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Other { get => this._other; }

        /// <summary>Backing field for <see cref="Security" /> property.</summary>
        private int? _security;

        /// <summary>Number of security patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Security { get => this._security; }

        /// <summary>Backing field for <see cref="ServicePack" /> property.</summary>
        private int? _servicePack;

        /// <summary>Number of service pack patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? ServicePack { get => this._servicePack; }

        /// <summary>Backing field for <see cref="Tool" /> property.</summary>
        private int? _tool;

        /// <summary>Number of tools patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Tool { get => this._tool; }

        /// <summary>Backing field for <see cref="Update" /> property.</summary>
        private int? _update;

        /// <summary>Number of updates category patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? Update { get => this._update; }

        /// <summary>Backing field for <see cref="UpdateRollup" /> property.</summary>
        private int? _updateRollup;

        /// <summary>Number of update Rollup patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Origin(Microsoft.Azure.PowerShell.Cmdlets.ScVmm.PropertyOrigin.Owned)]
        public int? UpdateRollup { get => this._updateRollup; }

        /// <summary>Creates an new <see cref="AvailablePatchCountByClassification" /> instance.</summary>
        public AvailablePatchCountByClassification()
        {

        }
    }
    /// Summarization of patches available for installation on the machine by classification.
    public partial interface IAvailablePatchCountByClassification :
        Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.IJsonSerializable
    {
        /// <summary>Number of critical patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of critical patches available for installation.",
        SerializedName = @"critical",
        PossibleTypes = new [] { typeof(int) })]
        int? Critical { get;  }
        /// <summary>Number of definition patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of definition patches available for installation.",
        SerializedName = @"definition",
        PossibleTypes = new [] { typeof(int) })]
        int? Definition { get;  }
        /// <summary>Number of feature pack patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of feature pack patches available for installation.",
        SerializedName = @"featurePack",
        PossibleTypes = new [] { typeof(int) })]
        int? FeaturePack { get;  }
        /// <summary>Number of other patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of other patches available for installation.",
        SerializedName = @"other",
        PossibleTypes = new [] { typeof(int) })]
        int? Other { get;  }
        /// <summary>Number of security patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of security patches available for installation.",
        SerializedName = @"security",
        PossibleTypes = new [] { typeof(int) })]
        int? Security { get;  }
        /// <summary>Number of service pack patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of service pack patches available for installation.",
        SerializedName = @"servicePack",
        PossibleTypes = new [] { typeof(int) })]
        int? ServicePack { get;  }
        /// <summary>Number of tools patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of tools patches available for installation.",
        SerializedName = @"tools",
        PossibleTypes = new [] { typeof(int) })]
        int? Tool { get;  }
        /// <summary>Number of updates category patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of updates category patches available for installation.",
        SerializedName = @"updates",
        PossibleTypes = new [] { typeof(int) })]
        int? Update { get;  }
        /// <summary>Number of update Rollup patches available for installation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.ScVmm.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Number of update Rollup patches available for installation.",
        SerializedName = @"updateRollup",
        PossibleTypes = new [] { typeof(int) })]
        int? UpdateRollup { get;  }

    }
    /// Summarization of patches available for installation on the machine by classification.
    internal partial interface IAvailablePatchCountByClassificationInternal

    {
        /// <summary>Number of critical patches available for installation.</summary>
        int? Critical { get; set; }
        /// <summary>Number of definition patches available for installation.</summary>
        int? Definition { get; set; }
        /// <summary>Number of feature pack patches available for installation.</summary>
        int? FeaturePack { get; set; }
        /// <summary>Number of other patches available for installation.</summary>
        int? Other { get; set; }
        /// <summary>Number of security patches available for installation.</summary>
        int? Security { get; set; }
        /// <summary>Number of service pack patches available for installation.</summary>
        int? ServicePack { get; set; }
        /// <summary>Number of tools patches available for installation.</summary>
        int? Tool { get; set; }
        /// <summary>Number of updates category patches available for installation.</summary>
        int? Update { get; set; }
        /// <summary>Number of update Rollup patches available for installation.</summary>
        int? UpdateRollup { get; set; }

    }
}