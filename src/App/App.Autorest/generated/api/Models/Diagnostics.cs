// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.App.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Extensions;

    /// <summary>Diagnostics data for a resource.</summary>
    public partial class Diagnostics :
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnostics,
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal,
        Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.App.Models.IProxyResource" />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.App.Models.IProxyResource __proxyResource = new Microsoft.Azure.PowerShell.Cmdlets.App.Models.ProxyResource();

        /// <summary>Collection of properties</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadataPropertyBagItem> DataProviderMetadataPropertyBag { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadataPropertyBag; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadataPropertyBag = value ?? null /* arrayOf */; }

        /// <summary>Name of data provider</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string DataProviderMetadataProviderName { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadataProviderName; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadataProviderName = value ?? null; }

        /// <summary>Set of data collections associated with the response.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDataApiResponse> Dataset { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Dataset; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Dataset = value ?? null /* arrayOf */; }

        /// <summary>
        /// Fully qualified resource ID for the resource. Ex - /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{resourceType}/{resourceName}
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Id; }

        /// <summary>List of analysis types</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public System.Collections.Generic.List<string> MetadataAnalysisType { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataAnalysisType; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataAnalysisType = value ?? null /* arrayOf */; }

        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataAuthor { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataAuthor; }

        /// <summary>Category of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataCategory { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataCategory; }

        /// <summary>Details of the diagnostics info</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataDescription { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataDescription; }

        /// <summary>Unique detector name</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataId { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataId; }

        /// <summary>Display Name of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataName { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataName; }

        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public float? MetadataScore { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataScore; }

        /// <summary>List of support topics</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticSupportTopic> MetadataSupportTopicList { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataSupportTopicList; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataSupportTopicList = value ?? null /* arrayOf */; }

        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string MetadataType { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataType; }

        /// <summary>Internal Acessors for DataProviderMetadata</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadata Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.DataProviderMetadata { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadata; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).DataProviderMetadata = value; }

        /// <summary>Internal Acessors for Metadata</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDefinition Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.Metadata { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Metadata; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Metadata = value; }

        /// <summary>Internal Acessors for MetadataAuthor</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataAuthor { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataAuthor; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataAuthor = value; }

        /// <summary>Internal Acessors for MetadataCategory</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataCategory { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataCategory; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataCategory = value; }

        /// <summary>Internal Acessors for MetadataDescription</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataDescription { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataDescription; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataDescription = value; }

        /// <summary>Internal Acessors for MetadataId</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataId { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataId; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataId = value; }

        /// <summary>Internal Acessors for MetadataName</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataName { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataName; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataName = value; }

        /// <summary>Internal Acessors for MetadataScore</summary>
        float? Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataScore { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataScore; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataScore = value; }

        /// <summary>Internal Acessors for MetadataType</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.MetadataType { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataType; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).MetadataType = value; }

        /// <summary>Internal Acessors for Property</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsProperties Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.App.Models.DiagnosticsProperties()); set { {_property = value;} } }

        /// <summary>Internal Acessors for Status</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsStatus Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsInternal.Status { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Status; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).Status = value; }

        /// <summary>Internal Acessors for Id</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal.Id { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Id; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Id = value; }

        /// <summary>Internal Acessors for Name</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal.Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Name; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Name = value; }

        /// <summary>Internal Acessors for SystemData</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.ISystemData Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal.SystemData { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemData; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemData = value; }

        /// <summary>Internal Acessors for Type</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal.Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Type; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Type = value; }

        /// <summary>The name of the resource</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.FormatTable(Index = 0)]
        public string Name { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Name; }

        /// <summary>Backing field for <see cref="Property" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsProperties _property;

        /// <summary>Diagnostics resource specific properties</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Owned)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        internal Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsProperties Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.App.Models.DiagnosticsProperties()); set => this._property = value; }

        /// <summary>Gets the resource group name</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Owned)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.FormatTable(Index = 1)]
        public string ResourceGroupName { get => (new global::System.Text.RegularExpressions.Regex("^/subscriptions/(?<subscriptionId>[^/]+)/resourceGroups/(?<resourceGroupName>[^/]+)/providers/", global::System.Text.RegularExpressions.RegexOptions.IgnoreCase).Match(this.Id).Success ? new global::System.Text.RegularExpressions.Regex("^/subscriptions/(?<subscriptionId>[^/]+)/resourceGroups/(?<resourceGroupName>[^/]+)/providers/", global::System.Text.RegularExpressions.RegexOptions.IgnoreCase).Match(this.Id).Groups["resourceGroupName"].Value : null); }

        /// <summary>Status</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public int? StatusId { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).StatusId; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).StatusId = value ?? default(int); }

        /// <summary>Diagnostic message</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inlined)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string StatusMessage { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).StatusMessage; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsPropertiesInternal)Property).StatusMessage = value ?? null; }

        /// <summary>
        /// Azure Resource Manager metadata containing createdBy and modifiedBy information.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        internal Microsoft.Azure.PowerShell.Cmdlets.App.Models.ISystemData SystemData { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemData; }

        /// <summary>The timestamp of resource creation (UTC).</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public global::System.DateTime? SystemDataCreatedAt { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedAt; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedAt = value ?? default(global::System.DateTime); }

        /// <summary>The identity that created the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string SystemDataCreatedBy { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedBy; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedBy = value ?? null; }

        /// <summary>The type of identity that created the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string SystemDataCreatedByType { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedByType; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataCreatedByType = value ?? null; }

        /// <summary>The timestamp of resource last modification (UTC)</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public global::System.DateTime? SystemDataLastModifiedAt { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedAt; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedAt = value ?? default(global::System.DateTime); }

        /// <summary>The identity that last modified the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string SystemDataLastModifiedBy { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedBy; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedBy = value ?? null; }

        /// <summary>The type of identity that last modified the resource.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string SystemDataLastModifiedByType { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedByType; set => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).SystemDataLastModifiedByType = value ?? null; }

        /// <summary>
        /// The type of the resource. E.g. "Microsoft.Compute/virtualMachines" or "Microsoft.Storage/storageAccounts"
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Origin(Microsoft.Azure.PowerShell.Cmdlets.App.PropertyOrigin.Inherited)]
        [Microsoft.Azure.PowerShell.Cmdlets.App.DoNotFormat]
        public string Type { get => ((Microsoft.Azure.PowerShell.Cmdlets.App.Models.IResourceInternal)__proxyResource).Type; }

        /// <summary>Creates an new <see cref="Diagnostics" /> instance.</summary>
        public Diagnostics()
        {

        }

        /// <summary>Validates that this object meets the validation criteria.</summary>
        /// <param name="eventListener">an <see cref="Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.IEventListener" /> instance that will receive validation
        /// events.</param>
        /// <returns>
        /// A <see cref = "global::System.Threading.Tasks.Task" /> that will be complete when validation is completed.
        /// </returns>
        public async global::System.Threading.Tasks.Task Validate(Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.IEventListener eventListener)
        {
            await eventListener.AssertNotNull(nameof(__proxyResource), __proxyResource);
            await eventListener.AssertObjectIsValid(nameof(__proxyResource), __proxyResource);
        }
    }
    /// Diagnostics data for a resource.
    public partial interface IDiagnostics :
        Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IProxyResource
    {
        /// <summary>Collection of properties</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Collection of properties",
        SerializedName = @"propertyBag",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadataPropertyBagItem) })]
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadataPropertyBagItem> DataProviderMetadataPropertyBag { get; set; }
        /// <summary>Name of data provider</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Name of data provider",
        SerializedName = @"providerName",
        PossibleTypes = new [] { typeof(string) })]
        string DataProviderMetadataProviderName { get; set; }
        /// <summary>Set of data collections associated with the response.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Set of data collections associated with the response.",
        SerializedName = @"dataset",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDataApiResponse) })]
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDataApiResponse> Dataset { get; set; }
        /// <summary>List of analysis types</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"List of analysis types",
        SerializedName = @"analysisTypes",
        PossibleTypes = new [] { typeof(string) })]
        System.Collections.Generic.List<string> MetadataAnalysisType { get; set; }
        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Authors' names of the detector",
        SerializedName = @"author",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataAuthor { get;  }
        /// <summary>Category of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Category of the detector",
        SerializedName = @"category",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataCategory { get;  }
        /// <summary>Details of the diagnostics info</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Details of the diagnostics info",
        SerializedName = @"description",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataDescription { get;  }
        /// <summary>Unique detector name</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Unique detector name",
        SerializedName = @"id",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataId { get;  }
        /// <summary>Display Name of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Display Name of the detector",
        SerializedName = @"name",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataName { get;  }
        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Authors' names of the detector",
        SerializedName = @"score",
        PossibleTypes = new [] { typeof(float) })]
        float? MetadataScore { get;  }
        /// <summary>List of support topics</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"List of support topics",
        SerializedName = @"supportTopicList",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticSupportTopic) })]
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticSupportTopic> MetadataSupportTopicList { get; set; }
        /// <summary>Authors' names of the detector</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = true,
        Read = true,
        Create = false,
        Update = false,
        Description = @"Authors' names of the detector",
        SerializedName = @"type",
        PossibleTypes = new [] { typeof(string) })]
        string MetadataType { get;  }
        /// <summary>Status</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Status",
        SerializedName = @"statusId",
        PossibleTypes = new [] { typeof(int) })]
        int? StatusId { get; set; }
        /// <summary>Diagnostic message</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.App.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Read = true,
        Create = true,
        Update = true,
        Description = @"Diagnostic message",
        SerializedName = @"message",
        PossibleTypes = new [] { typeof(string) })]
        string StatusMessage { get; set; }

    }
    /// Diagnostics data for a resource.
    internal partial interface IDiagnosticsInternal :
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IProxyResourceInternal
    {
        /// <summary>List of data providers' metadata.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadata DataProviderMetadata { get; set; }
        /// <summary>Collection of properties</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticDataProviderMetadataPropertyBagItem> DataProviderMetadataPropertyBag { get; set; }
        /// <summary>Name of data provider</summary>
        string DataProviderMetadataProviderName { get; set; }
        /// <summary>Set of data collections associated with the response.</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDataApiResponse> Dataset { get; set; }
        /// <summary>Metadata of the diagnostics response.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsDefinition Metadata { get; set; }
        /// <summary>List of analysis types</summary>
        System.Collections.Generic.List<string> MetadataAnalysisType { get; set; }
        /// <summary>Authors' names of the detector</summary>
        string MetadataAuthor { get; set; }
        /// <summary>Category of the detector</summary>
        string MetadataCategory { get; set; }
        /// <summary>Details of the diagnostics info</summary>
        string MetadataDescription { get; set; }
        /// <summary>Unique detector name</summary>
        string MetadataId { get; set; }
        /// <summary>Display Name of the detector</summary>
        string MetadataName { get; set; }
        /// <summary>Authors' names of the detector</summary>
        float? MetadataScore { get; set; }
        /// <summary>List of support topics</summary>
        System.Collections.Generic.List<Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticSupportTopic> MetadataSupportTopicList { get; set; }
        /// <summary>Authors' names of the detector</summary>
        string MetadataType { get; set; }
        /// <summary>Diagnostics resource specific properties</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsProperties Property { get; set; }
        /// <summary>Status of the diagnostics response.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.App.Models.IDiagnosticsStatus Status { get; set; }
        /// <summary>Status</summary>
        int? StatusId { get; set; }
        /// <summary>Diagnostic message</summary>
        string StatusMessage { get; set; }

    }
}