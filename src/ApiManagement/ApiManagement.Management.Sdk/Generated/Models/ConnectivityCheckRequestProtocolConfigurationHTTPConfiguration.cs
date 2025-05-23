// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.ApiManagement.Models
{
    using System.Linq;

    /// <summary>
    /// Configuration for HTTP or HTTPS requests.
    /// </summary>
    public partial class ConnectivityCheckRequestProtocolConfigurationHttpConfiguration
    {
        /// <summary>
        /// Initializes a new instance of the ConnectivityCheckRequestProtocolConfigurationHttpConfiguration class.
        /// </summary>
        public ConnectivityCheckRequestProtocolConfigurationHttpConfiguration()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the ConnectivityCheckRequestProtocolConfigurationHttpConfiguration class.
        /// </summary>

        /// <param name="method">The HTTP method to be used.
        /// Possible values include: &#39;GET&#39;, &#39;POST&#39;</param>

        /// <param name="validStatusCodes">List of HTTP status codes considered valid for the request response.
        /// </param>

        /// <param name="headers">List of headers to be included in the request.
        /// </param>
        public ConnectivityCheckRequestProtocolConfigurationHttpConfiguration(string method = default(string), System.Collections.Generic.IList<long?> validStatusCodes = default(System.Collections.Generic.IList<long?>), System.Collections.Generic.IList<HttpHeader> headers = default(System.Collections.Generic.IList<HttpHeader>))

        {
            this.Method = method;
            this.ValidStatusCodes = validStatusCodes;
            this.Headers = headers;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets or sets the HTTP method to be used. Possible values include: &#39;GET&#39;, &#39;POST&#39;
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "method")]
        public string Method {get; set; }

        /// <summary>
        /// Gets or sets list of HTTP status codes considered valid for the request
        /// response.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "validStatusCodes")]
        public System.Collections.Generic.IList<long?> ValidStatusCodes {get; set; }

        /// <summary>
        /// Gets or sets list of headers to be included in the request.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "headers")]
        public System.Collections.Generic.IList<HttpHeader> Headers {get; set; }
    }
}