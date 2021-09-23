# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: sagemaker_featurestore_runtime
using AWS.Compat
using AWS.UUIDs

"""
    batch_get_record(identifiers)
    batch_get_record(identifiers, params::Dict{String,<:Any})

Retrieves a batch of Records from a FeatureGroup.

# Arguments
- `identifiers`: A list of FeatureGroup names, with their corresponding RecordIdentifier
  value, and Feature name that have been requested to be retrieved in batch.

"""
function batch_get_record(Identifiers; aws_config::AbstractAWSConfig=global_aws_config())
    return sagemaker_featurestore_runtime(
        "POST",
        "/BatchGetRecord",
        Dict{String,Any}("Identifiers" => Identifiers);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function batch_get_record(
    Identifiers,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "POST",
        "/BatchGetRecord",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Identifiers" => Identifiers), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_record(event_time, feature_group_name, record_identifier_value_as_string)
    delete_record(event_time, feature_group_name, record_identifier_value_as_string, params::Dict{String,<:Any})

Deletes a Record from a FeatureGroup. A new record will show up in the OfflineStore when
the DeleteRecord API is called. This record will have a value of True in the is_deleted
column.

# Arguments
- `event_time`: Timestamp indicating when the deletion event occurred. EventTime can be
  used to query data at a certain point in time.
- `feature_group_name`: The name of the feature group to delete the record from.
- `record_identifier_value_as_string`: The value for the RecordIdentifier that uniquely
  identifies the record, in string format.

"""
function delete_record(
    EventTime,
    FeatureGroupName,
    RecordIdentifierValueAsString;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "DELETE",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}(
            "EventTime" => EventTime,
            "RecordIdentifierValueAsString" => RecordIdentifierValueAsString,
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_record(
    EventTime,
    FeatureGroupName,
    RecordIdentifierValueAsString,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "DELETE",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "EventTime" => EventTime,
                    "RecordIdentifierValueAsString" => RecordIdentifierValueAsString,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_record(feature_group_name, record_identifier_value_as_string)
    get_record(feature_group_name, record_identifier_value_as_string, params::Dict{String,<:Any})

Use for OnlineStore serving from a FeatureStore. Only the latest records stored in the
OnlineStore can be retrieved. If no Record with RecordIdentifierValue is found, then an
empty result is returned.

# Arguments
- `feature_group_name`: The name of the feature group in which you want to put the records.
- `record_identifier_value_as_string`: The value that corresponds to RecordIdentifier type
  and uniquely identifies the record in the FeatureGroup.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"FeatureName"`: List of names of Features to be retrieved. If not specified, the latest
  value for all the Features are returned.
"""
function get_record(
    FeatureGroupName,
    RecordIdentifierValueAsString;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "GET",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}("RecordIdentifierValueAsString" => RecordIdentifierValueAsString);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_record(
    FeatureGroupName,
    RecordIdentifierValueAsString,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "GET",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "RecordIdentifierValueAsString" => RecordIdentifierValueAsString
                ),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    put_record(feature_group_name, record)
    put_record(feature_group_name, record, params::Dict{String,<:Any})

Used for data ingestion into the FeatureStore. The PutRecord API writes to both the
OnlineStore and OfflineStore. If the record is the latest record for the recordIdentifier,
the record is written to both the OnlineStore and OfflineStore. If the record is a historic
record, it is written only to the OfflineStore.

# Arguments
- `feature_group_name`: The name of the feature group that you want to insert the record
  into.
- `record`: List of FeatureValues to be inserted. This will be a full over-write. If you
  only want to update few of the feature values, do the following:   Use GetRecord to
  retrieve the latest record.   Update the record returned from GetRecord.    Use PutRecord
  to update feature values.

"""
function put_record(
    FeatureGroupName, Record; aws_config::AbstractAWSConfig=global_aws_config()
)
    return sagemaker_featurestore_runtime(
        "PUT",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}("Record" => Record);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function put_record(
    FeatureGroupName,
    Record,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_featurestore_runtime(
        "PUT",
        "/FeatureGroup/$(FeatureGroupName)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Record" => Record), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
