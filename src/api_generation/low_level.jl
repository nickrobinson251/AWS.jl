"""
Generate the low-level `src/AWSServices.jl` file with all definitions.
"""
function _generate_low_level_wrappers(
    services::AbstractArray, repo_name::String, auth::GitHub.OAuth2
)
    service_definitions = sort(_generate_low_level_definitions(services, repo_name, auth))

    template = """
    # This file is auto-generated by AWSMetadata.jl

    module AWSServices

    using AWS
    using OrderedCollections: LittleDict

    $(join(service_definitions, "\n"))

    end
    """

    open(services_path, "w") do f
        print(f, template)
    end

    return template
end

"""
Get the low-level definitions for all AWS Services.
"""
function _generate_low_level_definitions(
    services::AbstractArray, repo_name::String, auth::GitHub.OAuth2
)
    service_definitions = String[]

    for service in services
        service_name = service["path"]
        @info "Generating low level wrapper for $service_name"

        # Get the contents of the ${Service}.normal.json file
        service_blob = blob(repo_name, service["sha"]; auth=auth)
        service = JSON.parse(String(base64decode(service_blob.content)))
        service_metadata = service["metadata"]

        definition = _generate_low_level_definition(service_metadata)
        push!(service_definitions, definition)
    end

    return service_definitions
end

"""
Get the low-level definition for an AWS Service.
"""
function _generate_low_level_definition(service::AbstractDict)
    protocol = service["protocol"]
    endpoint_prefix = service["endpointPrefix"]
    signing_name =
        haskey(service, "signingName") ? service["signingName"] : service["endpointPrefix"]
    service_id = replace(lowercase(service["serviceId"]), ' ' => '_')
    api_version = service["apiVersion"]

    service_specifics = LittleDict{String,String}()

    if service_id == "glacier"
        service_specifics[service_id] = "LittleDict(\"x-amz-glacier-version\" => \"$(service["apiVersion"])\")"
    end

    if protocol == "rest-xml"
        return "const $service_id = AWS.RestXMLService(\"$signing_name\", \"$endpoint_prefix\", \"$api_version\")"
    elseif protocol in ("ec2", "query")
        return "const $service_id = AWS.QueryService(\"$signing_name\", \"$endpoint_prefix\", \"$api_version\")"
    elseif protocol == "rest-json" && haskey(service_specifics, service_id)
        return "const $service_id = AWS.RestJSONService(\"$signing_name\", \"$endpoint_prefix\", \"$api_version\", $(service_specifics[service_id]))"
    elseif protocol == "rest-json"
        return "const $service_id = AWS.RestJSONService(\"$signing_name\", \"$endpoint_prefix\", \"$api_version\")"
    elseif protocol == "json"
        json_version = service["jsonVersion"]
        target = service["targetPrefix"]
        return "const $service_id = AWS.JSONService(\"$signing_name\", \"$endpoint_prefix\", \"$api_version\", \"$json_version\", \"$target\")"
    else
        throw(
            ProtocolNotDefined(
                "$service_id is using a new protocol; $protocol which is not supported."
            ),
        )
    end
end
