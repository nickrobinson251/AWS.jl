# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: lakeformation
using AWS.Compat
using AWS.UUIDs

"""
    add_lftags_to_resource(lftags, resource)
    add_lftags_to_resource(lftags, resource, params::Dict{String,<:Any})

Attaches one or more tags to an existing resource.

# Arguments
- `lftags`: The tags to attach to the resource.
- `resource`: The resource to which to attach a tag.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function add_lftags_to_resource(
    LFTags, Resource; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "AddLFTagsToResource",
        Dict{String,Any}("LFTags" => LFTags, "Resource" => Resource);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function add_lftags_to_resource(
    LFTags,
    Resource,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "AddLFTagsToResource",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("LFTags" => LFTags, "Resource" => Resource), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    batch_grant_permissions(entries)
    batch_grant_permissions(entries, params::Dict{String,<:Any})

Batch operation to grant permissions to the principal.

# Arguments
- `entries`: A list of up to 20 entries for resource permissions to be granted by batch
  operation to the principal.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function batch_grant_permissions(Entries; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "BatchGrantPermissions",
        Dict{String,Any}("Entries" => Entries);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function batch_grant_permissions(
    Entries, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "BatchGrantPermissions",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Entries" => Entries), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    batch_revoke_permissions(entries)
    batch_revoke_permissions(entries, params::Dict{String,<:Any})

Batch operation to revoke permissions from the principal.

# Arguments
- `entries`: A list of up to 20 entries for resource permissions to be revoked by batch
  operation to the principal.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function batch_revoke_permissions(
    Entries; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "BatchRevokePermissions",
        Dict{String,Any}("Entries" => Entries);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function batch_revoke_permissions(
    Entries, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "BatchRevokePermissions",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Entries" => Entries), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_lftag(tag_key, tag_values)
    create_lftag(tag_key, tag_values, params::Dict{String,<:Any})

Creates a tag with the specified name and values.

# Arguments
- `tag_key`: The key-name for the tag.
- `tag_values`: A list of possible values an attribute can take.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function create_lftag(TagKey, TagValues; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "CreateLFTag",
        Dict{String,Any}("TagKey" => TagKey, "TagValues" => TagValues);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_lftag(
    TagKey,
    TagValues,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "CreateLFTag",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("TagKey" => TagKey, "TagValues" => TagValues),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_lftag(tag_key)
    delete_lftag(tag_key, params::Dict{String,<:Any})

Deletes the specified tag key name. If the attribute key does not exist or the tag does not
exist, then the operation will not do anything. If the attribute key exists, then the
operation checks if any resources are tagged with this attribute key, if yes, the API
throws a 400 Exception with the message \"Delete not allowed\" as the tag key is still
attached with resources. You can consider untagging resources with this tag key.

# Arguments
- `tag_key`: The key-name for the tag to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function delete_lftag(TagKey; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "DeleteLFTag",
        Dict{String,Any}("TagKey" => TagKey);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_lftag(
    TagKey, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "DeleteLFTag",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("TagKey" => TagKey), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    deregister_resource(resource_arn)
    deregister_resource(resource_arn, params::Dict{String,<:Any})

Deregisters the resource as managed by the Data Catalog. When you deregister a path, Lake
Formation removes the path from the inline policy attached to your service-linked role.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource that you want to
  deregister.

"""
function deregister_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "DeregisterResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function deregister_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "DeregisterResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_resource(resource_arn)
    describe_resource(resource_arn, params::Dict{String,<:Any})

Retrieves the current data access role for the given resource registered in AWS Lake
Formation.

# Arguments
- `resource_arn`: The resource ARN.

"""
function describe_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "DescribeResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "DescribeResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_data_lake_settings()
    get_data_lake_settings(params::Dict{String,<:Any})

Retrieves the list of the data lake administrators of a Lake Formation-managed data lake.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function get_data_lake_settings(; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "GetDataLakeSettings"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function get_data_lake_settings(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "GetDataLakeSettings",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_effective_permissions_for_path(resource_arn)
    get_effective_permissions_for_path(resource_arn, params::Dict{String,<:Any})

Returns the Lake Formation permissions for a specified table or database resource located
at a path in Amazon S3. GetEffectivePermissionsForPath will not return databases and tables
if the catalog is encrypted.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource for which you want to get
  permissions.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"MaxResults"`: The maximum number of results to return.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve this list.
"""
function get_effective_permissions_for_path(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "GetEffectivePermissionsForPath",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_effective_permissions_for_path(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "GetEffectivePermissionsForPath",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_lftag(tag_key)
    get_lftag(tag_key, params::Dict{String,<:Any})

Returns a tag definition.

# Arguments
- `tag_key`: The key-name for the tag.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function get_lftag(TagKey; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "GetLFTag",
        Dict{String,Any}("TagKey" => TagKey);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_lftag(
    TagKey, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "GetLFTag",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("TagKey" => TagKey), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_resource_lftags(resource)
    get_resource_lftags(resource, params::Dict{String,<:Any})

Returns the tags applied to a resource.

# Arguments
- `resource`: The resource for which you want to return tags.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"ShowAssignedLFTags"`: Indicates whether to show the assigned tags.
"""
function get_resource_lftags(Resource; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "GetResourceLFTags",
        Dict{String,Any}("Resource" => Resource);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_resource_lftags(
    Resource,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "GetResourceLFTags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Resource" => Resource), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    grant_permissions(permissions, principal, resource)
    grant_permissions(permissions, principal, resource, params::Dict{String,<:Any})

Grants permissions to the principal to access metadata in the Data Catalog and data
organized in underlying data storage such as Amazon S3. For information about permissions,
see Security and Access Control to Metadata and Data.

# Arguments
- `permissions`: The permissions granted to the principal on the resource. AWS Lake
  Formation defines privileges to grant and revoke access to metadata in the Data Catalog and
  data organized in underlying data storage such as Amazon S3. AWS Lake Formation requires
  that each principal be authorized to perform a specific task on AWS Lake Formation
  resources.
- `principal`: The principal to be granted the permissions on the resource. Supported
  principals are IAM users or IAM roles, and they are defined by their principal type and
  their ARN. Note that if you define a resource with a particular ARN, then later delete, and
  recreate a resource with that same ARN, the resource maintains the permissions already
  granted.
- `resource`: The resource to which permissions are to be granted. Resources in AWS Lake
  Formation are the Data Catalog, databases, and tables.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"PermissionsWithGrantOption"`: Indicates a list of the granted permissions that the
  principal may pass to other users. These permissions may only be a subset of the
  permissions granted in the Privileges.
"""
function grant_permissions(
    Permissions, Principal, Resource; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "GrantPermissions",
        Dict{String,Any}(
            "Permissions" => Permissions, "Principal" => Principal, "Resource" => Resource
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function grant_permissions(
    Permissions,
    Principal,
    Resource,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "GrantPermissions",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Permissions" => Permissions,
                    "Principal" => Principal,
                    "Resource" => Resource,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_lftags()
    list_lftags(params::Dict{String,<:Any})

Lists tags that the requester has permission to view.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"MaxResults"`: The maximum number of results to return.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve this list.
- `"ResourceShareType"`: If resource share type is ALL, returns both in-account tags and
  shared tags that the requester has permission to view. If resource share type is FOREIGN,
  returns all share tags that the requester can view. If no resource share type is passed,
  lists tags in the given catalog ID that the requester has permission to view.
"""
function list_lftags(; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "ListLFTags"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_lftags(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "ListLFTags", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_permissions()
    list_permissions(params::Dict{String,<:Any})

Returns a list of the principal permissions on the resource, filtered by the permissions of
the caller. For example, if you are granted an ALTER permission, you are able to see only
the principal permissions for ALTER. This operation returns only those permissions that
have been explicitly granted. For information about permissions, see Security and Access
Control to Metadata and Data.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"MaxResults"`: The maximum number of results to return.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve this list.
- `"Principal"`: Specifies a principal to filter the permissions returned.
- `"Resource"`: A resource where you will get a list of the principal permissions. This
  operation does not support getting privileges on a table with columns. Instead, call this
  operation on the table, and the operation returns the table and the table w columns.
- `"ResourceType"`: Specifies a resource type to filter the permissions returned.
"""
function list_permissions(; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "ListPermissions"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_permissions(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "ListPermissions", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_resources()
    list_resources(params::Dict{String,<:Any})

Lists the resources registered to be managed by the Data Catalog.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FilterConditionList"`: Any applicable row-level and/or column-level filtering
  conditions for the resources.
- `"MaxResults"`: The maximum number of resource results.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve these
  resources.
"""
function list_resources(; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "ListResources"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_resources(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "ListResources", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    put_data_lake_settings(data_lake_settings)
    put_data_lake_settings(data_lake_settings, params::Dict{String,<:Any})

Sets the list of data lake administrators who have admin privileges on all resources
managed by Lake Formation. For more information on admin privileges, see Granting Lake
Formation Permissions. This API replaces the current list of data lake admins with the new
list being passed. To add an admin, fetch the current list and add the new admin to that
list and pass that list in this API.

# Arguments
- `data_lake_settings`: A structure representing a list of AWS Lake Formation principals
  designated as data lake administrators.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function put_data_lake_settings(
    DataLakeSettings; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "PutDataLakeSettings",
        Dict{String,Any}("DataLakeSettings" => DataLakeSettings);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_data_lake_settings(
    DataLakeSettings,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "PutDataLakeSettings",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("DataLakeSettings" => DataLakeSettings), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    register_resource(resource_arn)
    register_resource(resource_arn, params::Dict{String,<:Any})

Registers the resource as managed by the Data Catalog. To add or update data, Lake
Formation needs read/write access to the chosen Amazon S3 path. Choose a role that you know
has permission to do this, or choose the AWSServiceRoleForLakeFormationDataAccess
service-linked role. When you register the first Amazon S3 path, the service-linked role
and a new inline policy are created on your behalf. Lake Formation adds the first path to
the inline policy and attaches it to the service-linked role. When you register subsequent
paths, Lake Formation adds the path to the existing policy. The following request registers
a new location and gives AWS Lake Formation permission to use the service-linked role to
access that location.  ResourceArn = arn:aws:s3:::my-bucket UseServiceLinkedRole = true  If
UseServiceLinkedRole is not set to true, you must provide or set the RoleArn:
arn:aws:iam::12345:role/my-data-access-role

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource that you want to register.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"RoleArn"`: The identifier for the role that registers the resource.
- `"UseServiceLinkedRole"`: Designates an AWS Identity and Access Management (IAM)
  service-linked role by registering this role with the Data Catalog. A service-linked role
  is a unique type of IAM role that is linked directly to Lake Formation. For more
  information, see Using Service-Linked Roles for Lake Formation.
"""
function register_resource(ResourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "RegisterResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function register_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "RegisterResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    remove_lftags_from_resource(lftags, resource)
    remove_lftags_from_resource(lftags, resource, params::Dict{String,<:Any})

Removes a tag from the resource. Only database, table, or tableWithColumns resource are
allowed. To tag columns, use the column inclusion list in tableWithColumns to specify
column input.

# Arguments
- `lftags`: The tags to be removed from the resource.
- `resource`: The resource where you want to remove a tag.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
"""
function remove_lftags_from_resource(
    LFTags, Resource; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "RemoveLFTagsFromResource",
        Dict{String,Any}("LFTags" => LFTags, "Resource" => Resource);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function remove_lftags_from_resource(
    LFTags,
    Resource,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "RemoveLFTagsFromResource",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("LFTags" => LFTags, "Resource" => Resource), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    revoke_permissions(permissions, principal, resource)
    revoke_permissions(permissions, principal, resource, params::Dict{String,<:Any})

Revokes permissions to the principal to access metadata in the Data Catalog and data
organized in underlying data storage such as Amazon S3.

# Arguments
- `permissions`: The permissions revoked to the principal on the resource. For information
  about permissions, see Security and Access Control to Metadata and Data.
- `principal`: The principal to be revoked permissions on the resource.
- `resource`: The resource to which permissions are to be revoked.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"PermissionsWithGrantOption"`: Indicates a list of permissions for which to revoke the
  grant option allowing the principal to pass permissions to other principals.
"""
function revoke_permissions(
    Permissions, Principal, Resource; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "RevokePermissions",
        Dict{String,Any}(
            "Permissions" => Permissions, "Principal" => Principal, "Resource" => Resource
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function revoke_permissions(
    Permissions,
    Principal,
    Resource,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "RevokePermissions",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Permissions" => Permissions,
                    "Principal" => Principal,
                    "Resource" => Resource,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    search_databases_by_lftags(expression)
    search_databases_by_lftags(expression, params::Dict{String,<:Any})

This operation allows a search on DATABASE resources by TagCondition. This operation is
used by admins who want to grant user permissions on certain TagConditions. Before making a
grant, the admin can use SearchDatabasesByTags to find all resources where the given
TagConditions are valid to verify whether the returned resources can be shared.

# Arguments
- `expression`: A list of conditions (LFTag structures) to search for in database resources.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"MaxResults"`: The maximum number of results to return.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve this list.
"""
function search_databases_by_lftags(
    Expression; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "SearchDatabasesByLFTags",
        Dict{String,Any}("Expression" => Expression);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function search_databases_by_lftags(
    Expression,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "SearchDatabasesByLFTags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Expression" => Expression), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    search_tables_by_lftags(expression)
    search_tables_by_lftags(expression, params::Dict{String,<:Any})

This operation allows a search on TABLE resources by LFTags. This will be used by admins
who want to grant user permissions on certain LFTags. Before making a grant, the admin can
use SearchTablesByLFTags to find all resources where the given LFTags are valid to verify
whether the returned resources can be shared.

# Arguments
- `expression`: A list of conditions (LFTag structures) to search for in table resources.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"MaxResults"`: The maximum number of results to return.
- `"NextToken"`: A continuation token, if this is not the first call to retrieve this list.
"""
function search_tables_by_lftags(
    Expression; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "SearchTablesByLFTags",
        Dict{String,Any}("Expression" => Expression);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function search_tables_by_lftags(
    Expression,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "SearchTablesByLFTags",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Expression" => Expression), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_lftag(tag_key)
    update_lftag(tag_key, params::Dict{String,<:Any})

Updates the list of possible values for the specified tag key. If the tag does not exist,
the operation throws an EntityNotFoundException. The values in the delete key values will
be deleted from list of possible values. If any value in the delete key values is attached
to a resource, then API errors out with a 400 Exception - \"Update not allowed\". Untag the
attribute before deleting the tag key's value.

# Arguments
- `tag_key`: The key-name for the tag for which to add or delete values.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"CatalogId"`: The identifier for the Data Catalog. By default, the account ID. The Data
  Catalog is the persistent metadata store. It contains database definitions, table
  definitions, and other control information to manage your AWS Lake Formation environment.
- `"TagValuesToAdd"`: A list of tag values to add from the tag.
- `"TagValuesToDelete"`: A list of tag values to delete from the tag.
"""
function update_lftag(TagKey; aws_config::AbstractAWSConfig=global_aws_config())
    return lakeformation(
        "UpdateLFTag",
        Dict{String,Any}("TagKey" => TagKey);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_lftag(
    TagKey, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "UpdateLFTag",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("TagKey" => TagKey), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_resource(resource_arn, role_arn)
    update_resource(resource_arn, role_arn, params::Dict{String,<:Any})

Updates the data access role used for vending access to the given (registered) resource in
AWS Lake Formation.

# Arguments
- `resource_arn`: The resource ARN.
- `role_arn`: The new role to use for the given resource registered in AWS Lake Formation.

"""
function update_resource(
    ResourceArn, RoleArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return lakeformation(
        "UpdateResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "RoleArn" => RoleArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_resource(
    ResourceArn,
    RoleArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return lakeformation(
        "UpdateResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "RoleArn" => RoleArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
