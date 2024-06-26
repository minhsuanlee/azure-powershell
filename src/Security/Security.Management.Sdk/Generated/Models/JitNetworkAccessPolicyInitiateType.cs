// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Security.Models
{

    /// <summary>
    /// Defines values for JitNetworkAccessPolicyInitiateType.
    /// </summary>


    [Newtonsoft.Json.JsonConverter(typeof(Newtonsoft.Json.Converters.StringEnumConverter))]
    public enum JitNetworkAccessPolicyInitiateType
    {
        [System.Runtime.Serialization.EnumMember(Value = "initiate")]
        Initiate
    }
    internal static class JitNetworkAccessPolicyInitiateTypeEnumExtension
    {
        internal static string ToSerializedValue(this JitNetworkAccessPolicyInitiateType? value)
        {
            return value == null ? null : ((JitNetworkAccessPolicyInitiateType)value).ToSerializedValue();
        }
        internal static string ToSerializedValue(this JitNetworkAccessPolicyInitiateType value)
        {
            switch( value )
            {
                case JitNetworkAccessPolicyInitiateType.Initiate:
                    return "initiate";
            }
            return null;
        }
        internal static JitNetworkAccessPolicyInitiateType? ParseJitNetworkAccessPolicyInitiateType(this string value)
        {
            switch( value )
            {
                case "initiate":
                    return JitNetworkAccessPolicyInitiateType.Initiate;
            }
            return null;
        }
    }
}