# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: application_discovery_service
using AWS.Compat
using AWS.UUIDs

"""
    associate_configuration_items_to_application(application_configuration_id, configuration_ids)
    associate_configuration_items_to_application(application_configuration_id, configuration_ids, params::Dict{String,<:Any})

Associates one or more configuration items with an application.

# Arguments
- `application_configuration_id`: The configuration ID of an application with which items
  are to be associated.
- `configuration_ids`: The ID of each configuration item to be associated with an
  application.

"""
function associate_configuration_items_to_application(
    applicationConfigurationId,
    configurationIds;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "AssociateConfigurationItemsToApplication",
        Dict{String,Any}(
            "applicationConfigurationId" => applicationConfigurationId,
            "configurationIds" => configurationIds,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function associate_configuration_items_to_application(
    applicationConfigurationId,
    configurationIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "AssociateConfigurationItemsToApplication",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "applicationConfigurationId" => applicationConfigurationId,
                    "configurationIds" => configurationIds,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    batch_delete_import_data(import_task_ids)
    batch_delete_import_data(import_task_ids, params::Dict{String,<:Any})

Deletes one or more import tasks, each identified by their import ID. Each import task has
a number of records that can identify servers or applications.  AWS Application Discovery
Service has built-in matching logic that will identify when discovered servers match
existing entries that you've previously discovered, the information for the
already-existing discovered server is updated. When you delete an import task that contains
records that were used to match, the information in those matched records that comes from
the deleted records will also be deleted.

# Arguments
- `import_task_ids`: The IDs for the import tasks that you want to delete.

"""
function batch_delete_import_data(
    importTaskIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "BatchDeleteImportData",
        Dict{String,Any}("importTaskIds" => importTaskIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function batch_delete_import_data(
    importTaskIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "BatchDeleteImportData",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("importTaskIds" => importTaskIds), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    create_application(name)
    create_application(name, params::Dict{String,<:Any})

Creates an application with the given name and description.

# Arguments
- `name`: Name of the application to be created.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: Description of the application to be created.
"""
function create_application(name; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "CreateApplication",
        Dict{String,Any}("name" => name);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function create_application(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "CreateApplication",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("name" => name), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    create_tags(configuration_ids, tags)
    create_tags(configuration_ids, tags, params::Dict{String,<:Any})

Creates one or more tags for configuration items. Tags are metadata that help you
categorize IT assets. This API accepts a list of multiple configuration items.

# Arguments
- `configuration_ids`: A list of configuration items that you want to tag.
- `tags`: Tags that you want to associate with one or more configuration items. Specify the
  tags that you want to create in a key-value format. For example:  {\"key\": \"serverType\",
  \"value\": \"webServer\"}

"""
function create_tags(
    configurationIds, tags; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "CreateTags",
        Dict{String,Any}("configurationIds" => configurationIds, "tags" => tags);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function create_tags(
    configurationIds,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "CreateTags",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("configurationIds" => configurationIds, "tags" => tags),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_applications(configuration_ids)
    delete_applications(configuration_ids, params::Dict{String,<:Any})

Deletes a list of applications and their associations with configuration items.

# Arguments
- `configuration_ids`: Configuration ID of an application to be deleted.

"""
function delete_applications(
    configurationIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DeleteApplications",
        Dict{String,Any}("configurationIds" => configurationIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_applications(
    configurationIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "DeleteApplications",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_tags(configuration_ids)
    delete_tags(configuration_ids, params::Dict{String,<:Any})

Deletes the association between configuration items and one or more tags. This API accepts
a list of multiple configuration items.

# Arguments
- `configuration_ids`: A list of configuration items with tags that you want to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: Tags that you want to delete from one or more configuration items. Specify the
  tags that you want to delete in a key-value format. For example:  {\"key\": \"serverType\",
  \"value\": \"webServer\"}
"""
function delete_tags(configurationIds; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DeleteTags",
        Dict{String,Any}("configurationIds" => configurationIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_tags(
    configurationIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "DeleteTags",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    describe_agents()
    describe_agents(params::Dict{String,<:Any})

Lists agents or connectors as specified by ID or other filters. All agents/connectors
associated with your user account can be listed if you call DescribeAgents as is without
passing any parameters.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"agentIds"`: The agent or the Connector IDs for which you want information. If you
  specify no IDs, the system returns information about all agents/Connectors associated with
  your AWS user account.
- `"filters"`: You can filter the request using various logical operators and a key-value
  format. For example:   {\"key\": \"collectionStatus\", \"value\": \"STARTED\"}
- `"maxResults"`: The total number of agents/Connectors to return in a single page of
  output. The maximum value is 100.
- `"nextToken"`: Token to retrieve the next set of results. For example, if you previously
  specified 100 IDs for DescribeAgentsRequestagentIds but set DescribeAgentsRequestmaxResults
  to 10, you received a set of 10 results along with a token. Use that token in this query to
  get the next set of 10.
"""
function describe_agents(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeAgents"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_agents(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeAgents", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    describe_configurations(configuration_ids)
    describe_configurations(configuration_ids, params::Dict{String,<:Any})

Retrieves attributes for a list of configuration item IDs.  All of the supplied IDs must be
for the same asset type from one of the following:   server   application   process
connection   Output fields are specific to the asset type specified. For example, the
output for a server configuration item includes a list of attributes about the server, such
as host name, operating system, number of network cards, etc. For a complete list of
outputs for each asset type, see Using the DescribeConfigurations Action in the AWS
Application Discovery Service User Guide.

# Arguments
- `configuration_ids`: One or more configuration IDs.

"""
function describe_configurations(
    configurationIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeConfigurations",
        Dict{String,Any}("configurationIds" => configurationIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function describe_configurations(
    configurationIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "DescribeConfigurations",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationIds" => configurationIds), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    describe_continuous_exports()
    describe_continuous_exports(params::Dict{String,<:Any})

Lists exports as specified by ID. All continuous exports associated with your user account
can be listed if you call DescribeContinuousExports as is without passing any parameters.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"exportIds"`: The unique IDs assigned to the exports.
- `"maxResults"`: A number between 1 and 100 specifying the maximum number of continuous
  export descriptions returned.
- `"nextToken"`: The token from the previous call to DescribeExportTasks.
"""
function describe_continuous_exports(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeContinuousExports"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_continuous_exports(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeContinuousExports",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    describe_export_configurations()
    describe_export_configurations(params::Dict{String,<:Any})

 DescribeExportConfigurations is deprecated. Use DescribeImportTasks, instead.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"exportIds"`: A list of continuous export IDs to search for.
- `"maxResults"`: A number between 1 and 100 specifying the maximum number of continuous
  export descriptions returned.
- `"nextToken"`: The token from the previous call to describe-export-tasks.
"""
function describe_export_configurations(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeExportConfigurations"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_export_configurations(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeExportConfigurations",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    describe_export_tasks()
    describe_export_tasks(params::Dict{String,<:Any})

Retrieve status of one or more export tasks. You can retrieve the status of up to 100
export tasks.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"exportIds"`: One or more unique identifiers used to query the status of an export
  request.
- `"filters"`: One or more filters.    AgentId - ID of the agent whose collected data will
  be exported
- `"maxResults"`: The maximum number of volume results returned by DescribeExportTasks in
  paginated output. When this parameter is used, DescribeExportTasks only returns maxResults
  results in a single page along with a nextToken response element.
- `"nextToken"`: The nextToken value returned from a previous paginated DescribeExportTasks
  request where maxResults was used and the results exceeded the value of that parameter.
  Pagination continues from the end of the previous results that returned the nextToken
  value. This value is null when there are no more results to return.
"""
function describe_export_tasks(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeExportTasks"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_export_tasks(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeExportTasks", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    describe_import_tasks()
    describe_import_tasks(params::Dict{String,<:Any})

Returns an array of import tasks for your account, including status information, times,
IDs, the Amazon S3 Object URL for the import file, and more.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filters"`: An array of name-value pairs that you provide to filter the results for the
  DescribeImportTask request to a specific subset of results. Currently, wildcard values
  aren't supported for filters.
- `"maxResults"`: The maximum number of results that you want this request to return, up to
  100.
- `"nextToken"`: The token to request a specific page of results.
"""
function describe_import_tasks(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeImportTasks"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_import_tasks(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeImportTasks", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    describe_tags()
    describe_tags(params::Dict{String,<:Any})

Retrieves a list of configuration items that have tags as specified by the key-value pairs,
name and value, passed to the optional parameter filters. There are three valid tag filter
names:   tagKey   tagValue   configurationId   Also, all configuration items associated
with your user account that have tags can be listed if you call DescribeTags as is without
passing any parameters.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filters"`: You can filter the list using a key-value format. You can separate these
  items by using logical operators. Allowed filters include tagKey, tagValue, and
  configurationId.
- `"maxResults"`: The total number of items to return in a single page of output. The
  maximum value is 100.
- `"nextToken"`: A token to start the list. Use this token to get the next set of results.
"""
function describe_tags(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "DescribeTags"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_tags(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "DescribeTags", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    disassociate_configuration_items_from_application(application_configuration_id, configuration_ids)
    disassociate_configuration_items_from_application(application_configuration_id, configuration_ids, params::Dict{String,<:Any})

Disassociates one or more configuration items from an application.

# Arguments
- `application_configuration_id`: Configuration ID of an application from which each item
  is disassociated.
- `configuration_ids`: Configuration ID of each item to be disassociated from an
  application.

"""
function disassociate_configuration_items_from_application(
    applicationConfigurationId,
    configurationIds;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "DisassociateConfigurationItemsFromApplication",
        Dict{String,Any}(
            "applicationConfigurationId" => applicationConfigurationId,
            "configurationIds" => configurationIds,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function disassociate_configuration_items_from_application(
    applicationConfigurationId,
    configurationIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "DisassociateConfigurationItemsFromApplication",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "applicationConfigurationId" => applicationConfigurationId,
                    "configurationIds" => configurationIds,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    export_configurations()
    export_configurations(params::Dict{String,<:Any})

Deprecated. Use StartExportTask instead. Exports all discovered configuration data to an
Amazon S3 bucket or an application that enables you to view and evaluate the data. Data
includes tags and tag associations, processes, connections, servers, and system
performance. This API returns an export ID that you can query using the
DescribeExportConfigurations API. The system imposes a limit of two configuration exports
in six hours.

"""
function export_configurations(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "ExportConfigurations"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function export_configurations(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "ExportConfigurations", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    get_discovery_summary()
    get_discovery_summary(params::Dict{String,<:Any})

Retrieves a short summary of discovered assets. This API operation takes no request
parameters and is called as is at the command prompt as shown in the example.

"""
function get_discovery_summary(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "GetDiscoverySummary"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function get_discovery_summary(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "GetDiscoverySummary", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    list_configurations(configuration_type)
    list_configurations(configuration_type, params::Dict{String,<:Any})

Retrieves a list of configuration items as specified by the value passed to the required
parameter configurationType. Optional filtering may be applied to refine search results.

# Arguments
- `configuration_type`: A valid configuration identified by Application Discovery Service.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filters"`: You can filter the request using various logical operators and a key-value
  format. For example:   {\"key\": \"serverType\", \"value\": \"webServer\"}  For a complete
  list of filter options and guidance about using them with this action, see Using the
  ListConfigurations Action in the AWS Application Discovery Service User Guide.
- `"maxResults"`: The total number of items to return. The maximum value is 100.
- `"nextToken"`: Token to retrieve the next set of results. For example, if a previous call
  to ListConfigurations returned 100 items, but you set ListConfigurationsRequestmaxResults
  to 10, you received a set of 10 results along with a token. Use that token in this query to
  get the next set of 10.
- `"orderBy"`: Certain filter criteria return output that can be sorted in ascending or
  descending order. For a list of output characteristics for each filter, see Using the
  ListConfigurations Action in the AWS Application Discovery Service User Guide.
"""
function list_configurations(
    configurationType; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "ListConfigurations",
        Dict{String,Any}("configurationType" => configurationType);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function list_configurations(
    configurationType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "ListConfigurations",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationType" => configurationType), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_server_neighbors(configuration_id)
    list_server_neighbors(configuration_id, params::Dict{String,<:Any})

Retrieves a list of servers that are one network hop away from a specified server.

# Arguments
- `configuration_id`: Configuration ID of the server for which neighbors are being listed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of results to return in a single page of output.
- `"neighborConfigurationIds"`: List of configuration IDs to test for one-hop-away.
- `"nextToken"`: Token to retrieve the next set of results. For example, if you previously
  specified 100 IDs for ListServerNeighborsRequestneighborConfigurationIds but set
  ListServerNeighborsRequestmaxResults to 10, you received a set of 10 results along with a
  token. Use that token in this query to get the next set of 10.
- `"portInformationNeeded"`: Flag to indicate if port and protocol information is needed as
  part of the response.
"""
function list_server_neighbors(
    configurationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "ListServerNeighbors",
        Dict{String,Any}("configurationId" => configurationId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function list_server_neighbors(
    configurationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "ListServerNeighbors",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationId" => configurationId), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    start_continuous_export()
    start_continuous_export(params::Dict{String,<:Any})

Start the continuous flow of agent's discovered data into Amazon Athena.

"""
function start_continuous_export(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "StartContinuousExport"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function start_continuous_export(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "StartContinuousExport", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    start_data_collection_by_agent_ids(agent_ids)
    start_data_collection_by_agent_ids(agent_ids, params::Dict{String,<:Any})

Instructs the specified agents or connectors to start collecting data.

# Arguments
- `agent_ids`: The IDs of the agents or connectors from which to start collecting data. If
  you send a request to an agent/connector ID that you do not have permission to contact,
  according to your AWS account, the service does not throw an exception. Instead, it returns
  the error in the Description field. If you send a request to multiple agents/connectors and
  you do not have permission to contact some of those agents/connectors, the system does not
  throw an exception. Instead, the system shows Failed in the Description field.

"""
function start_data_collection_by_agent_ids(
    agentIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "StartDataCollectionByAgentIds",
        Dict{String,Any}("agentIds" => agentIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function start_data_collection_by_agent_ids(
    agentIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "StartDataCollectionByAgentIds",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("agentIds" => agentIds), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    start_export_task()
    start_export_task(params::Dict{String,<:Any})

 Begins the export of discovered data to an S3 bucket.  If you specify agentIds in a
filter, the task exports up to 72 hours of detailed data collected by the identified
Application Discovery Agent, including network, process, and performance details. A time
range for exported agent data may be set by using startTime and endTime. Export of detailed
agent data is limited to five concurrently running exports.   If you do not include an
agentIds filter, summary data is exported that includes both AWS Agentless Discovery
Connector data and summary data from AWS Discovery Agents. Export of summary data is
limited to two exports per day.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"endTime"`: The end timestamp for exported data from the single Application Discovery
  Agent selected in the filters. If no value is specified, exported data includes the most
  recent data collected by the agent.
- `"exportDataFormat"`: The file format for the returned export data. Default value is CSV.
  Note: The GRAPHML option has been deprecated.
- `"filters"`: If a filter is present, it selects the single agentId of the Application
  Discovery Agent for which data is exported. The agentId can be found in the results of the
  DescribeAgents API or CLI. If no filter is present, startTime and endTime are ignored and
  exported data includes both Agentless Discovery Connector data and summary data from
  Application Discovery agents.
- `"startTime"`: The start timestamp for exported data from the single Application
  Discovery Agent selected in the filters. If no value is specified, data is exported
  starting from the first data collected by the agent.
"""
function start_export_task(; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "StartExportTask"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function start_export_task(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "StartExportTask", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    start_import_task(import_url, name)
    start_import_task(import_url, name, params::Dict{String,<:Any})

Starts an import task, which allows you to import details of your on-premises environment
directly into AWS Migration Hub without having to use the Application Discovery Service
(ADS) tools such as the Discovery Connector or Discovery Agent. This gives you the option
to perform migration assessment and planning directly from your imported data, including
the ability to group your devices as applications and track their migration status. To
start an import request, do this:   Download the specially formatted comma separated value
(CSV) import template, which you can find here:
https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_tem
plate.csv.   Fill out the template with your server and application data.   Upload your
import file to an Amazon S3 bucket, and make a note of it's Object URL. Your import file
must be in the CSV format.   Use the console or the StartImportTask command with the AWS
CLI or one of the AWS SDKs to import the records from your file.   For more information,
including step-by-step procedures, see Migration Hub Import in the AWS Application
Discovery Service User Guide.  There are limits to the number of import tasks you can
create (and delete) in an AWS account. For more information, see AWS Application Discovery
Service Limits in the AWS Application Discovery Service User Guide.

# Arguments
- `import_url`: The URL for your import file that you've uploaded to Amazon S3.  If you're
  using the AWS CLI, this URL is structured as follows: s3://BucketName/ImportFileName.CSV
- `name`: A descriptive name for this request. You can use this name to filter future
  requests related to this import task, such as identifying applications and servers that
  were included in this import task. We recommend that you use a meaningful name for each
  import task.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientRequestToken"`: Optional. A unique token that you can provide to prevent the same
  import request from occurring more than once. If you don't provide a token, a token is
  automatically generated. Sending more than one StartImportTask request with the same client
  request token will return information about the original import task with that client
  request token.
"""
function start_import_task(
    importUrl, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "StartImportTask",
        Dict{String,Any}(
            "importUrl" => importUrl,
            "name" => name,
            "clientRequestToken" => string(uuid4()),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function start_import_task(
    importUrl,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "StartImportTask",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "importUrl" => importUrl,
                    "name" => name,
                    "clientRequestToken" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    stop_continuous_export(export_id)
    stop_continuous_export(export_id, params::Dict{String,<:Any})

Stop the continuous flow of agent's discovered data into Amazon Athena.

# Arguments
- `export_id`: The unique ID assigned to this export.

"""
function stop_continuous_export(exportId; aws_config::AbstractAWSConfig=global_aws_config())
    return application_discovery_service(
        "StopContinuousExport",
        Dict{String,Any}("exportId" => exportId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function stop_continuous_export(
    exportId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "StopContinuousExport",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("exportId" => exportId), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    stop_data_collection_by_agent_ids(agent_ids)
    stop_data_collection_by_agent_ids(agent_ids, params::Dict{String,<:Any})

Instructs the specified agents or connectors to stop collecting data.

# Arguments
- `agent_ids`: The IDs of the agents or connectors from which to stop collecting data.

"""
function stop_data_collection_by_agent_ids(
    agentIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "StopDataCollectionByAgentIds",
        Dict{String,Any}("agentIds" => agentIds);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function stop_data_collection_by_agent_ids(
    agentIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "StopDataCollectionByAgentIds",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("agentIds" => agentIds), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    update_application(configuration_id)
    update_application(configuration_id, params::Dict{String,<:Any})

Updates metadata about an application.

# Arguments
- `configuration_id`: Configuration ID of the application to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: New description of the application to be updated.
- `"name"`: New name of the application to be updated.
"""
function update_application(
    configurationId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return application_discovery_service(
        "UpdateApplication",
        Dict{String,Any}("configurationId" => configurationId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function update_application(
    configurationId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return application_discovery_service(
        "UpdateApplication",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("configurationId" => configurationId), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
