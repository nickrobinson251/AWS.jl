# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: mq

using Compat
using UUIDs
"""
    CreateBroker()

Creates a broker. Note: This API is asynchronous.

# Optional Parameters
- `authenticationStrategy`: The authentication strategy used to secure the broker.
- `autoMinorVersionUpgrade`: Required. Enables automatic upgrades to new minor versions for brokers, as Apache releases the versions. The automatic upgrades occur during the maintenance window of the broker or after a manual broker reboot.
- `brokerName`: Required. The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters.
- `configuration`: A list of information about the configuration.
- `creatorRequestId`: The unique ID that the requester receives for the created broker. Amazon MQ passes your ID with the API action. Note: We recommend using a Universally Unique Identifier (UUID) for the creatorRequestId. You may omit the creatorRequestId if your application doesn't require idempotency.
- `deploymentMode`: Required. The deployment mode of the broker.
- `encryptionOptions`: Encryption options for the broker.
- `engineType`: Required. The type of broker engine. Note: Currently, Amazon MQ supports only ACTIVEMQ.
- `engineVersion`: Required. The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
- `hostInstanceType`: Required. The broker's instance type.
- `ldapServerMetadata`: The metadata of the LDAP server used to authenticate and authorize connections to the broker.
- `logs`: Enables Amazon CloudWatch logging for brokers.
- `maintenanceWindowStartTime`: The parameters that determine the WeeklyStartTime.
- `publiclyAccessible`: Required. Enables connections from applications outside of the VPC that hosts the broker's subnets.
- `securityGroups`: The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers.
- `storageType`: The broker's storage type.
- `subnetIds`: The list of groups (2 maximum) that define which subnets and IP ranges the broker can use from different Availability Zones. A SINGLE_INSTANCE deployment requires one subnet (for example, the default subnet). An ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.
- `tags`: Create tags when creating the broker.
- `users`: Required. The list of ActiveMQ users (persons or applications) who can access queues and topics. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
"""

create_broker(; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers", Dict{String, Any}("creatorRequestId"=>string(uuid4())); aws_config=aws_config)
create_broker(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("creatorRequestId"=>string(uuid4())), args)); aws_config=aws_config)

"""
    CreateConfiguration()

Creates a new configuration for the specified configuration name. Amazon MQ uses the default configuration (the engine type and version).

# Optional Parameters
- `authenticationStrategy`: The authentication strategy associated with the configuration.
- `engineType`: Required. The type of broker engine. Note: Currently, Amazon MQ supports only ACTIVEMQ.
- `engineVersion`: Required. The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
- `name`: Required. The name of the configuration. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150 characters long.
- `tags`: Create tags when creating the configuration.
"""

create_configuration(; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/configurations"; aws_config=aws_config)
create_configuration(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/configurations", args; aws_config=aws_config)

"""
    CreateTags()

Add a tag to a resource.

# Required Parameters
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.

# Optional Parameters
- `tags`: The key-value pair for the resource tag.
"""

create_tags(resource_arn; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/tags/$(resource-arn)"; aws_config=aws_config)
create_tags(resource_arn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/tags/$(resource-arn)", args; aws_config=aws_config)

"""
    CreateUser()

Creates an ActiveMQ user.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.

# Optional Parameters
- `consoleAccess`: Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
- `groups`: The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
- `password`: Required. The password of the user. This value must be at least 12 characters long, must contain at least 4 unique characters, and must not contain commas.
"""

create_user(broker_id, username; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers/$(broker-id)/users/$(username)"; aws_config=aws_config)
create_user(broker_id, username, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers/$(broker-id)/users/$(username)", args; aws_config=aws_config)

"""
    DeleteBroker()

Deletes a broker. Note: This API is asynchronous.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

"""

delete_broker(broker_id; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/brokers/$(broker-id)"; aws_config=aws_config)
delete_broker(broker_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/brokers/$(broker-id)", args; aws_config=aws_config)

"""
    DeleteTags()

Removes a tag from a resource.

# Required Parameters
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.
- `tagKeys`: An array of tag keys to delete

"""

delete_tags(resource_arn, tagKeys; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/tags/$(resource-arn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
delete_tags(resource_arn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/tags/$(resource-arn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    DeleteUser()

Deletes an ActiveMQ user.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.

"""

delete_user(broker_id, username; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/brokers/$(broker-id)/users/$(username)"; aws_config=aws_config)
delete_user(broker_id, username, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("DELETE", "/v1/brokers/$(broker-id)/users/$(username)", args; aws_config=aws_config)

"""
    DescribeBroker()

Returns information about the specified broker.

# Required Parameters
- `broker-id`: The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters.

"""

describe_broker(broker_id; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)"; aws_config=aws_config)
describe_broker(broker_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)", args; aws_config=aws_config)

"""
    DescribeBrokerEngineTypes()

Describe available engine types and versions.

# Optional Parameters
- `engineType`: Filter response by engine type.
- `maxResults`: The maximum number of engine types that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
"""

describe_broker_engine_types(; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/broker-engine-types"; aws_config=aws_config)
describe_broker_engine_types(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/broker-engine-types", args; aws_config=aws_config)

"""
    DescribeBrokerInstanceOptions()

Describe available broker instance options.

# Optional Parameters
- `engineType`: Filter response by engine type.
- `hostInstanceType`: Filter response by host instance type.
- `maxResults`: The maximum number of instance options that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
- `storageType`: Filter response by storage type.
"""

describe_broker_instance_options(; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/broker-instance-options"; aws_config=aws_config)
describe_broker_instance_options(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/broker-instance-options", args; aws_config=aws_config)

"""
    DescribeConfiguration()

Returns information about the specified configuration.

# Required Parameters
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.

"""

describe_configuration(configuration_id; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)"; aws_config=aws_config)
describe_configuration(configuration_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)", args; aws_config=aws_config)

"""
    DescribeConfigurationRevision()

Returns the specified configuration revision for the specified configuration.

# Required Parameters
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.
- `configuration-revision`: The revision of the configuration.

"""

describe_configuration_revision(configuration_id, configuration_revision; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)/revisions/$(configuration-revision)"; aws_config=aws_config)
describe_configuration_revision(configuration_id, configuration_revision, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)/revisions/$(configuration-revision)", args; aws_config=aws_config)

"""
    DescribeUser()

Returns information about an ActiveMQ user.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.

"""

describe_user(broker_id, username; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)/users/$(username)"; aws_config=aws_config)
describe_user(broker_id, username, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)/users/$(username)", args; aws_config=aws_config)

"""
    ListBrokers()

Returns a list of all brokers.

# Optional Parameters
- `maxResults`: The maximum number of brokers that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
"""

list_brokers(; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers"; aws_config=aws_config)
list_brokers(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers", args; aws_config=aws_config)

"""
    ListConfigurationRevisions()

Returns a list of all revisions for the specified configuration.

# Required Parameters
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.

# Optional Parameters
- `maxResults`: The maximum number of configurations that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
"""

list_configuration_revisions(configuration_id; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)/revisions"; aws_config=aws_config)
list_configuration_revisions(configuration_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations/$(configuration-id)/revisions", args; aws_config=aws_config)

"""
    ListConfigurations()

Returns a list of all configurations.

# Optional Parameters
- `maxResults`: The maximum number of configurations that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
"""

list_configurations(; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations"; aws_config=aws_config)
list_configurations(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/configurations", args; aws_config=aws_config)

"""
    ListTags()

Lists tags for a resource.

# Required Parameters
- `resource-arn`: The Amazon Resource Name (ARN) of the resource tag.

"""

list_tags(resource_arn; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/tags/$(resource-arn)"; aws_config=aws_config)
list_tags(resource_arn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/tags/$(resource-arn)", args; aws_config=aws_config)

"""
    ListUsers()

Returns a list of all ActiveMQ users.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

# Optional Parameters
- `maxResults`: The maximum number of ActiveMQ users that can be returned per page (20 by default). This value must be an integer from 5 to 100.
- `nextToken`: The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.
"""

list_users(broker_id; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)/users"; aws_config=aws_config)
list_users(broker_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("GET", "/v1/brokers/$(broker-id)/users", args; aws_config=aws_config)

"""
    RebootBroker()

Reboots a broker. Note: This API is asynchronous.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

"""

reboot_broker(broker_id; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers/$(broker-id)/reboot"; aws_config=aws_config)
reboot_broker(broker_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("POST", "/v1/brokers/$(broker-id)/reboot", args; aws_config=aws_config)

"""
    UpdateBroker()

Adds a pending configuration change to a broker.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.

# Optional Parameters
- `authenticationStrategy`: The authentication strategy used to secure the broker.
- `autoMinorVersionUpgrade`: Enables automatic upgrades to new minor versions for brokers, as Apache releases the versions. The automatic upgrades occur during the maintenance window of the broker or after a manual broker reboot.
- `configuration`: A list of information about the configuration.
- `engineVersion`: The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html
- `hostInstanceType`: The host instance type of the broker to upgrade to. For a list of supported instance types, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types
- `ldapServerMetadata`: The metadata of the LDAP server used to authenticate and authorize connections to the broker.
- `logs`: Enables Amazon CloudWatch logging for brokers.
- `securityGroups`: The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers.
"""

update_broker(broker_id; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/brokers/$(broker-id)"; aws_config=aws_config)
update_broker(broker_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/brokers/$(broker-id)", args; aws_config=aws_config)

"""
    UpdateConfiguration()

Updates the specified configuration.

# Required Parameters
- `configuration-id`: The unique ID that Amazon MQ generates for the configuration.

# Optional Parameters
- `data`: Required. The base64-encoded XML configuration.
- `description`: The description of the configuration.
"""

update_configuration(configuration_id; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/configurations/$(configuration-id)"; aws_config=aws_config)
update_configuration(configuration_id, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/configurations/$(configuration-id)", args; aws_config=aws_config)

"""
    UpdateUser()

Updates the information for an ActiveMQ user.

# Required Parameters
- `broker-id`: The unique ID that Amazon MQ generates for the broker.
- `username`: Required. The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.

# Optional Parameters
- `consoleAccess`: Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
- `groups`: The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
- `password`: The password of the user. This value must be at least 12 characters long, must contain at least 4 unique characters, and must not contain commas.
"""

update_user(broker_id, username; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/brokers/$(broker-id)/users/$(username)"; aws_config=aws_config)
update_user(broker_id, username, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = mq("PUT", "/v1/brokers/$(broker-id)/users/$(username)", args; aws_config=aws_config)
