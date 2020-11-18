# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: fms
using AWS.Compat
using AWS.UUIDs

"""
    AssociateAdminAccount()

Sets the AWS Firewall Manager administrator account. AWS Firewall Manager must be associated with the master account of your AWS organization or associated with a member account that has the appropriate permissions. If the account ID that you submit is not an AWS Organizations master account, AWS Firewall Manager will set the appropriate permissions for the given member account. The account that you associate with AWS Firewall Manager is called the AWS Firewall Manager administrator account. 

# Required Parameters
- `AdminAccount`: The AWS account ID to associate with AWS Firewall Manager as the AWS Firewall Manager administrator account. This can be an AWS Organizations master account or a member account. For more information about AWS Organizations and master accounts, see Managing the AWS Accounts in Your Organization. 

"""
associate_admin_account(AdminAccount; aws_config::AWSConfig=global_aws_config()) = fms("AssociateAdminAccount", Dict{String, Any}("AdminAccount"=>AdminAccount); aws_config=aws_config)
associate_admin_account(AdminAccount, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("AssociateAdminAccount", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AdminAccount"=>AdminAccount), args)); aws_config=aws_config)

"""
    DeleteAppsList()

Permanently deletes an AWS Firewall Manager applications list.

# Required Parameters
- `ListId`: The ID of the applications list that you want to delete. You can retrieve this ID from PutAppsList, ListAppsLists, and GetAppsList.

"""
delete_apps_list(ListId; aws_config::AWSConfig=global_aws_config()) = fms("DeleteAppsList", Dict{String, Any}("ListId"=>ListId); aws_config=aws_config)
delete_apps_list(ListId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("DeleteAppsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ListId"=>ListId), args)); aws_config=aws_config)

"""
    DeleteNotificationChannel()

Deletes an AWS Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.

"""
delete_notification_channel(; aws_config::AWSConfig=global_aws_config()) = fms("DeleteNotificationChannel"; aws_config=aws_config)
delete_notification_channel(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("DeleteNotificationChannel", args; aws_config=aws_config)

"""
    DeletePolicy()

Permanently deletes an AWS Firewall Manager policy. 

# Required Parameters
- `PolicyId`: The ID of the policy that you want to delete. You can retrieve this ID from PutPolicy and ListPolicies.

# Optional Parameters
- `DeleteAllPolicyResources`: If True, the request performs cleanup according to the policy type.  For AWS WAF and Shield Advanced policies, the cleanup does the following:   Deletes rule groups created by AWS Firewall Manager   Removes web ACLs from in-scope resources   Deletes web ACLs that contain no rules or rule groups   For security group policies, the cleanup does the following for each security group in the policy:   Disassociates the security group from in-scope resources    Deletes the security group if it was created through Firewall Manager and if it's no longer associated with any resources through another policy   After the cleanup, in-scope resources are no longer protected by web ACLs in this policy. Protection of out-of-scope resources remains unchanged. Scope is determined by tags that you create and accounts that you associate with the policy. When creating the policy, if you specify that only resources in specific accounts or with specific tags are in scope of the policy, those accounts and resources are handled by the policy. All others are out of scope. If you don't specify tags or accounts, all resources are in scope. 
"""
delete_policy(PolicyId; aws_config::AWSConfig=global_aws_config()) = fms("DeletePolicy", Dict{String, Any}("PolicyId"=>PolicyId); aws_config=aws_config)
delete_policy(PolicyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("DeletePolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PolicyId"=>PolicyId), args)); aws_config=aws_config)

"""
    DeleteProtocolsList()

Permanently deletes an AWS Firewall Manager protocols list.

# Required Parameters
- `ListId`: The ID of the protocols list that you want to delete. You can retrieve this ID from PutProtocolsList, ListProtocolsLists, and GetProtocolsLost.

"""
delete_protocols_list(ListId; aws_config::AWSConfig=global_aws_config()) = fms("DeleteProtocolsList", Dict{String, Any}("ListId"=>ListId); aws_config=aws_config)
delete_protocols_list(ListId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("DeleteProtocolsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ListId"=>ListId), args)); aws_config=aws_config)

"""
    DisassociateAdminAccount()

Disassociates the account that has been set as the AWS Firewall Manager administrator account. To set a different account as the administrator account, you must submit an AssociateAdminAccount request.

"""
disassociate_admin_account(; aws_config::AWSConfig=global_aws_config()) = fms("DisassociateAdminAccount"; aws_config=aws_config)
disassociate_admin_account(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("DisassociateAdminAccount", args; aws_config=aws_config)

"""
    GetAdminAccount()

Returns the AWS Organizations master account that is associated with AWS Firewall Manager as the AWS Firewall Manager administrator.

"""
get_admin_account(; aws_config::AWSConfig=global_aws_config()) = fms("GetAdminAccount"; aws_config=aws_config)
get_admin_account(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetAdminAccount", args; aws_config=aws_config)

"""
    GetAppsList()

Returns information about the specified AWS Firewall Manager applications list.

# Required Parameters
- `ListId`: The ID of the AWS Firewall Manager applications list that you want the details for.

# Optional Parameters
- `DefaultList`: Specifies whether the list to retrieve is a default list owned by AWS Firewall Manager.
"""
get_apps_list(ListId; aws_config::AWSConfig=global_aws_config()) = fms("GetAppsList", Dict{String, Any}("ListId"=>ListId); aws_config=aws_config)
get_apps_list(ListId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetAppsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ListId"=>ListId), args)); aws_config=aws_config)

"""
    GetComplianceDetail()

Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. Resources are considered noncompliant for AWS WAF and Shield Advanced policies if the specified policy has not been applied to them. Resources are considered noncompliant for security group policies if they are in scope of the policy, they violate one or more of the policy rules, and remediation is disabled or not possible. Resources are considered noncompliant for Network Firewall policies if a firewall is missing in the VPC, if the firewall endpoint isn't set up in an expected Availability Zone and subnet, if a subnet created by the Firewall Manager doesn't have the expected route table, and for modifications to a firewall policy that violate the Firewall Manager policy's rules. 

# Required Parameters
- `MemberAccount`: The AWS account that owns the resources that you want to get the details for.
- `PolicyId`: The ID of the policy that you want to get the details for. PolicyId is returned by PutPolicy and by ListPolicies.

"""
get_compliance_detail(MemberAccount, PolicyId; aws_config::AWSConfig=global_aws_config()) = fms("GetComplianceDetail", Dict{String, Any}("MemberAccount"=>MemberAccount, "PolicyId"=>PolicyId); aws_config=aws_config)
get_compliance_detail(MemberAccount, PolicyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetComplianceDetail", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("MemberAccount"=>MemberAccount, "PolicyId"=>PolicyId), args)); aws_config=aws_config)

"""
    GetNotificationChannel()

Information about the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.

"""
get_notification_channel(; aws_config::AWSConfig=global_aws_config()) = fms("GetNotificationChannel"; aws_config=aws_config)
get_notification_channel(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetNotificationChannel", args; aws_config=aws_config)

"""
    GetPolicy()

Returns information about the specified AWS Firewall Manager policy.

# Required Parameters
- `PolicyId`: The ID of the AWS Firewall Manager policy that you want the details for.

"""
get_policy(PolicyId; aws_config::AWSConfig=global_aws_config()) = fms("GetPolicy", Dict{String, Any}("PolicyId"=>PolicyId); aws_config=aws_config)
get_policy(PolicyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PolicyId"=>PolicyId), args)); aws_config=aws_config)

"""
    GetProtectionStatus()

If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.

# Required Parameters
- `PolicyId`: The ID of the policy for which you want to get the attack information.

# Optional Parameters
- `EndTime`: The end of the time period to query for the attacks. This is a timestamp type. The request syntax listing indicates a number type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid timestamp format is allowed.
- `MaxResults`: Specifies the number of objects that you want AWS Firewall Manager to return for this request. If you have more objects than the number that you specify for MaxResults, the response includes a NextToken value that you can use to get another batch of objects.
- `MemberAccountId`: The AWS account that is in scope of the policy that you want to get the details for.
- `NextToken`: If you specify a value for MaxResults and you have more objects than the number that you specify for MaxResults, AWS Firewall Manager returns a NextToken value in the response, which you can use to retrieve another group of objects. For the second and subsequent GetProtectionStatus requests, specify the value of NextToken from the previous response to get information about another batch of objects.
- `StartTime`: The start of the time period to query for the attacks. This is a timestamp type. The request syntax listing indicates a number type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid timestamp format is allowed.
"""
get_protection_status(PolicyId; aws_config::AWSConfig=global_aws_config()) = fms("GetProtectionStatus", Dict{String, Any}("PolicyId"=>PolicyId); aws_config=aws_config)
get_protection_status(PolicyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetProtectionStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PolicyId"=>PolicyId), args)); aws_config=aws_config)

"""
    GetProtocolsList()

Returns information about the specified AWS Firewall Manager protocols list.

# Required Parameters
- `ListId`: The ID of the AWS Firewall Manager protocols list that you want the details for.

# Optional Parameters
- `DefaultList`: Specifies whether the list to retrieve is a default list owned by AWS Firewall Manager.
"""
get_protocols_list(ListId; aws_config::AWSConfig=global_aws_config()) = fms("GetProtocolsList", Dict{String, Any}("ListId"=>ListId); aws_config=aws_config)
get_protocols_list(ListId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetProtocolsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ListId"=>ListId), args)); aws_config=aws_config)

"""
    GetViolationDetails()

Retrieves violations for a resource based on the specified AWS Firewall Manager policy and AWS account.

# Required Parameters
- `MemberAccount`: The AWS account ID that you want the details for.
- `PolicyId`: The ID of the AWS Firewall Manager policy that you want the details for. This currently only supports security group content audit policies.
- `ResourceId`: The ID of the resource that has violations.
- `ResourceType`: The resource type. This is in the format shown in the AWS Resource Types Reference. Supported resource types are: AWS::EC2::Instance, AWS::EC2::NetworkInterface, AWS::EC2::SecurityGroup, AWS::NetworkFirewall::FirewallPolicy, and AWS::EC2::Subnet. 

"""
get_violation_details(MemberAccount, PolicyId, ResourceId, ResourceType; aws_config::AWSConfig=global_aws_config()) = fms("GetViolationDetails", Dict{String, Any}("MemberAccount"=>MemberAccount, "PolicyId"=>PolicyId, "ResourceId"=>ResourceId, "ResourceType"=>ResourceType); aws_config=aws_config)
get_violation_details(MemberAccount, PolicyId, ResourceId, ResourceType, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("GetViolationDetails", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("MemberAccount"=>MemberAccount, "PolicyId"=>PolicyId, "ResourceId"=>ResourceId, "ResourceType"=>ResourceType), args)); aws_config=aws_config)

"""
    ListAppsLists()

Returns an array of AppsListDataSummary objects.

# Required Parameters
- `MaxResults`: The maximum number of objects that you want AWS Firewall Manager to return for this request. If more objects are available, in the response, AWS Firewall Manager provides a NextToken value that you can use in a subsequent call to get the next batch of objects. If you don't specify this, AWS Firewall Manager returns all available objects.

# Optional Parameters
- `DefaultLists`: Specifies whether the lists to retrieve are default lists owned by AWS Firewall Manager.
- `NextToken`: If you specify a value for MaxResults in your list request, and you have more objects than the maximum, AWS Firewall Manager returns this token in the response. For all but the first request, you provide the token returned by the prior request in the request parameters, to retrieve the next batch of objects.
"""
list_apps_lists(MaxResults; aws_config::AWSConfig=global_aws_config()) = fms("ListAppsLists", Dict{String, Any}("MaxResults"=>MaxResults); aws_config=aws_config)
list_apps_lists(MaxResults, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListAppsLists", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("MaxResults"=>MaxResults), args)); aws_config=aws_config)

"""
    ListComplianceStatus()

Returns an array of PolicyComplianceStatus objects. Use PolicyComplianceStatus to get a summary of which member accounts are protected by the specified policy. 

# Required Parameters
- `PolicyId`: The ID of the AWS Firewall Manager policy that you want the details for.

# Optional Parameters
- `MaxResults`: Specifies the number of PolicyComplianceStatus objects that you want AWS Firewall Manager to return for this request. If you have more PolicyComplianceStatus objects than the number that you specify for MaxResults, the response includes a NextToken value that you can use to get another batch of PolicyComplianceStatus objects.
- `NextToken`: If you specify a value for MaxResults and you have more PolicyComplianceStatus objects than the number that you specify for MaxResults, AWS Firewall Manager returns a NextToken value in the response that allows you to list another group of PolicyComplianceStatus objects. For the second and subsequent ListComplianceStatus requests, specify the value of NextToken from the previous response to get information about another batch of PolicyComplianceStatus objects.
"""
list_compliance_status(PolicyId; aws_config::AWSConfig=global_aws_config()) = fms("ListComplianceStatus", Dict{String, Any}("PolicyId"=>PolicyId); aws_config=aws_config)
list_compliance_status(PolicyId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListComplianceStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PolicyId"=>PolicyId), args)); aws_config=aws_config)

"""
    ListMemberAccounts()

Returns a MemberAccounts object that lists the member accounts in the administrator's AWS organization. The ListMemberAccounts must be submitted by the account that is set as the AWS Firewall Manager administrator.

# Optional Parameters
- `MaxResults`: Specifies the number of member account IDs that you want AWS Firewall Manager to return for this request. If you have more IDs than the number that you specify for MaxResults, the response includes a NextToken value that you can use to get another batch of member account IDs.
- `NextToken`: If you specify a value for MaxResults and you have more account IDs than the number that you specify for MaxResults, AWS Firewall Manager returns a NextToken value in the response that allows you to list another group of IDs. For the second and subsequent ListMemberAccountsRequest requests, specify the value of NextToken from the previous response to get information about another batch of member account IDs.
"""
list_member_accounts(; aws_config::AWSConfig=global_aws_config()) = fms("ListMemberAccounts"; aws_config=aws_config)
list_member_accounts(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListMemberAccounts", args; aws_config=aws_config)

"""
    ListPolicies()

Returns an array of PolicySummary objects.

# Optional Parameters
- `MaxResults`: Specifies the number of PolicySummary objects that you want AWS Firewall Manager to return for this request. If you have more PolicySummary objects than the number that you specify for MaxResults, the response includes a NextToken value that you can use to get another batch of PolicySummary objects.
- `NextToken`: If you specify a value for MaxResults and you have more PolicySummary objects than the number that you specify for MaxResults, AWS Firewall Manager returns a NextToken value in the response that allows you to list another group of PolicySummary objects. For the second and subsequent ListPolicies requests, specify the value of NextToken from the previous response to get information about another batch of PolicySummary objects.
"""
list_policies(; aws_config::AWSConfig=global_aws_config()) = fms("ListPolicies"; aws_config=aws_config)
list_policies(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListPolicies", args; aws_config=aws_config)

"""
    ListProtocolsLists()

Returns an array of ProtocolsListDataSummary objects.

# Required Parameters
- `MaxResults`: The maximum number of objects that you want AWS Firewall Manager to return for this request. If more objects are available, in the response, AWS Firewall Manager provides a NextToken value that you can use in a subsequent call to get the next batch of objects. If you don't specify this, AWS Firewall Manager returns all available objects.

# Optional Parameters
- `DefaultLists`: Specifies whether the lists to retrieve are default lists owned by AWS Firewall Manager.
- `NextToken`: If you specify a value for MaxResults in your list request, and you have more objects than the maximum, AWS Firewall Manager returns this token in the response. For all but the first request, you provide the token returned by the prior request in the request parameters, to retrieve the next batch of objects.
"""
list_protocols_lists(MaxResults; aws_config::AWSConfig=global_aws_config()) = fms("ListProtocolsLists", Dict{String, Any}("MaxResults"=>MaxResults); aws_config=aws_config)
list_protocols_lists(MaxResults, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListProtocolsLists", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("MaxResults"=>MaxResults), args)); aws_config=aws_config)

"""
    ListTagsForResource()

Retrieves the list of tags for the specified AWS resource. 

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the resource to return tags for. The AWS Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. 

"""
list_tags_for_resource(ResourceArn; aws_config::AWSConfig=global_aws_config()) = fms("ListTagsForResource", Dict{String, Any}("ResourceArn"=>ResourceArn); aws_config=aws_config)
list_tags_for_resource(ResourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("ListTagsForResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn), args)); aws_config=aws_config)

"""
    PutAppsList()

Creates an AWS Firewall Manager applications list.

# Required Parameters
- `AppsList`: The details of the AWS Firewall Manager applications list to be created.

# Optional Parameters
- `TagList`: The tags associated with the resource.
"""
put_apps_list(AppsList; aws_config::AWSConfig=global_aws_config()) = fms("PutAppsList", Dict{String, Any}("AppsList"=>AppsList); aws_config=aws_config)
put_apps_list(AppsList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("PutAppsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AppsList"=>AppsList), args)); aws_config=aws_config)

"""
    PutNotificationChannel()

Designates the IAM role and Amazon Simple Notification Service (SNS) topic that AWS Firewall Manager uses to record SNS logs. To perform this action outside of the console, you must configure the SNS topic to allow the Firewall Manager role AWSServiceRoleForFMS to publish SNS logs. For more information, see Firewall Manager required permissions for API actions in the AWS Firewall Manager Developer Guide.

# Required Parameters
- `SnsRoleName`: The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to record AWS Firewall Manager activity. 
- `SnsTopicArn`: The Amazon Resource Name (ARN) of the SNS topic that collects notifications from AWS Firewall Manager.

"""
put_notification_channel(SnsRoleName, SnsTopicArn; aws_config::AWSConfig=global_aws_config()) = fms("PutNotificationChannel", Dict{String, Any}("SnsRoleName"=>SnsRoleName, "SnsTopicArn"=>SnsTopicArn); aws_config=aws_config)
put_notification_channel(SnsRoleName, SnsTopicArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("PutNotificationChannel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SnsRoleName"=>SnsRoleName, "SnsTopicArn"=>SnsTopicArn), args)); aws_config=aws_config)

"""
    PutPolicy()

Creates an AWS Firewall Manager policy. Firewall Manager provides the following types of policies:    An AWS WAF policy (type WAFV2), which defines rule groups to run first in the corresponding AWS WAF web ACL and rule groups to run last in the web ACL.   An AWS WAF Classic policy (type WAF), which defines a rule group.    A Shield Advanced policy, which applies Shield Advanced protection to specified accounts and resources.   A security group policy, which manages VPC security groups across your AWS organization.    An AWS Network Firewall policy, which provides firewall rules to filter network traffic in specified Amazon VPCs.   Each policy is specific to one of the types. If you want to enforce more than one policy type across accounts, create multiple policies. You can create multiple policies for each type. You must be subscribed to Shield Advanced to create a Shield Advanced policy. For more information about subscribing to Shield Advanced, see CreateSubscription.

# Required Parameters
- `Policy`: The details of the AWS Firewall Manager policy to be created.

# Optional Parameters
- `TagList`: The tags to add to the AWS resource.
"""
put_policy(Policy; aws_config::AWSConfig=global_aws_config()) = fms("PutPolicy", Dict{String, Any}("Policy"=>Policy); aws_config=aws_config)
put_policy(Policy, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("PutPolicy", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Policy"=>Policy), args)); aws_config=aws_config)

"""
    PutProtocolsList()

Creates an AWS Firewall Manager protocols list.

# Required Parameters
- `ProtocolsList`: The details of the AWS Firewall Manager protocols list to be created.

# Optional Parameters
- `TagList`: The tags associated with the resource.
"""
put_protocols_list(ProtocolsList; aws_config::AWSConfig=global_aws_config()) = fms("PutProtocolsList", Dict{String, Any}("ProtocolsList"=>ProtocolsList); aws_config=aws_config)
put_protocols_list(ProtocolsList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("PutProtocolsList", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ProtocolsList"=>ProtocolsList), args)); aws_config=aws_config)

"""
    TagResource()

Adds one or more tags to an AWS resource.

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the resource to return tags for. The AWS Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. 
- `TagList`: The tags to add to the resource.

"""
tag_resource(ResourceArn, TagList; aws_config::AWSConfig=global_aws_config()) = fms("TagResource", Dict{String, Any}("ResourceArn"=>ResourceArn, "TagList"=>TagList); aws_config=aws_config)
tag_resource(ResourceArn, TagList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "TagList"=>TagList), args)); aws_config=aws_config)

"""
    UntagResource()

Removes one or more tags from an AWS resource.

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the resource to return tags for. The AWS Firewall Manager resources that support tagging are policies, applications lists, and protocols lists. 
- `TagKeys`: The keys of the tags to remove from the resource. 

"""
untag_resource(ResourceArn, TagKeys; aws_config::AWSConfig=global_aws_config()) = fms("UntagResource", Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys); aws_config=aws_config)
untag_resource(ResourceArn, TagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = fms("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceArn"=>ResourceArn, "TagKeys"=>TagKeys), args)); aws_config=aws_config)
