# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: signer
using AWS.Compat
using AWS.UUIDs

"""
    add_profile_permission(action, principal, profile_name, statement_id)
    add_profile_permission(action, principal, profile_name, statement_id, params::Dict{String,<:Any})

Adds cross-account permissions to a signing profile.

# Arguments
- `action`: The AWS Signer action permitted as part of cross-account permissions.
- `principal`: The AWS principal receiving cross-account permissions. This may be an IAM
  role or another AWS account ID.
- `profile_name`: The human-readable name of the signing profile.
- `statement_id`: A unique identifier for the cross-account permission statement.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"profileVersion"`: The version of the signing profile.
- `"revisionId"`: A unique identifier for the current profile revision.
"""
function add_profile_permission(
    action,
    principal,
    profileName,
    statementId;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "POST",
        "/signing-profiles/$(profileName)/permissions",
        Dict{String,Any}(
            "action" => action, "principal" => principal, "statementId" => statementId
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function add_profile_permission(
    action,
    principal,
    profileName,
    statementId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "POST",
        "/signing-profiles/$(profileName)/permissions",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "action" => action,
                    "principal" => principal,
                    "statementId" => statementId,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    cancel_signing_profile(profile_name)
    cancel_signing_profile(profile_name, params::Dict{String,<:Any})

Changes the state of an ACTIVE signing profile to CANCELED. A canceled profile is still
viewable with the ListSigningProfiles operation, but it cannot perform new signing jobs,
and is deleted two years after cancelation.

# Arguments
- `profile_name`: The name of the signing profile to be canceled.

"""
function cancel_signing_profile(
    profileName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "DELETE",
        "/signing-profiles/$(profileName)";
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function cancel_signing_profile(
    profileName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "DELETE",
        "/signing-profiles/$(profileName)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    describe_signing_job(job_id)
    describe_signing_job(job_id, params::Dict{String,<:Any})

Returns information about a specific code signing job. You specify the job by using the
jobId value that is returned by the StartSigningJob operation.

# Arguments
- `job_id`: The ID of the signing job on input.

"""
function describe_signing_job(jobId; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "GET", "/signing-jobs/$(jobId)"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function describe_signing_job(
    jobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET",
        "/signing-jobs/$(jobId)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_signing_platform(platform_id)
    get_signing_platform(platform_id, params::Dict{String,<:Any})

Returns information on a specific signing platform.

# Arguments
- `platform_id`: The ID of the target signing platform.

"""
function get_signing_platform(platformId; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "GET",
        "/signing-platforms/$(platformId)";
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_signing_platform(
    platformId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "GET",
        "/signing-platforms/$(platformId)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_signing_profile(profile_name)
    get_signing_profile(profile_name, params::Dict{String,<:Any})

Returns information on a specific signing profile.

# Arguments
- `profile_name`: The name of the target signing profile.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"profileOwner"`: The AWS account ID of the profile owner.
"""
function get_signing_profile(profileName; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "GET",
        "/signing-profiles/$(profileName)";
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_signing_profile(
    profileName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "GET",
        "/signing-profiles/$(profileName)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_profile_permissions(profile_name)
    list_profile_permissions(profile_name, params::Dict{String,<:Any})

Lists the cross-account permissions associated with a signing profile.

# Arguments
- `profile_name`: Name of the signing profile containing the cross-account permissions.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"nextToken"`: String for specifying the next set of paginated results.
"""
function list_profile_permissions(
    profileName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET",
        "/signing-profiles/$(profileName)/permissions";
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function list_profile_permissions(
    profileName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "GET",
        "/signing-profiles/$(profileName)/permissions",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_signing_jobs()
    list_signing_jobs(params::Dict{String,<:Any})

Lists all your signing jobs. You can use the maxResults parameter to limit the number of
signing jobs that are returned in the response. If additional jobs remain to be listed,
code signing returns a nextToken value. Use this value in subsequent calls to
ListSigningJobs to fetch the remaining values. You can continue calling ListSigningJobs
with your maxResults parameter and with new values that code signing returns in the
nextToken parameter until all of your signing jobs have been returned.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"isRevoked"`: Filters results to return only signing jobs with revoked signatures.
- `"jobInvoker"`: Filters results to return only signing jobs initiated by a specified IAM
  entity.
- `"maxResults"`: Specifies the maximum number of items to return in the response. Use this
  parameter when paginating results. If additional items exist beyond the number you specify,
  the nextToken element is set in the response. Use the nextToken value in a subsequent
  request to retrieve additional items.
- `"nextToken"`: String for specifying the next set of paginated results to return. After
  you receive a response with truncated results, use this parameter in a subsequent request.
  Set it to the value of nextToken from the response that you just received.
- `"platformId"`: The ID of microcontroller platform that you specified for the
  distribution of your code image.
- `"requestedBy"`: The IAM principal that requested the signing job.
- `"signatureExpiresAfter"`: Filters results to return only signing jobs with signatures
  expiring after a specified timestamp.
- `"signatureExpiresBefore"`: Filters results to return only signing jobs with signatures
  expiring before a specified timestamp.
- `"status"`: A status value with which to filter your results.
"""
function list_signing_jobs(; aws_config::AbstractAWSConfig=global_aws_config())
    return signer("GET", "/signing-jobs"; aws_config=aws_config, features=SERVICE_FEATURES)
end
function list_signing_jobs(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET", "/signing-jobs", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    list_signing_platforms()
    list_signing_platforms(params::Dict{String,<:Any})

Lists all signing platforms available in code signing that match the request parameters. If
additional jobs remain to be listed, code signing returns a nextToken value. Use this value
in subsequent calls to ListSigningJobs to fetch the remaining values. You can continue
calling ListSigningJobs with your maxResults parameter and with new values that code
signing returns in the nextToken parameter until all of your signing jobs have been
returned.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"category"`: The category type of a signing platform.
- `"maxResults"`: The maximum number of results to be returned by this operation.
- `"nextToken"`: Value for specifying the next set of paginated results to return. After
  you receive a response with truncated results, use this parameter in a subsequent request.
  Set it to the value of nextToken from the response that you just received.
- `"partner"`: Any partner entities connected to a signing platform.
- `"target"`: The validation template that is used by the target signing platform.
"""
function list_signing_platforms(; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "GET", "/signing-platforms"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function list_signing_platforms(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET",
        "/signing-platforms",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_signing_profiles()
    list_signing_profiles(params::Dict{String,<:Any})

Lists all available signing profiles in your AWS account. Returns only profiles with an
ACTIVE status unless the includeCanceled request field is set to true. If additional jobs
remain to be listed, code signing returns a nextToken value. Use this value in subsequent
calls to ListSigningJobs to fetch the remaining values. You can continue calling
ListSigningJobs with your maxResults parameter and with new values that code signing
returns in the nextToken parameter until all of your signing jobs have been returned.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"includeCanceled"`: Designates whether to include profiles with the status of CANCELED.
- `"maxResults"`: The maximum number of profiles to be returned.
- `"nextToken"`: Value for specifying the next set of paginated results to return. After
  you receive a response with truncated results, use this parameter in a subsequent request.
  Set it to the value of nextToken from the response that you just received.
- `"platformId"`: Filters results to return only signing jobs initiated for a specified
  signing platform.
- `"statuses"`: Filters results to return only signing jobs with statuses in the specified
  list.
"""
function list_signing_profiles(; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "GET", "/signing-profiles"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function list_signing_profiles(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET", "/signing-profiles", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Returns a list of the tags associated with a signing profile resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the signing profile.

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "GET", "/tags/$(resourceArn)"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    put_signing_profile(platform_id, profile_name)
    put_signing_profile(platform_id, profile_name, params::Dict{String,<:Any})

Creates a signing profile. A signing profile is a code signing template that can be used to
carry out a pre-defined signing job. For more information, see
http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html

# Arguments
- `platform_id`: The ID of the signing platform to be created.
- `profile_name`: The name of the signing profile to be created.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"overrides"`: A subfield of platform. This specifies any different configuration options
  that you want to apply to the chosen platform (such as a different hash-algorithm or
  signing-algorithm).
- `"signatureValidityPeriod"`: The default validity period override for any signature
  generated using this signing profile. If unspecified, the default is 135 months.
- `"signingMaterial"`: The AWS Certificate Manager certificate that will be used to sign
  code with the new signing profile.
- `"signingParameters"`: Map of key-value pairs for signing. These can include any
  information that you want to use during signing.
- `"tags"`: Tags to be associated with the signing profile that is being created.
"""
function put_signing_profile(
    platformId, profileName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "PUT",
        "/signing-profiles/$(profileName)",
        Dict{String,Any}("platformId" => platformId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function put_signing_profile(
    platformId,
    profileName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "PUT",
        "/signing-profiles/$(profileName)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("platformId" => platformId), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    remove_profile_permission(profile_name, revision_id, statement_id)
    remove_profile_permission(profile_name, revision_id, statement_id, params::Dict{String,<:Any})

Removes cross-account permissions from a signing profile.

# Arguments
- `profile_name`: A human-readable name for the signing profile with permissions to be
  removed.
- `revision_id`: An identifier for the current revision of the signing profile permissions.
- `statement_id`: A unique identifier for the cross-account permissions statement.

"""
function remove_profile_permission(
    profileName, revisionId, statementId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "DELETE",
        "/signing-profiles/$(profileName)/permissions/$(statementId)",
        Dict{String,Any}("revisionId" => revisionId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function remove_profile_permission(
    profileName,
    revisionId,
    statementId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "DELETE",
        "/signing-profiles/$(profileName)/permissions/$(statementId)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("revisionId" => revisionId), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    revoke_signature(job_id, reason)
    revoke_signature(job_id, reason, params::Dict{String,<:Any})

Changes the state of a signing job to REVOKED. This indicates that the signature is no
longer valid.

# Arguments
- `job_id`: ID of the signing job to be revoked.
- `reason`: The reason for revoking the signing job.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"jobOwner"`: AWS account ID of the job owner.
"""
function revoke_signature(jobId, reason; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "PUT",
        "/signing-jobs/$(jobId)/revoke",
        Dict{String,Any}("reason" => reason);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function revoke_signature(
    jobId,
    reason,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "PUT",
        "/signing-jobs/$(jobId)/revoke",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("reason" => reason), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    revoke_signing_profile(effective_time, profile_name, profile_version, reason)
    revoke_signing_profile(effective_time, profile_name, profile_version, reason, params::Dict{String,<:Any})

Changes the state of a signing profile to REVOKED. This indicates that signatures generated
using the signing profile after an effective start date are no longer valid.

# Arguments
- `effective_time`: A timestamp for when revocation of a Signing Profile should become
  effective. Signatures generated using the signing profile after this timestamp are not
  trusted.
- `profile_name`: The name of the signing profile to be revoked.
- `profile_version`: The version of the signing profile to be revoked.
- `reason`: The reason for revoking a signing profile.

"""
function revoke_signing_profile(
    effectiveTime,
    profileName,
    profileVersion,
    reason;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "PUT",
        "/signing-profiles/$(profileName)/revoke",
        Dict{String,Any}(
            "effectiveTime" => effectiveTime,
            "profileVersion" => profileVersion,
            "reason" => reason,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function revoke_signing_profile(
    effectiveTime,
    profileName,
    profileVersion,
    reason,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "PUT",
        "/signing-profiles/$(profileName)/revoke",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "effectiveTime" => effectiveTime,
                    "profileVersion" => profileVersion,
                    "reason" => reason,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    start_signing_job(client_request_token, destination, profile_name, source)
    start_signing_job(client_request_token, destination, profile_name, source, params::Dict{String,<:Any})

Initiates a signing job to be performed on the code provided. Signing jobs are viewable by
the ListSigningJobs operation for two years after they are performed. Note the following
requirements:     You must create an Amazon S3 source bucket. For more information, see
Create a Bucket in the Amazon S3 Getting Started Guide.    Your S3 source bucket must be
version enabled.   You must create an S3 destination bucket. Code signing uses your S3
destination bucket to write your signed code.   You specify the name of the source and
destination buckets when calling the StartSigningJob operation.   You must also specify a
request token that identifies your request to code signing.   You can call the
DescribeSigningJob and the ListSigningJobs actions after you call StartSigningJob. For a
Java example that shows how to use this action, see
http://docs.aws.amazon.com/acm/latest/userguide/

# Arguments
- `client_request_token`: String that identifies the signing request. All calls after the
  first that use this token return the same response as the first call.
- `destination`: The S3 bucket in which to save your signed object. The destination
  contains the name of your bucket and an optional prefix.
- `profile_name`: The name of the signing profile.
- `source`: The S3 bucket that contains the object to sign or a BLOB that contains your raw
  code.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"profileOwner"`: The AWS account ID of the signing profile owner.
"""
function start_signing_job(
    clientRequestToken,
    destination,
    profileName,
    source;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "POST",
        "/signing-jobs",
        Dict{String,Any}(
            "clientRequestToken" => clientRequestToken,
            "destination" => destination,
            "profileName" => profileName,
            "source" => source,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function start_signing_job(
    clientRequestToken,
    destination,
    profileName,
    source,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "POST",
        "/signing-jobs",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "clientRequestToken" => clientRequestToken,
                    "destination" => destination,
                    "profileName" => profileName,
                    "source" => source,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds one or more tags to a signing profile. Tags are labels that you can use to identify
and organize your AWS resources. Each tag consists of a key and an optional value. To
specify the signing profile, use its Amazon Resource Name (ARN). To specify the tag, use a
key-value pair.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the signing profile.
- `tags`: One or more tags to be associated with the signing profile.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return signer(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tags" => tags);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function tag_resource(
    resourceArn,
    tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tags" => tags), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes one or more tags from a signing profile. To remove the tags, specify a list of tag
keys.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for the signing profile.
- `tag_keys`: A list of tag keys to be removed from the signing profile.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return signer(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function untag_resource(
    resourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return signer(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
