# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: finspace_data
using AWS.Compat
using AWS.UUIDs

"""
    create_changeset(change_type, dataset_id, source_params, source_type)
    create_changeset(change_type, dataset_id, source_params, source_type, params::Dict{String,<:Any})

Creates a new changeset in a FinSpace dataset.

# Arguments
- `change_type`: Option to indicate how a changeset will be applied to a dataset.
  REPLACE - Changeset will be considered as a replacement to all prior loaded changesets.
  APPEND - Changeset will be considered as an addition to the end of all prior loaded
  changesets.
- `dataset_id`: The unique identifier for the FinSpace dataset in which the changeset will
  be created.
- `source_params`: Source path from which the files to create the changeset will be sourced.
- `source_type`: Type of the data source from which the files to create the changeset will
  be sourced.    S3 - Amazon S3.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"formatParams"`: Options that define the structure of the source file(s).
- `"formatType"`: Format type of the input files being loaded into the changeset.
- `"tags"`: Metadata tags to apply to this changeset.
"""
function create_changeset(
    changeType,
    datasetId,
    sourceParams,
    sourceType;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace_data(
        "POST",
        "/datasets/$(datasetId)/changesets",
        Dict{String,Any}(
            "changeType" => changeType,
            "sourceParams" => sourceParams,
            "sourceType" => sourceType,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function create_changeset(
    changeType,
    datasetId,
    sourceParams,
    sourceType,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace_data(
        "POST",
        "/datasets/$(datasetId)/changesets",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "changeType" => changeType,
                    "sourceParams" => sourceParams,
                    "sourceType" => sourceType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_programmatic_access_credentials(environment_id)
    get_programmatic_access_credentials(environment_id, params::Dict{String,<:Any})

Request programmatic credentials to use with Habanero SDK.

# Arguments
- `environment_id`: The habanero environment identifier.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"durationInMinutes"`: The time duration in which the credentials remain valid.
"""
function get_programmatic_access_credentials(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace_data(
        "GET",
        "/credentials/programmatic",
        Dict{String,Any}("environmentId" => environmentId);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_programmatic_access_credentials(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return finspace_data(
        "GET",
        "/credentials/programmatic",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("environmentId" => environmentId), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_working_location()
    get_working_location(params::Dict{String,<:Any})

A temporary Amazon S3 location to copy your files from a source location to stage or use as
a scratch space in Habanero notebook.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"locationType"`: Specify the type of the working location.    SAGEMAKER - Use the Amazon
  S3 location as a temporary location to store data content when working with FinSpace
  Notebooks that run on SageMaker studio.    INGESTION - Use the Amazon S3 location as a
  staging location to copy your data content and then use the location with the changeset
  creation operation.
"""
function get_working_location(; aws_config::AbstractAWSConfig=global_aws_config())
    return finspace_data(
        "POST", "/workingLocationV1"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function get_working_location(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return finspace_data(
        "POST",
        "/workingLocationV1",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
