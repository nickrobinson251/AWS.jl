# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: sagemaker_edge
using AWS.Compat
using AWS.UUIDs

"""
    get_device_registration(device_fleet_name, device_name)
    get_device_registration(device_fleet_name, device_name, params::Dict{String,<:Any})

Use to check if a device is registered with SageMaker Edge Manager.

# Arguments
- `device_fleet_name`: The name of the fleet that the device belongs to.
- `device_name`: The unique name of the device you want to get the registration status from.

"""
function get_device_registration(
    DeviceFleetName, DeviceName; aws_config::AbstractAWSConfig=global_aws_config()
)
    return sagemaker_edge(
        "POST",
        "/GetDeviceRegistration",
        Dict{String,Any}("DeviceFleetName" => DeviceFleetName, "DeviceName" => DeviceName);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_device_registration(
    DeviceFleetName,
    DeviceName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_edge(
        "POST",
        "/GetDeviceRegistration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "DeviceFleetName" => DeviceFleetName, "DeviceName" => DeviceName
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    send_heartbeat(agent_version, device_fleet_name, device_name)
    send_heartbeat(agent_version, device_fleet_name, device_name, params::Dict{String,<:Any})

Use to get the current status of devices registered on SageMaker Edge Manager.

# Arguments
- `agent_version`: Returns the version of the agent.
- `device_fleet_name`: The name of the fleet that the device belongs to.
- `device_name`: The unique name of the device.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AgentMetrics"`: For internal use. Returns a list of SageMaker Edge Manager agent
  operating metrics.
- `"Models"`: Returns a list of models deployed on the the device.
"""
function send_heartbeat(
    AgentVersion,
    DeviceFleetName,
    DeviceName;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_edge(
        "POST",
        "/SendHeartbeat",
        Dict{String,Any}(
            "AgentVersion" => AgentVersion,
            "DeviceFleetName" => DeviceFleetName,
            "DeviceName" => DeviceName,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function send_heartbeat(
    AgentVersion,
    DeviceFleetName,
    DeviceName,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return sagemaker_edge(
        "POST",
        "/SendHeartbeat",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AgentVersion" => AgentVersion,
                    "DeviceFleetName" => DeviceFleetName,
                    "DeviceName" => DeviceName,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
