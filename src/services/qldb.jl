# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: qldb
using AWS.Compat
using AWS.UUIDs

"""
    cancel_journal_kinesis_stream(name, stream_id)
    cancel_journal_kinesis_stream(name, stream_id, params::Dict{String,<:Any})

Ends a given Amazon QLDB journal stream. Before a stream can be canceled, its current
status must be ACTIVE. You can't restart a stream after you cancel it. Canceled QLDB stream
resources are subject to a 7-day retention period, so they are automatically deleted after
this limit expires.

# Arguments
- `name`: The name of the ledger.
- `stream_id`: The UUID (represented in Base62-encoded text) of the QLDB journal stream to
  be canceled.

"""
function cancel_journal_kinesis_stream(
    name, streamId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "DELETE",
        "/ledgers/$(name)/journal-kinesis-streams/$(streamId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function cancel_journal_kinesis_stream(
    name,
    streamId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "DELETE",
        "/ledgers/$(name)/journal-kinesis-streams/$(streamId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_ledger(name, permissions_mode)
    create_ledger(name, permissions_mode, params::Dict{String,<:Any})

Creates a new ledger in your account in the current Region.

# Arguments
- `name`: The name of the ledger that you want to create. The name must be unique among all
  of the ledgers in your account in the current Region. Naming constraints for ledger names
  are defined in Quotas in Amazon QLDB in the Amazon QLDB Developer Guide.
- `permissions_mode`: The permissions mode to assign to the ledger that you want to create.
  This parameter can have one of the following values:    ALLOW_ALL: A legacy permissions
  mode that enables access control with API-level granularity for ledgers. This mode allows
  users who have the SendCommand API permission for this ledger to run all PartiQL commands
  (hence, ALLOW_ALL) on any tables in the specified ledger. This mode disregards any
  table-level or command-level IAM permissions policies that you create for the ledger.
  STANDARD: (Recommended) A permissions mode that enables access control with finer
  granularity for ledgers, tables, and PartiQL commands. By default, this mode denies all
  user requests to run any PartiQL commands on any tables in this ledger. To allow PartiQL
  commands to run, you must create IAM permissions policies for specific table resources and
  PartiQL actions, in addition to the SendCommand API permission for the ledger. For
  information, see Getting started with the standard permissions mode in the Amazon QLDB
  Developer Guide.    We strongly recommend using the STANDARD permissions mode to maximize
  the security of your ledger data.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DeletionProtection"`: The flag that prevents a ledger from being deleted by any user.
  If not provided on ledger creation, this feature is enabled (true) by default. If deletion
  protection is enabled, you must first disable it before you can delete the ledger. You can
  disable it by calling the UpdateLedger operation to set the flag to false.
- `"KmsKey"`: The key in Key Management Service (KMS) to use for encryption of data at rest
  in the ledger. For more information, see Encryption at rest in the Amazon QLDB Developer
  Guide. Use one of the following options to specify this parameter:    AWS_OWNED_KMS_KEY:
  Use an KMS key that is owned and managed by Amazon Web Services on your behalf.
  Undefined: By default, use an Amazon Web Services owned KMS key.    A valid symmetric
  customer managed KMS key: Use the specified KMS key in your account that you create, own,
  and manage. Amazon QLDB does not support asymmetric keys. For more information, see Using
  symmetric and asymmetric keys in the Key Management Service Developer Guide.   To specify a
  customer managed KMS key, you can use its key ID, Amazon Resource Name (ARN), alias name,
  or alias ARN. When using an alias name, prefix it with \"alias/\". To specify a key in a
  different account, you must use the key ARN or alias ARN. For example:   Key ID:
  1234abcd-12ab-34cd-56ef-1234567890ab    Key ARN:
  arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab    Alias name:
  alias/ExampleAlias    Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias
  For more information, see Key identifiers (KeyId) in the Key Management Service Developer
  Guide.
- `"Tags"`: The key-value pairs to add as tags to the ledger that you want to create. Tag
  keys are case sensitive. Tag values are case sensitive and can be null.
"""
function create_ledger(
    Name, PermissionsMode; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "POST",
        "/ledgers",
        Dict{String,Any}("Name" => Name, "PermissionsMode" => PermissionsMode);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_ledger(
    Name,
    PermissionsMode,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Name" => Name, "PermissionsMode" => PermissionsMode),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_ledger(name)
    delete_ledger(name, params::Dict{String,<:Any})

Deletes a ledger and all of its contents. This action is irreversible. If deletion
protection is enabled, you must first disable it before you can delete the ledger. You can
disable it by calling the UpdateLedger operation to set the flag to false.

# Arguments
- `name`: The name of the ledger that you want to delete.

"""
function delete_ledger(name; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "DELETE", "/ledgers/$(name)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function delete_ledger(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "DELETE",
        "/ledgers/$(name)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_journal_kinesis_stream(name, stream_id)
    describe_journal_kinesis_stream(name, stream_id, params::Dict{String,<:Any})

Returns detailed information about a given Amazon QLDB journal stream. The output includes
the Amazon Resource Name (ARN), stream name, current status, creation time, and the
parameters of the original stream creation request. This action does not return any expired
journal streams. For more information, see Expiration for terminal streams in the Amazon
QLDB Developer Guide.

# Arguments
- `name`: The name of the ledger.
- `stream_id`: The UUID (represented in Base62-encoded text) of the QLDB journal stream to
  describe.

"""
function describe_journal_kinesis_stream(
    name, streamId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-kinesis-streams/$(streamId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_journal_kinesis_stream(
    name,
    streamId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-kinesis-streams/$(streamId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_journal_s3_export(export_id, name)
    describe_journal_s3_export(export_id, name, params::Dict{String,<:Any})

Returns information about a journal export job, including the ledger name, export ID,
creation time, current status, and the parameters of the original export creation request.
This action does not return any expired export jobs. For more information, see Export job
expiration in the Amazon QLDB Developer Guide. If the export job with the given ExportId
doesn't exist, then throws ResourceNotFoundException. If the ledger with the given Name
doesn't exist, then throws ResourceNotFoundException.

# Arguments
- `export_id`: The UUID (represented in Base62-encoded text) of the journal export job to
  describe.
- `name`: The name of the ledger.

"""
function describe_journal_s3_export(
    exportId, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-s3-exports/$(exportId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_journal_s3_export(
    exportId,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-s3-exports/$(exportId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_ledger(name)
    describe_ledger(name, params::Dict{String,<:Any})

Returns information about a ledger, including its state, permissions mode, encryption at
rest settings, and when it was created.

# Arguments
- `name`: The name of the ledger that you want to describe.

"""
function describe_ledger(name; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "GET", "/ledgers/$(name)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function describe_ledger(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    export_journal_to_s3(exclusive_end_time, inclusive_start_time, role_arn, s3_export_configuration, name)
    export_journal_to_s3(exclusive_end_time, inclusive_start_time, role_arn, s3_export_configuration, name, params::Dict{String,<:Any})

Exports journal contents within a date and time range from a ledger into a specified Amazon
Simple Storage Service (Amazon S3) bucket. The data is written as files in Amazon Ion
format. If the ledger with the given Name doesn't exist, then throws
ResourceNotFoundException. If the ledger with the given Name is in CREATING status, then
throws ResourcePreconditionNotMetException. You can initiate up to two concurrent journal
export requests for each ledger. Beyond this limit, journal export requests throw
LimitExceededException.

# Arguments
- `exclusive_end_time`: The exclusive end date and time for the range of journal contents
  to export. The ExclusiveEndTime must be in ISO 8601 date and time format and in Universal
  Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z. The ExclusiveEndTime must be
  less than or equal to the current UTC date and time.
- `inclusive_start_time`: The inclusive start date and time for the range of journal
  contents to export. The InclusiveStartTime must be in ISO 8601 date and time format and in
  Universal Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z. The InclusiveStartTime
  must be before ExclusiveEndTime. If you provide an InclusiveStartTime that is before the
  ledger's CreationDateTime, Amazon QLDB defaults it to the ledger's CreationDateTime.
- `role_arn`: The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions
  for a journal export job to do the following:   Write objects into your Amazon Simple
  Storage Service (Amazon S3) bucket.   (Optional) Use your customer master key (CMK) in Key
  Management Service (KMS) for server-side encryption of your exported data.
- `s3_export_configuration`: The configuration settings of the Amazon S3 bucket destination
  for your export request.
- `name`: The name of the ledger.

"""
function export_journal_to_s3(
    ExclusiveEndTime,
    InclusiveStartTime,
    RoleArn,
    S3ExportConfiguration,
    name;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/journal-s3-exports",
        Dict{String,Any}(
            "ExclusiveEndTime" => ExclusiveEndTime,
            "InclusiveStartTime" => InclusiveStartTime,
            "RoleArn" => RoleArn,
            "S3ExportConfiguration" => S3ExportConfiguration,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function export_journal_to_s3(
    ExclusiveEndTime,
    InclusiveStartTime,
    RoleArn,
    S3ExportConfiguration,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/journal-s3-exports",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ExclusiveEndTime" => ExclusiveEndTime,
                    "InclusiveStartTime" => InclusiveStartTime,
                    "RoleArn" => RoleArn,
                    "S3ExportConfiguration" => S3ExportConfiguration,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_block(block_address, name)
    get_block(block_address, name, params::Dict{String,<:Any})

Returns a block object at a specified address in a journal. Also returns a proof of the
specified block for verification if DigestTipAddress is provided. For information about the
data contents in a block, see Journal contents in the Amazon QLDB Developer Guide. If the
specified ledger doesn't exist or is in DELETING status, then throws
ResourceNotFoundException. If the specified ledger is in CREATING status, then throws
ResourcePreconditionNotMetException. If no block exists with the specified address, then
throws InvalidParameterException.

# Arguments
- `block_address`: The location of the block that you want to request. An address is an
  Amazon Ion structure that has two fields: strandId and sequenceNo. For example:
  {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:14}.
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DigestTipAddress"`: The latest block location covered by the digest for which to
  request a proof. An address is an Amazon Ion structure that has two fields: strandId and
  sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:49}.
"""
function get_block(BlockAddress, name; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "POST",
        "/ledgers/$(name)/block",
        Dict{String,Any}("BlockAddress" => BlockAddress);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_block(
    BlockAddress,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/block",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("BlockAddress" => BlockAddress), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_digest(name)
    get_digest(name, params::Dict{String,<:Any})

Returns the digest of a ledger at the latest committed block in the journal. The response
includes a 256-bit hash value and a block address.

# Arguments
- `name`: The name of the ledger.

"""
function get_digest(name; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "POST",
        "/ledgers/$(name)/digest";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_digest(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "POST",
        "/ledgers/$(name)/digest",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_revision(block_address, document_id, name)
    get_revision(block_address, document_id, name, params::Dict{String,<:Any})

Returns a revision data object for a specified document ID and block address. Also returns
a proof of the specified revision for verification if DigestTipAddress is provided.

# Arguments
- `block_address`: The block location of the document revision to be verified. An address
  is an Amazon Ion structure that has two fields: strandId and sequenceNo. For example:
  {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:14}.
- `document_id`: The UUID (represented in Base62-encoded text) of the document to be
  verified.
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DigestTipAddress"`: The latest block location covered by the digest for which to
  request a proof. An address is an Amazon Ion structure that has two fields: strandId and
  sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:49}.
"""
function get_revision(
    BlockAddress, DocumentId, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "POST",
        "/ledgers/$(name)/revision",
        Dict{String,Any}("BlockAddress" => BlockAddress, "DocumentId" => DocumentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_revision(
    BlockAddress,
    DocumentId,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/revision",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "BlockAddress" => BlockAddress, "DocumentId" => DocumentId
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_journal_kinesis_streams_for_ledger(name)
    list_journal_kinesis_streams_for_ledger(name, params::Dict{String,<:Any})

Returns an array of all Amazon QLDB journal stream descriptors for a given ledger. The
output of each stream descriptor includes the same details that are returned by
DescribeJournalKinesisStream. This action does not return any expired journal streams. For
more information, see Expiration for terminal streams in the Amazon QLDB Developer Guide.
This action returns a maximum of MaxResults items. It is paginated so that you can retrieve
all the items by calling ListJournalKinesisStreamsForLedger multiple times.

# Arguments
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max_results"`: The maximum number of results to return in a single
  ListJournalKinesisStreamsForLedger request. (The actual number of results returned might be
  fewer.)
- `"next_token"`: A pagination token, indicating that you want to retrieve the next page of
  results. If you received a value for NextToken in the response from a previous
  ListJournalKinesisStreamsForLedger call, you should use that value as input here.
"""
function list_journal_kinesis_streams_for_ledger(
    name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-kinesis-streams";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_journal_kinesis_streams_for_ledger(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-kinesis-streams",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_journal_s3_exports()
    list_journal_s3_exports(params::Dict{String,<:Any})

Returns an array of journal export job descriptions for all ledgers that are associated
with the current account and Region. This action returns a maximum of MaxResults items, and
is paginated so that you can retrieve all the items by calling ListJournalS3Exports
multiple times. This action does not return any expired export jobs. For more information,
see Export job expiration in the Amazon QLDB Developer Guide.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max_results"`: The maximum number of results to return in a single ListJournalS3Exports
  request. (The actual number of results returned might be fewer.)
- `"next_token"`: A pagination token, indicating that you want to retrieve the next page of
  results. If you received a value for NextToken in the response from a previous
  ListJournalS3Exports call, then you should use that value as input here.
"""
function list_journal_s3_exports(; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "GET", "/journal-s3-exports"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_journal_s3_exports(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/journal-s3-exports",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_journal_s3_exports_for_ledger(name)
    list_journal_s3_exports_for_ledger(name, params::Dict{String,<:Any})

Returns an array of journal export job descriptions for a specified ledger. This action
returns a maximum of MaxResults items, and is paginated so that you can retrieve all the
items by calling ListJournalS3ExportsForLedger multiple times. This action does not return
any expired export jobs. For more information, see Export job expiration in the Amazon QLDB
Developer Guide.

# Arguments
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max_results"`: The maximum number of results to return in a single
  ListJournalS3ExportsForLedger request. (The actual number of results returned might be
  fewer.)
- `"next_token"`: A pagination token, indicating that you want to retrieve the next page of
  results. If you received a value for NextToken in the response from a previous
  ListJournalS3ExportsForLedger call, then you should use that value as input here.
"""
function list_journal_s3_exports_for_ledger(
    name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-s3-exports";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_journal_s3_exports_for_ledger(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET",
        "/ledgers/$(name)/journal-s3-exports",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_ledgers()
    list_ledgers(params::Dict{String,<:Any})

Returns an array of ledger summaries that are associated with the current account and
Region. This action returns a maximum of 100 items and is paginated so that you can
retrieve all the items by calling ListLedgers multiple times.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max_results"`: The maximum number of results to return in a single ListLedgers request.
  (The actual number of results returned might be fewer.)
- `"next_token"`: A pagination token, indicating that you want to retrieve the next page of
  results. If you received a value for NextToken in the response from a previous ListLedgers
  call, then you should use that value as input here.
"""
function list_ledgers(; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb("GET", "/ledgers"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
function list_ledgers(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "GET", "/ledgers", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Returns all tags for a specified Amazon QLDB resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) for which to list the tags. For example:
  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger

"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
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
    return qldb(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stream_journal_to_kinesis(inclusive_start_time, kinesis_configuration, role_arn, stream_name, name)
    stream_journal_to_kinesis(inclusive_start_time, kinesis_configuration, role_arn, stream_name, name, params::Dict{String,<:Any})

Creates a journal stream for a given Amazon QLDB ledger. The stream captures every document
revision that is committed to the ledger's journal and delivers the data to a specified
Amazon Kinesis Data Streams resource.

# Arguments
- `inclusive_start_time`: The inclusive start date and time from which to start streaming
  journal data. This parameter must be in ISO 8601 date and time format and in Universal
  Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z. The InclusiveStartTime cannot be
  in the future and must be before ExclusiveEndTime. If you provide an InclusiveStartTime
  that is before the ledger's CreationDateTime, QLDB effectively defaults it to the ledger's
  CreationDateTime.
- `kinesis_configuration`: The configuration settings of the Kinesis Data Streams
  destination for your stream request.
- `role_arn`: The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions
  for a journal stream to write data records to a Kinesis Data Streams resource.
- `stream_name`: The name that you want to assign to the QLDB journal stream. User-defined
  names can help identify and indicate the purpose of a stream. Your stream name must be
  unique among other active streams for a given ledger. Stream names have the same naming
  constraints as ledger names, as defined in Quotas in Amazon QLDB in the Amazon QLDB
  Developer Guide.
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ExclusiveEndTime"`: The exclusive date and time that specifies when the stream ends. If
  you don't define this parameter, the stream runs indefinitely until you cancel it. The
  ExclusiveEndTime must be in ISO 8601 date and time format and in Universal Coordinated Time
  (UTC). For example: 2019-06-13T21:36:34Z.
- `"Tags"`: The key-value pairs to add as tags to the stream that you want to create. Tag
  keys are case sensitive. Tag values are case sensitive and can be null.
"""
function stream_journal_to_kinesis(
    InclusiveStartTime,
    KinesisConfiguration,
    RoleArn,
    StreamName,
    name;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/journal-kinesis-streams",
        Dict{String,Any}(
            "InclusiveStartTime" => InclusiveStartTime,
            "KinesisConfiguration" => KinesisConfiguration,
            "RoleArn" => RoleArn,
            "StreamName" => StreamName,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function stream_journal_to_kinesis(
    InclusiveStartTime,
    KinesisConfiguration,
    RoleArn,
    StreamName,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/ledgers/$(name)/journal-kinesis-streams",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "InclusiveStartTime" => InclusiveStartTime,
                    "KinesisConfiguration" => KinesisConfiguration,
                    "RoleArn" => RoleArn,
                    "StreamName" => StreamName,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(tags, resource_arn)
    tag_resource(tags, resource_arn, params::Dict{String,<:Any})

Adds one or more tags to a specified Amazon QLDB resource. A resource can have up to 50
tags. If you try to create more than 50 tags for a resource, your request fails and returns
an error.

# Arguments
- `tags`: The key-value pairs to add as tags to the specified QLDB resource. Tag keys are
  case sensitive. If you specify a key that already exists for the resource, your request
  fails and returns an error. Tag values are case sensitive and can be null.
- `resource_arn`: The Amazon Resource Name (ARN) to which you want to add the tags. For
  example:  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger

"""
function tag_resource(Tags, resourceArn; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}("Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    Tags,
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "POST",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes one or more tags from a specified Amazon QLDB resource. You can specify up to 50
tag keys to remove.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) from which to remove the tags. For
  example:  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger
- `tag_keys`: The list of tag keys to remove.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
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
    return qldb(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_ledger(name)
    update_ledger(name, params::Dict{String,<:Any})

Updates properties on a ledger.

# Arguments
- `name`: The name of the ledger.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DeletionProtection"`: The flag that prevents a ledger from being deleted by any user.
  If not provided on ledger creation, this feature is enabled (true) by default. If deletion
  protection is enabled, you must first disable it before you can delete the ledger. You can
  disable it by calling the UpdateLedger operation to set the flag to false.
- `"KmsKey"`: The key in Key Management Service (KMS) to use for encryption of data at rest
  in the ledger. For more information, see Encryption at rest in the Amazon QLDB Developer
  Guide. Use one of the following options to specify this parameter:    AWS_OWNED_KMS_KEY:
  Use an KMS key that is owned and managed by Amazon Web Services on your behalf.
  Undefined: Make no changes to the KMS key of the ledger.    A valid symmetric customer
  managed KMS key: Use the specified KMS key in your account that you create, own, and
  manage. Amazon QLDB does not support asymmetric keys. For more information, see Using
  symmetric and asymmetric keys in the Key Management Service Developer Guide.   To specify a
  customer managed KMS key, you can use its key ID, Amazon Resource Name (ARN), alias name,
  or alias ARN. When using an alias name, prefix it with \"alias/\". To specify a key in a
  different account, you must use the key ARN or alias ARN. For example:   Key ID:
  1234abcd-12ab-34cd-56ef-1234567890ab    Key ARN:
  arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab    Alias name:
  alias/ExampleAlias    Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias
  For more information, see Key identifiers (KeyId) in the Key Management Service Developer
  Guide.
"""
function update_ledger(name; aws_config::AbstractAWSConfig=global_aws_config())
    return qldb(
        "PATCH", "/ledgers/$(name)"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function update_ledger(
    name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "PATCH",
        "/ledgers/$(name)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_ledger_permissions_mode(permissions_mode, name)
    update_ledger_permissions_mode(permissions_mode, name, params::Dict{String,<:Any})

Updates the permissions mode of a ledger.  Before you switch to the STANDARD permissions
mode, you must first create all required IAM policies and table tags to avoid disruption to
your users. To learn more, see Migrating to the standard permissions mode in the Amazon
QLDB Developer Guide.

# Arguments
- `permissions_mode`: The permissions mode to assign to the ledger. This parameter can have
  one of the following values:    ALLOW_ALL: A legacy permissions mode that enables access
  control with API-level granularity for ledgers. This mode allows users who have the
  SendCommand API permission for this ledger to run all PartiQL commands (hence, ALLOW_ALL)
  on any tables in the specified ledger. This mode disregards any table-level or
  command-level IAM permissions policies that you create for the ledger.    STANDARD:
  (Recommended) A permissions mode that enables access control with finer granularity for
  ledgers, tables, and PartiQL commands. By default, this mode denies all user requests to
  run any PartiQL commands on any tables in this ledger. To allow PartiQL commands to run,
  you must create IAM permissions policies for specific table resources and PartiQL actions,
  in addition to the SendCommand API permission for the ledger. For information, see Getting
  started with the standard permissions mode in the Amazon QLDB Developer Guide.    We
  strongly recommend using the STANDARD permissions mode to maximize the security of your
  ledger data.
- `name`: The name of the ledger.

"""
function update_ledger_permissions_mode(
    PermissionsMode, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return qldb(
        "PATCH",
        "/ledgers/$(name)/permissions-mode",
        Dict{String,Any}("PermissionsMode" => PermissionsMode);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_ledger_permissions_mode(
    PermissionsMode,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return qldb(
        "PATCH",
        "/ledgers/$(name)/permissions-mode",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("PermissionsMode" => PermissionsMode), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
