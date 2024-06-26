// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Security.Models
{
    using System.Linq;

    /// <summary>
    /// A set of properties that defines the behavior of the automation
    /// configuration. To learn more about the supported security events data
    /// models schemas - please visit https://aka.ms/ASCAutomationSchemas.
    /// </summary>
    public partial class AutomationProperties
    {
        /// <summary>
        /// Initializes a new instance of the AutomationProperties class.
        /// </summary>
        public AutomationProperties()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the AutomationProperties class.
        /// </summary>

        /// <param name="description">The security automation description.
        /// </param>

        /// <param name="isEnabled">Indicates whether the security automation is enabled.
        /// </param>

        /// <param name="scopes">A collection of scopes on which the security automations logic is applied.
        /// Supported scopes are the subscription itself or a resource group under that
        /// subscription. The automation will only apply on defined scopes.
        /// </param>

        /// <param name="sources">A collection of the source event types which evaluate the security
        /// automation set of rules.
        /// </param>

        /// <param name="actions">A collection of the actions which are triggered if all the configured rules
        /// evaluations, within at least one rule set, are true.
        /// </param>
        public AutomationProperties(string description = default(string), bool? isEnabled = default(bool?), System.Collections.Generic.IList<AutomationScope> scopes = default(System.Collections.Generic.IList<AutomationScope>), System.Collections.Generic.IList<AutomationSource> sources = default(System.Collections.Generic.IList<AutomationSource>), System.Collections.Generic.IList<AutomationAction> actions = default(System.Collections.Generic.IList<AutomationAction>))

        {
            this.Description = description;
            this.IsEnabled = isEnabled;
            this.Scopes = scopes;
            this.Sources = sources;
            this.Actions = actions;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets or sets the security automation description.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "description")]
        public string Description {get; set; }

        /// <summary>
        /// Gets or sets indicates whether the security automation is enabled.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "isEnabled")]
        public bool? IsEnabled {get; set; }

        /// <summary>
        /// Gets or sets a collection of scopes on which the security automations logic
        /// is applied. Supported scopes are the subscription itself or a resource
        /// group under that subscription. The automation will only apply on defined
        /// scopes.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "scopes")]
        public System.Collections.Generic.IList<AutomationScope> Scopes {get; set; }

        /// <summary>
        /// Gets or sets a collection of the source event types which evaluate the
        /// security automation set of rules.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "sources")]
        public System.Collections.Generic.IList<AutomationSource> Sources {get; set; }

        /// <summary>
        /// Gets or sets a collection of the actions which are triggered if all the
        /// configured rules evaluations, within at least one rule set, are true.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "actions")]
        public System.Collections.Generic.IList<AutomationAction> Actions {get; set; }
    }
}