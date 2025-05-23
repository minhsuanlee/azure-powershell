// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Runtime.Extensions;

    /// <summary>
    /// The list of key value pairs that describe the resource. These tags can be used in viewing and grouping this resource (across
    /// resource groups).
    /// </summary>
    public partial class AddressUpdateParameterTags :
        Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Models.IAddressUpdateParameterTags,
        Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Models.IAddressUpdateParameterTagsInternal
    {

        /// <summary>Creates an new <see cref="AddressUpdateParameterTags" /> instance.</summary>
        public AddressUpdateParameterTags()
        {

        }
    }
    /// The list of key value pairs that describe the resource. These tags can be used in viewing and grouping this resource (across
    /// resource groups).
    public partial interface IAddressUpdateParameterTags :
        Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.EdgeOrder.Runtime.IAssociativeArray<string>
    {

    }
    /// The list of key value pairs that describe the resource. These tags can be used in viewing and grouping this resource (across
    /// resource groups).
    internal partial interface IAddressUpdateParameterTagsInternal

    {

    }
}