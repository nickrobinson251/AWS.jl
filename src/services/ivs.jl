# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ivs
using AWS.Compat
using AWS.UUIDs

"""
    batch_get_channel(arns)
    batch_get_channel(arns, params::Dict{String,<:Any})

Performs GetChannel on multiple ARNs simultaneously.

# Arguments
- `arns`: Array of ARNs, one per channel.

"""
function batch_get_channel(arns; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/BatchGetChannel",
        Dict{String,Any}("arns" => arns);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function batch_get_channel(
    arns, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/BatchGetChannel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arns" => arns), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    batch_get_stream_key(arns)
    batch_get_stream_key(arns, params::Dict{String,<:Any})

Performs GetStreamKey on multiple ARNs simultaneously.

# Arguments
- `arns`: Array of ARNs, one per channel.

"""
function batch_get_stream_key(arns; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/BatchGetStreamKey",
        Dict{String,Any}("arns" => arns);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function batch_get_stream_key(
    arns, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/BatchGetStreamKey",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arns" => arns), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    create_channel()
    create_channel(params::Dict{String,<:Any})

Creates a new channel and an associated stream key to start streaming.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"authorized"`: Whether the channel is private (enabled for playback authorization).
  Default: false.
- `"latencyMode"`: Channel latency mode. Use NORMAL to broadcast and deliver live video up
  to Full HD. Use LOW for near-real-time interaction with viewers. (Note: In the Amazon IVS
  console, LOW and NORMAL correspond to Ultra-low and Standard, respectively.) Default: LOW.
- `"name"`: Channel name.
- `"recordingConfigurationArn"`: Recording-configuration ARN. Default: \"\" (empty string,
  recording is disabled).
- `"tags"`: Array of 1-50 maps, each of the form string:string (key:value).
- `"type"`: Channel type, which determines the allowable resolution and bitrate. If you
  exceed the allowable resolution or bitrate, the stream probably will disconnect
  immediately. Default: STANDARD. Valid values:    STANDARD: Multiple qualities are generated
  from the original input, to automatically give viewers the best experience for their
  devices and network conditions. Vertical resolution can be up to 1080 and bitrate can be up
  to 8.5 Mbps.    BASIC: Amazon IVS delivers the original input to viewers. The viewer’s
  video-quality choice is limited to the original input. Vertical resolution can be up to 480
  and bitrate can be up to 1.5 Mbps.
"""
function create_channel(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs("POST", "/CreateChannel"; aws_config=aws_config, features=SERVICE_FEATURES)
end
function create_channel(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST", "/CreateChannel", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    create_recording_configuration(destination_configuration)
    create_recording_configuration(destination_configuration, params::Dict{String,<:Any})

Creates a new recording configuration, used to enable recording to Amazon S3.  Known issue:
In the us-east-1 region, if you use the AWS CLI to create a recording configuration, it
returns success even if the S3 bucket is in a different region. In this case, the state of
the recording configuration is CREATE_FAILED (instead of ACTIVE). (In other regions, the
CLI correctly returns failure if the bucket is in a different region.)  Workaround: Ensure
that your S3 bucket is in the same region as the recording configuration. If you create a
recording configuration in a different region as your S3 bucket, delete that recording
configuration and create a new one with an S3 bucket from the correct region.

# Arguments
- `destination_configuration`: A complex type that contains a destination configuration for
  where recorded video will be stored.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"name"`: An arbitrary string (a nickname) that helps the customer identify that
  resource. The value does not need to be unique.
- `"tags"`: Array of 1-50 maps, each of the form string:string (key:value).
"""
function create_recording_configuration(
    destinationConfiguration; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/CreateRecordingConfiguration",
        Dict{String,Any}("destinationConfiguration" => destinationConfiguration);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function create_recording_configuration(
    destinationConfiguration,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/CreateRecordingConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("destinationConfiguration" => destinationConfiguration),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    create_stream_key(channel_arn)
    create_stream_key(channel_arn, params::Dict{String,<:Any})

Creates a stream key, used to initiate a stream, for the specified channel ARN. Note that
CreateChannel creates a stream key. If you subsequently use CreateStreamKey on the same
channel, it will fail because a stream key already exists and there is a limit of 1 stream
key per channel. To reset the stream key on a channel, use DeleteStreamKey and then
CreateStreamKey.

# Arguments
- `channel_arn`: ARN of the channel for which to create the stream key.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"tags"`: Array of 1-50 maps, each of the form string:string (key:value).
"""
function create_stream_key(channelArn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/CreateStreamKey",
        Dict{String,Any}("channelArn" => channelArn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function create_stream_key(
    channelArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/CreateStreamKey",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelArn" => channelArn), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_channel(arn)
    delete_channel(arn, params::Dict{String,<:Any})

Deletes the specified channel and its associated stream keys. If you try to delete a live
channel, you will get an error (409 ConflictException). To delete a channel that is live,
call StopStream, wait for the Amazon EventBridge \"Stream End\" event (to verify that the
stream's state was changed from Live to Offline), then call DeleteChannel. (See  Using
EventBridge with Amazon IVS.)

# Arguments
- `arn`: ARN of the channel to be deleted.

"""
function delete_channel(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/DeleteChannel",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_channel(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/DeleteChannel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_playback_key_pair(arn)
    delete_playback_key_pair(arn, params::Dict{String,<:Any})

Deletes a specified authorization key pair. This invalidates future viewer tokens generated
using the key pair’s privateKey. For more information, see Setting Up Private Channels in
the Amazon IVS User Guide.

# Arguments
- `arn`: ARN of the key pair to be deleted.

"""
function delete_playback_key_pair(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/DeletePlaybackKeyPair",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_playback_key_pair(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/DeletePlaybackKeyPair",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_recording_configuration(arn)
    delete_recording_configuration(arn, params::Dict{String,<:Any})

Deletes the recording configuration for the specified ARN. If you try to delete a recording
configuration that is associated with a channel, you will get an error (409
ConflictException). To avoid this, for all channels that reference the recording
configuration, first use UpdateChannel to set the recordingConfigurationArn field to an
empty string, then use DeleteRecordingConfiguration.

# Arguments
- `arn`: ARN of the recording configuration to be deleted.

"""
function delete_recording_configuration(
    arn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/DeleteRecordingConfiguration",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_recording_configuration(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/DeleteRecordingConfiguration",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    delete_stream_key(arn)
    delete_stream_key(arn, params::Dict{String,<:Any})

Deletes the stream key for the specified ARN, so it can no longer be used to stream.

# Arguments
- `arn`: ARN of the stream key to be deleted.

"""
function delete_stream_key(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/DeleteStreamKey",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function delete_stream_key(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/DeleteStreamKey",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_channel(arn)
    get_channel(arn, params::Dict{String,<:Any})

Gets the channel configuration for the specified channel ARN. See also BatchGetChannel.

# Arguments
- `arn`: ARN of the channel for which the configuration is to be retrieved.

"""
function get_channel(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/GetChannel",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_channel(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/GetChannel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_playback_key_pair(arn)
    get_playback_key_pair(arn, params::Dict{String,<:Any})

Gets a specified playback authorization key pair and returns the arn and fingerprint. The
privateKey held by the caller can be used to generate viewer authorization tokens, to grant
viewers access to private channels. For more information, see Setting Up Private Channels
in the Amazon IVS User Guide.

# Arguments
- `arn`: ARN of the key pair to be returned.

"""
function get_playback_key_pair(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/GetPlaybackKeyPair",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_playback_key_pair(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/GetPlaybackKeyPair",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_recording_configuration(arn)
    get_recording_configuration(arn, params::Dict{String,<:Any})

Gets the recording configuration for the specified ARN.

# Arguments
- `arn`: ARN of the recording configuration to be retrieved.

"""
function get_recording_configuration(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/GetRecordingConfiguration",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_recording_configuration(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/GetRecordingConfiguration",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_stream(channel_arn)
    get_stream(channel_arn, params::Dict{String,<:Any})

Gets information about the active (live) stream on a specified channel.

# Arguments
- `channel_arn`: Channel ARN for stream to be accessed.

"""
function get_stream(channelArn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/GetStream",
        Dict{String,Any}("channelArn" => channelArn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_stream(
    channelArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/GetStream",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelArn" => channelArn), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    get_stream_key(arn)
    get_stream_key(arn, params::Dict{String,<:Any})

Gets stream-key information for a specified ARN.

# Arguments
- `arn`: ARN for the stream key to be retrieved.

"""
function get_stream_key(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/GetStreamKey",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function get_stream_key(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/GetStreamKey",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    import_playback_key_pair(public_key_material)
    import_playback_key_pair(public_key_material, params::Dict{String,<:Any})

Imports the public portion of a new key pair and returns its arn and fingerprint. The
privateKey can then be used to generate viewer authorization tokens, to grant viewers
access to private channels. For more information, see Setting Up Private Channels in the
Amazon IVS User Guide.

# Arguments
- `public_key_material`: The public portion of a customer-generated key pair.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"name"`: An arbitrary string (a nickname) assigned to a playback key pair that helps the
  customer identify that resource. The value does not need to be unique.
- `"tags"`: Any tags provided with the request are added to the playback key pair tags.
"""
function import_playback_key_pair(
    publicKeyMaterial; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/ImportPlaybackKeyPair",
        Dict{String,Any}("publicKeyMaterial" => publicKeyMaterial);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function import_playback_key_pair(
    publicKeyMaterial,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/ImportPlaybackKeyPair",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("publicKeyMaterial" => publicKeyMaterial), params
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_channels()
    list_channels(params::Dict{String,<:Any})

Gets summary information about all channels in your account, in the AWS region where the
API request is processed. This list can be filtered to match a specified name or
recording-configuration ARN. Filters are mutually exclusive and cannot be used together. If
you try to use both filters, you will get an error (409 ConflictException).

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filterByName"`: Filters the channel list to match the specified name.
- `"filterByRecordingConfigurationArn"`: Filters the channel list to match the specified
  recording-configuration ARN.
- `"maxResults"`: Maximum number of channels to return. Default: 50.
- `"nextToken"`: The first channel to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_channels(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs("POST", "/ListChannels"; aws_config=aws_config, features=SERVICE_FEATURES)
end
function list_channels(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST", "/ListChannels", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    list_playback_key_pairs()
    list_playback_key_pairs(params::Dict{String,<:Any})

Gets summary information about playback key pairs. For more information, see Setting Up
Private Channels in the Amazon IVS User Guide.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The first key pair to retrieve. This is used for pagination; see the
  nextToken response field. Default: 50.
- `"nextToken"`: Maximum number of key pairs to return.
"""
function list_playback_key_pairs(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST", "/ListPlaybackKeyPairs"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function list_playback_key_pairs(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/ListPlaybackKeyPairs",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_recording_configurations()
    list_recording_configurations(params::Dict{String,<:Any})

Gets summary information about all recording configurations in your account, in the AWS
region where the API request is processed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of recording configurations to return. Default: 50.
- `"nextToken"`: The first recording configuration to retrieve. This is used for
  pagination; see the nextToken response field.
"""
function list_recording_configurations(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/ListRecordingConfigurations";
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function list_recording_configurations(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/ListRecordingConfigurations",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_stream_keys(channel_arn)
    list_stream_keys(channel_arn, params::Dict{String,<:Any})

Gets summary information about stream keys for the specified channel.

# Arguments
- `channel_arn`: Channel ARN used to filter the list.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of streamKeys to return. Default: 50.
- `"nextToken"`: The first stream key to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_stream_keys(channelArn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/ListStreamKeys",
        Dict{String,Any}("channelArn" => channelArn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function list_stream_keys(
    channelArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/ListStreamKeys",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelArn" => channelArn), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    list_streams()
    list_streams(params::Dict{String,<:Any})

Gets summary information about live streams in your account, in the AWS region where the
API request is processed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of streams to return. Default: 50.
- `"nextToken"`: The first stream to retrieve. This is used for pagination; see the
  nextToken response field.
"""
function list_streams(; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs("POST", "/ListStreams"; aws_config=aws_config, features=SERVICE_FEATURES)
end
function list_streams(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST", "/ListStreams", params; aws_config=aws_config, features=SERVICE_FEATURES
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Gets information about AWS tags for the specified ARN.

# Arguments
- `resource_arn`: The ARN of the resource to be retrieved.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: Maximum number of tags to return. Default: 50.
- `"nextToken"`: The first tag to retrieve. This is used for pagination; see the nextToken
  response field.
"""
function list_tags_for_resource(
    resourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "GET", "/tags/$(resourceArn)"; aws_config=aws_config, features=SERVICE_FEATURES
    )
end
function list_tags_for_resource(
    resourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "GET",
        "/tags/$(resourceArn)",
        params;
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    put_metadata(channel_arn, metadata)
    put_metadata(channel_arn, metadata, params::Dict{String,<:Any})

Inserts metadata into the active stream of the specified channel. A maximum of 5 requests
per second per channel is allowed, each with a maximum 1 KB payload. (If 5 TPS is not
sufficient for your needs, we recommend batching your data into a single PutMetadata call.)
Also see Embedding Metadata within a Video Stream in the Amazon IVS User Guide.

# Arguments
- `channel_arn`: ARN of the channel into which metadata is inserted. This channel must have
  an active stream.
- `metadata`: Metadata to insert into the stream. Maximum: 1 KB per request.

"""
function put_metadata(
    channelArn, metadata; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/PutMetadata",
        Dict{String,Any}("channelArn" => channelArn, "metadata" => metadata);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function put_metadata(
    channelArn,
    metadata,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/PutMetadata",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("channelArn" => channelArn, "metadata" => metadata),
                params,
            ),
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    stop_stream(channel_arn)
    stop_stream(channel_arn, params::Dict{String,<:Any})

Disconnects the incoming RTMPS stream for the specified channel. Can be used in conjunction
with DeleteStreamKey to prevent further streaming to a channel.  Many streaming
client-software libraries automatically reconnect a dropped RTMPS session, so to stop the
stream permanently, you may want to first revoke the streamKey attached to the channel.

# Arguments
- `channel_arn`: ARN of the channel for which the stream is to be stopped.

"""
function stop_stream(channelArn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/StopStream",
        Dict{String,Any}("channelArn" => channelArn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function stop_stream(
    channelArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return ivs(
        "POST",
        "/StopStream",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("channelArn" => channelArn), params)
        );
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds or updates tags for the AWS resource with the specified ARN.

# Arguments
- `resource_arn`: ARN of the resource for which tags are to be added or updated.
- `tags`: Array of tags to be added or updated.

"""
function tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
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
    return ivs(
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

Removes tags from the resource with the specified ARN.

# Arguments
- `resource_arn`: ARN of the resource for which tags are to be removed.
- `tag_keys`: Array of tags to be removed.

"""
function untag_resource(
    resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
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
    return ivs(
        "DELETE",
        "/tags/$(resourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end

"""
    update_channel(arn)
    update_channel(arn, params::Dict{String,<:Any})

Updates a channel's configuration. This does not affect an ongoing stream of this channel.
You must stop and restart the stream for the changes to take effect.

# Arguments
- `arn`: ARN of the channel to be updated.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"authorized"`: Whether the channel is private (enabled for playback authorization).
- `"latencyMode"`: Channel latency mode. Use NORMAL to broadcast and deliver live video up
  to Full HD. Use LOW for near-real-time interaction with viewers. (Note: In the Amazon IVS
  console, LOW and NORMAL correspond to Ultra-low and Standard, respectively.)
- `"name"`: Channel name.
- `"recordingConfigurationArn"`: Recording-configuration ARN. If this is set to an empty
  string, recording is disabled. A value other than an empty string indicates that recording
  is enabled
- `"type"`: Channel type, which determines the allowable resolution and bitrate. If you
  exceed the allowable resolution or bitrate, the stream probably will disconnect
  immediately. Valid values:    STANDARD: Multiple qualities are generated from the original
  input, to automatically give viewers the best experience for their devices and network
  conditions. Vertical resolution can be up to 1080 and bitrate can be up to 8.5 Mbps.
  BASIC: Amazon IVS delivers the original input to viewers. The viewer’s video-quality
  choice is limited to the original input. Vertical resolution can be up to 480 and bitrate
  can be up to 1.5 Mbps.
"""
function update_channel(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return ivs(
        "POST",
        "/UpdateChannel",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
function update_channel(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return ivs(
        "POST",
        "/UpdateChannel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        features=SERVICE_FEATURES,
    )
end
