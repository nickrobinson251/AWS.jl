# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: amp
using AWS.Compat
using AWS.UUIDs

"""
    create_workspace()
    create_workspace(params::Dict{String,<:Any})

Creates a new AMP workspace.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: An optional user-assigned alias for this workspace. This alias is for user
  reference and does not need to be unique.
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
- `"tags"`: Optional, user-provided tags for this workspace.
"""
function create_workspace(; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "POST",
        "/workspaces",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_workspace(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_workspace(workspace_id)
    delete_workspace(workspace_id, params::Dict{String,<:Any})

Deletes an AMP workspace.

# Arguments
- `workspace_id`: The ID of the workspace to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function delete_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "DELETE",
        "/workspaces/$(workspaceId)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_workspace(workspace_id)
    describe_workspace(workspace_id, params::Dict{String,<:Any})

Describes an existing AMP workspace.

# Arguments
- `workspace_id`: The ID of the workspace to describe.

"""
function describe_workspace(workspaceId; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "GET",
        "/workspaces/$(workspaceId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_workspace(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "GET",
        "/workspaces/$(workspaceId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists the tags you have assigned to the resource.

# Arguments
- `resource_arn`: The ARN of the resource.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET",
        "/tags/$(resourceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_workspaces()
    list_workspaces(params::Dict{String,<:Any})

Lists all AMP workspaces, including workspaces being created or deleted.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: Optional filter for workspace alias. Only the workspaces with aliases that
  begin with this value will be returned.
- `"maxResults"`: Maximum results to return in response (default=100, maximum=1000).
- `"nextToken"`: Pagination token to request the next page in a paginated list. This token
  is obtained from the output of the previous ListWorkspaces request.
"""
function list_workspaces(; aws_config::AbstractAWSConfig=global_aws_config())
    return amp("GET", "/workspaces"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
function list_workspaces(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "GET", "/workspaces", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Creates tags for the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tags`:

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return amp(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Deletes tags from the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource.
- `tag_keys`: One or more tag keys

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_workspace_alias(workspace_id)
    update_workspace_alias(workspace_id, params::Dict{String,<:Any})

Updates an AMP workspace alias.

# Arguments
- `workspace_id`: The ID of the workspace being updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"alias"`: The new alias of the workspace.
- `"clientToken"`: Optional, unique, case-sensitive, user-provided identifier to ensure the
  idempotency of the request.
"""
function update_workspace_alias(
    workspaceId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alias",
        Dict{String,Any}("clientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_workspace_alias(
    workspaceId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return amp(
        "POST",
        "/workspaces/$(workspaceId)/alias",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("clientToken" => string(uuid4())), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
