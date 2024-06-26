// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.TrafficManager.Models
{
    using System.Linq;

    /// <summary>
    /// Class representing a Traffic Manager HeatMap properties.
    /// </summary>
    public partial class HeatMapProperties
    {
        /// <summary>
        /// Initializes a new instance of the HeatMapProperties class.
        /// </summary>
        public HeatMapProperties()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the HeatMapProperties class.
        /// </summary>

        /// <param name="startTime">The beginning of the time window for this HeatMap, inclusive.
        /// </param>

        /// <param name="endTime">The ending of the time window for this HeatMap, exclusive.
        /// </param>

        /// <param name="endpoints">The endpoints used in this HeatMap calculation.
        /// </param>

        /// <param name="trafficFlows">The traffic flows produced in this HeatMap calculation.
        /// </param>
        public HeatMapProperties(System.DateTime? startTime = default(System.DateTime?), System.DateTime? endTime = default(System.DateTime?), System.Collections.Generic.IList<HeatMapEndpoint> endpoints = default(System.Collections.Generic.IList<HeatMapEndpoint>), System.Collections.Generic.IList<TrafficFlow> trafficFlows = default(System.Collections.Generic.IList<TrafficFlow>))

        {
            this.StartTime = startTime;
            this.EndTime = endTime;
            this.Endpoints = endpoints;
            this.TrafficFlows = trafficFlows;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets or sets the beginning of the time window for this HeatMap, inclusive.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "startTime")]
        public System.DateTime? StartTime {get; set; }

        /// <summary>
        /// Gets or sets the ending of the time window for this HeatMap, exclusive.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "endTime")]
        public System.DateTime? EndTime {get; set; }

        /// <summary>
        /// Gets or sets the endpoints used in this HeatMap calculation.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "endpoints")]
        public System.Collections.Generic.IList<HeatMapEndpoint> Endpoints {get; set; }

        /// <summary>
        /// Gets or sets the traffic flows produced in this HeatMap calculation.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "trafficFlows")]
        public System.Collections.Generic.IList<TrafficFlow> TrafficFlows {get; set; }
    }
}