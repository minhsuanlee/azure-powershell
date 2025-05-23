// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Models
{
    using static Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Extensions;

    /// <summary>The status of the archive</summary>
    public partial class AmlFilesystemArchiveStatus
    {

        /// <summary>
        /// <c>AfterFromJson</c> will be called after the json deserialization has finished, allowing customization of the object
        /// before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="json">The JsonNode that should be deserialized into this object.</param>

        partial void AfterFromJson(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject json);

        /// <summary>
        /// <c>AfterToJson</c> will be called after the json serialization has finished, allowing customization of the <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject"
        /// /> before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="container">The JSON container that the serialization result will be placed in.</param>

        partial void AfterToJson(ref Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject container);

        /// <summary>
        /// <c>BeforeFromJson</c> will be called before the json deserialization has commenced, allowing complete customization of
        /// the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <paramref name= "returnNow" />
        /// output parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="json">The JsonNode that should be deserialized into this object.</param>
        /// <param name="returnNow">Determines if the rest of the deserialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeFromJson(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject json, ref bool returnNow);

        /// <summary>
        /// <c>BeforeToJson</c> will be called before the json serialization has commenced, allowing complete customization of the
        /// object before it is serialized.
        /// If you wish to disable the default serialization entirely, return <c>true</c> in the <paramref name="returnNow" /> output
        /// parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="container">The JSON container that the serialization result will be placed in.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeToJson(ref Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject container, ref bool returnNow);

        /// <summary>
        /// Deserializes a Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject into a new instance of <see cref="AmlFilesystemArchiveStatus" />.
        /// </summary>
        /// <param name="json">A Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject instance to deserialize from.</param>
        internal AmlFilesystemArchiveStatus(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject json)
        {
            bool returnNow = false;
            BeforeFromJson(json, ref returnNow);
            if (returnNow)
            {
                return;
            }
            {_state = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString>("state"), out var __jsonState) ? (string)__jsonState : (string)_state;}
            {_lastCompletionTime = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString>("lastCompletionTime"), out var __jsonLastCompletionTime) ? global::System.DateTime.TryParse((string)__jsonLastCompletionTime, global::System.Globalization.CultureInfo.InvariantCulture, global::System.Globalization.DateTimeStyles.AdjustToUniversal, out var __jsonLastCompletionTimeValue) ? __jsonLastCompletionTimeValue : _lastCompletionTime : _lastCompletionTime;}
            {_lastStartedTime = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString>("lastStartedTime"), out var __jsonLastStartedTime) ? global::System.DateTime.TryParse((string)__jsonLastStartedTime, global::System.Globalization.CultureInfo.InvariantCulture, global::System.Globalization.DateTimeStyles.AdjustToUniversal, out var __jsonLastStartedTimeValue) ? __jsonLastStartedTimeValue : _lastStartedTime : _lastStartedTime;}
            {_percentComplete = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNumber>("percentComplete"), out var __jsonPercentComplete) ? (int?)__jsonPercentComplete : _percentComplete;}
            {_errorCode = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString>("errorCode"), out var __jsonErrorCode) ? (string)__jsonErrorCode : (string)_errorCode;}
            {_errorMessage = If( json?.PropertyT<Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString>("errorMessage"), out var __jsonErrorMessage) ? (string)__jsonErrorMessage : (string)_errorMessage;}
            AfterFromJson(json);
        }

        /// <summary>
        /// Deserializes a <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode"/> into an instance of Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Models.IAmlFilesystemArchiveStatus.
        /// </summary>
        /// <param name="node">a <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode" /> to deserialize from.</param>
        /// <returns>
        /// an instance of Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Models.IAmlFilesystemArchiveStatus.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Models.IAmlFilesystemArchiveStatus FromJson(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode node)
        {
            return node is Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject json ? new AmlFilesystemArchiveStatus(json) : null;
        }

        /// <summary>
        /// Serializes this instance of <see cref="AmlFilesystemArchiveStatus" /> into a <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode" />.
        /// </summary>
        /// <param name="container">The <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject"/> container to serialize this object into. If the caller
        /// passes in <c>null</c>, a new instance will be created and returned to the caller.</param>
        /// <param name="serializationMode">Allows the caller to choose the depth of the serialization. See <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode"/>.</param>
        /// <returns>
        /// a serialized instance of <see cref="AmlFilesystemArchiveStatus" /> as a <see cref="Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode" />.
        /// </returns>
        public Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode ToJson(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject container, Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode serializationMode)
        {
            container = container ?? new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonObject();

            bool returnNow = false;
            BeforeToJson(ref container, ref returnNow);
            if (returnNow)
            {
                return container;
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != (((object)this._state)?.ToString()) ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode) new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString(this._state.ToString()) : null, "state" ,container.Add );
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != this._lastCompletionTime ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode) new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString(this._lastCompletionTime?.ToString(@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.fffffffK",global::System.Globalization.CultureInfo.InvariantCulture)) : null, "lastCompletionTime" ,container.Add );
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != this._lastStartedTime ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode) new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString(this._lastStartedTime?.ToString(@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.fffffffK",global::System.Globalization.CultureInfo.InvariantCulture)) : null, "lastStartedTime" ,container.Add );
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != this._percentComplete ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode)new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNumber((int)this._percentComplete) : null, "percentComplete" ,container.Add );
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != (((object)this._errorCode)?.ToString()) ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode) new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString(this._errorCode.ToString()) : null, "errorCode" ,container.Add );
            }
            if (serializationMode.HasFlag(Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.SerializationMode.IncludeRead))
            {
                AddIf( null != (((object)this._errorMessage)?.ToString()) ? (Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonNode) new Microsoft.Azure.PowerShell.Cmdlets.StorageCache.Runtime.Json.JsonString(this._errorMessage.ToString()) : null, "errorMessage" ,container.Add );
            }
            AfterToJson(ref container);
            return container;
        }
    }
}