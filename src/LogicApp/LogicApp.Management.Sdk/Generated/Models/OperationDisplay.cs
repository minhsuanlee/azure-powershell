// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Logic.Models
{
    using System.Linq;

    /// <summary>
    /// The object that represents the operation.
    /// </summary>
    public partial class OperationDisplay
    {
        /// <summary>
        /// Initializes a new instance of the OperationDisplay class.
        /// </summary>
        public OperationDisplay()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the OperationDisplay class.
        /// </summary>

        /// <param name="provider">Service provider: Microsoft.Logic
        /// </param>

        /// <param name="resource">Resource on which the operation is performed: Profile, endpoint, etc.
        /// </param>

        /// <param name="operation">Operation type: Read, write, delete, etc.
        /// </param>
        public OperationDisplay(string provider = default(string), string resource = default(string), string operation = default(string))

        {
            this.Provider = provider;
            this.Resource = resource;
            this.Operation = operation;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets or sets service provider: Microsoft.Logic
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "provider")]
        public string Provider {get; set; }

        /// <summary>
        /// Gets or sets resource on which the operation is performed: Profile,
        /// endpoint, etc.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "resource")]
        public string Resource {get; set; }

        /// <summary>
        /// Gets or sets operation type: Read, write, delete, etc.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "operation")]
        public string Operation {get; set; }
    }
}