// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Extensions;

    /// <summary>List of VerificationStatusRecord</summary>
    public partial class DomainPropertiesVerificationStates :
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStates,
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal
    {

        /// <summary>Backing field for <see cref="Dkim" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord _dkim;

        /// <summary>A class that represents a VerificationStatus record.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dkim { get => (this._dkim = this._dkim ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set => this._dkim = value; }

        /// <summary>Backing field for <see cref="Dkim2" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord _dkim2;

        /// <summary>A class that represents a VerificationStatus record.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dkim2 { get => (this._dkim2 = this._dkim2 ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set => this._dkim2 = value; }

        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string Dkim2ErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).ErrorCode; }

        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string Dkim2Status { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).Status; }

        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DkimErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).ErrorCode; }

        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DkimStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).Status; }

        /// <summary>Backing field for <see cref="Dmarc" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord _dmarc;

        /// <summary>A class that represents a VerificationStatus record.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dmarc { get => (this._dmarc = this._dmarc ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set => this._dmarc = value; }

        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DmarcErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).ErrorCode; }

        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DmarcStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).Status; }

        /// <summary>Backing field for <see cref="Domain" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord _domain;

        /// <summary>A class that represents a VerificationStatus record.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Domain { get => (this._domain = this._domain ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set => this._domain = value; }

        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DomainErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).ErrorCode; }

        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string DomainStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).Status; }

        /// <summary>Internal Acessors for Dkim</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Dkim { get => (this._dkim = this._dkim ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set { {_dkim = value;} } }

        /// <summary>Internal Acessors for Dkim2</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Dkim2 { get => (this._dkim2 = this._dkim2 ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set { {_dkim2 = value;} } }

        /// <summary>Internal Acessors for Dkim2ErrorCode</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Dkim2ErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).ErrorCode; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).ErrorCode = value; }

        /// <summary>Internal Acessors for Dkim2Status</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Dkim2Status { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim2).Status = value; }

        /// <summary>Internal Acessors for DkimErrorCode</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DkimErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).ErrorCode; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).ErrorCode = value; }

        /// <summary>Internal Acessors for DkimStatus</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DkimStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dkim).Status = value; }

        /// <summary>Internal Acessors for Dmarc</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Dmarc { get => (this._dmarc = this._dmarc ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set { {_dmarc = value;} } }

        /// <summary>Internal Acessors for DmarcErrorCode</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DmarcErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).ErrorCode; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).ErrorCode = value; }

        /// <summary>Internal Acessors for DmarcStatus</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DmarcStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Dmarc).Status = value; }

        /// <summary>Internal Acessors for Domain</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Domain { get => (this._domain = this._domain ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set { {_domain = value;} } }

        /// <summary>Internal Acessors for DomainErrorCode</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DomainErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).ErrorCode; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).ErrorCode = value; }

        /// <summary>Internal Acessors for DomainStatus</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.DomainStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Domain).Status = value; }

        /// <summary>Internal Acessors for Spf</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.Spf { get => (this._spf = this._spf ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set { {_spf = value;} } }

        /// <summary>Internal Acessors for SpfErrorCode</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.SpfErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).ErrorCode; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).ErrorCode = value; }

        /// <summary>Internal Acessors for SpfStatus</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IDomainPropertiesVerificationStatesInternal.SpfStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).Status = value; }

        /// <summary>Backing field for <see cref="Spf" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord _spf;

        /// <summary>A class that represents a VerificationStatus record.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Spf { get => (this._spf = this._spf ?? new Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.VerificationStatusRecord()); set => this._spf = value; }

        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string SpfErrorCode { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).ErrorCode; }

        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Origin(Microsoft.Azure.PowerShell.Cmdlets.EmailService.PropertyOrigin.Inlined)]
        public string SpfStatus { get => ((Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecordInternal)Spf).Status; }

        /// <summary>Creates an new <see cref="DomainPropertiesVerificationStates" /> instance.</summary>
        public DomainPropertiesVerificationStates()
        {

        }
    }
    /// List of VerificationStatusRecord
    public partial interface IDomainPropertiesVerificationStates :
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.IJsonSerializable
    {
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Error code. This property will only be present if the status is UnableToVerify.",
        SerializedName = @"errorCode",
        PossibleTypes = new [] { typeof(string) })]
        string Dkim2ErrorCode { get;  }
        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Status of the verification operation.",
        SerializedName = @"status",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string Dkim2Status { get;  }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Error code. This property will only be present if the status is UnableToVerify.",
        SerializedName = @"errorCode",
        PossibleTypes = new [] { typeof(string) })]
        string DkimErrorCode { get;  }
        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Status of the verification operation.",
        SerializedName = @"status",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DkimStatus { get;  }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Error code. This property will only be present if the status is UnableToVerify.",
        SerializedName = @"errorCode",
        PossibleTypes = new [] { typeof(string) })]
        string DmarcErrorCode { get;  }
        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Status of the verification operation.",
        SerializedName = @"status",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DmarcStatus { get;  }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Error code. This property will only be present if the status is UnableToVerify.",
        SerializedName = @"errorCode",
        PossibleTypes = new [] { typeof(string) })]
        string DomainErrorCode { get;  }
        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Status of the verification operation.",
        SerializedName = @"status",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DomainStatus { get;  }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Error code. This property will only be present if the status is UnableToVerify.",
        SerializedName = @"errorCode",
        PossibleTypes = new [] { typeof(string) })]
        string SpfErrorCode { get;  }
        /// <summary>Status of the verification operation.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.EmailService.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Status of the verification operation.",
        SerializedName = @"status",
        PossibleTypes = new [] { typeof(string) })]
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string SpfStatus { get;  }

    }
    /// List of VerificationStatusRecord
    internal partial interface IDomainPropertiesVerificationStatesInternal

    {
        /// <summary>A class that represents a VerificationStatus record.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dkim { get; set; }
        /// <summary>A class that represents a VerificationStatus record.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dkim2 { get; set; }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        string Dkim2ErrorCode { get; set; }
        /// <summary>Status of the verification operation.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string Dkim2Status { get; set; }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        string DkimErrorCode { get; set; }
        /// <summary>Status of the verification operation.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DkimStatus { get; set; }
        /// <summary>A class that represents a VerificationStatus record.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Dmarc { get; set; }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        string DmarcErrorCode { get; set; }
        /// <summary>Status of the verification operation.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DmarcStatus { get; set; }
        /// <summary>A class that represents a VerificationStatus record.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Domain { get; set; }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        string DomainErrorCode { get; set; }
        /// <summary>Status of the verification operation.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string DomainStatus { get; set; }
        /// <summary>A class that represents a VerificationStatus record.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.EmailService.Models.IVerificationStatusRecord Spf { get; set; }
        /// <summary>Error code. This property will only be present if the status is UnableToVerify.</summary>
        string SpfErrorCode { get; set; }
        /// <summary>Status of the verification operation.</summary>
        [global::Microsoft.Azure.PowerShell.Cmdlets.EmailService.PSArgumentCompleterAttribute("NotStarted", "VerificationRequested", "VerificationInProgress", "VerificationFailed", "Verified", "CancellationRequested")]
        string SpfStatus { get; set; }

    }
}