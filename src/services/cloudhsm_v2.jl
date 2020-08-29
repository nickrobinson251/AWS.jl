# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: cloudhsm_v2

using Compat
using UUIDs
"""
    CopyBackupToRegion()

Copy an AWS CloudHSM cluster backup to a different region.

# Required Parameters
- `BackupId`: The ID of the backup that will be copied to the destination region. 
- `DestinationRegion`: The AWS region that will contain your copied CloudHSM cluster backup.

# Optional Parameters
- `TagList`: Tags to apply to the destination backup during creation. If you specify tags, only these tags will be applied to the destination backup. If you do not specify tags, the service copies tags from the source backup to the destination backup.
"""

copy_backup_to_region(BackupId, DestinationRegion; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CopyBackupToRegion", Dict{String, Any}("BackupId"=>BackupId, "DestinationRegion"=>DestinationRegion); aws_config=aws_config)
copy_backup_to_region(BackupId, DestinationRegion, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CopyBackupToRegion", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BackupId"=>BackupId, "DestinationRegion"=>DestinationRegion), args)); aws_config=aws_config)

"""
    CreateCluster()

Creates a new AWS CloudHSM cluster.

# Required Parameters
- `HsmType`: The type of HSM to use in the cluster. Currently the only allowed value is hsm1.medium.
- `SubnetIds`: The identifiers (IDs) of the subnets where you are creating the cluster. You must specify at least one subnet. If you specify multiple subnets, they must meet the following criteria:   All subnets must be in the same virtual private cloud (VPC).   You can specify only one subnet per Availability Zone.  

# Optional Parameters
- `SourceBackupId`: The identifier (ID) of the cluster backup to restore. Use this value to restore the cluster from a backup instead of creating a new cluster. To find the backup ID, use DescribeBackups.
- `TagList`: Tags to apply to the CloudHSM cluster during creation.
"""

create_cluster(HsmType, SubnetIds; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CreateCluster", Dict{String, Any}("HsmType"=>HsmType, "SubnetIds"=>SubnetIds); aws_config=aws_config)
create_cluster(HsmType, SubnetIds, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CreateCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("HsmType"=>HsmType, "SubnetIds"=>SubnetIds), args)); aws_config=aws_config)

"""
    CreateHsm()

Creates a new hardware security module (HSM) in the specified AWS CloudHSM cluster.

# Required Parameters
- `AvailabilityZone`: The Availability Zone where you are creating the HSM. To find the cluster's Availability Zones, use DescribeClusters.
- `ClusterId`: The identifier (ID) of the HSM's cluster. To find the cluster ID, use DescribeClusters.

# Optional Parameters
- `IpAddress`: The HSM's IP address. If you specify an IP address, use an available address from the subnet that maps to the Availability Zone where you are creating the HSM. If you don't specify an IP address, one is chosen for you from that subnet.
"""

create_hsm(AvailabilityZone, ClusterId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CreateHsm", Dict{String, Any}("AvailabilityZone"=>AvailabilityZone, "ClusterId"=>ClusterId); aws_config=aws_config)
create_hsm(AvailabilityZone, ClusterId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("CreateHsm", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AvailabilityZone"=>AvailabilityZone, "ClusterId"=>ClusterId), args)); aws_config=aws_config)

"""
    DeleteBackup()

Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7 days after the DeleteBackup request is made. For more information on restoring a backup, see RestoreBackup.

# Required Parameters
- `BackupId`: The ID of the backup to be deleted. To find the ID of a backup, use the DescribeBackups operation.

"""

delete_backup(BackupId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteBackup", Dict{String, Any}("BackupId"=>BackupId); aws_config=aws_config)
delete_backup(BackupId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteBackup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BackupId"=>BackupId), args)); aws_config=aws_config)

"""
    DeleteCluster()

Deletes the specified AWS CloudHSM cluster. Before you can delete a cluster, you must delete all HSMs in the cluster. To see if the cluster contains any HSMs, use DescribeClusters. To delete an HSM, use DeleteHsm.

# Required Parameters
- `ClusterId`: The identifier (ID) of the cluster that you are deleting. To find the cluster ID, use DescribeClusters.

"""

delete_cluster(ClusterId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteCluster", Dict{String, Any}("ClusterId"=>ClusterId); aws_config=aws_config)
delete_cluster(ClusterId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterId"=>ClusterId), args)); aws_config=aws_config)

"""
    DeleteHsm()

Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP address of the HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need to specify only one of these values. To find these values, use DescribeClusters.

# Required Parameters
- `ClusterId`: The identifier (ID) of the cluster that contains the HSM that you are deleting.

# Optional Parameters
- `EniId`: The identifier (ID) of the elastic network interface (ENI) of the HSM that you are deleting.
- `EniIp`: The IP address of the elastic network interface (ENI) of the HSM that you are deleting.
- `HsmId`: The identifier (ID) of the HSM that you are deleting.
"""

delete_hsm(ClusterId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteHsm", Dict{String, Any}("ClusterId"=>ClusterId); aws_config=aws_config)
delete_hsm(ClusterId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DeleteHsm", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterId"=>ClusterId), args)); aws_config=aws_config)

"""
    DescribeBackups()

Gets information about backups of AWS CloudHSM clusters. This is a paginated operation, which means that each response might contain only a subset of all the backups. When the response contains only a subset of backups, it includes a NextToken value. Use this value in a subsequent DescribeBackups request to get more backups. When you receive a response with no NextToken (or an empty or null value), that means there are no more backups to get.

# Optional Parameters
- `Filters`: One or more filters to limit the items returned in the response. Use the backupIds filter to return only the specified backups. Specify backups by their backup identifier (ID). Use the sourceBackupIds filter to return only the backups created from a source backup. The sourceBackupID of a source backup is returned by the CopyBackupToRegion operation. Use the clusterIds filter to return only the backups for the specified clusters. Specify clusters by their cluster identifier (ID). Use the states filter to return only backups that match the specified state.
- `MaxResults`: The maximum number of backups to return in the response. When there are more backups than the number you specify, the response contains a NextToken value.
- `NextToken`: The NextToken value that you received in the previous response. Use this value to get more backups.
- `SortAscending`: Designates whether or not to sort the return backups by ascending chronological order of generation.
"""

describe_backups(; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DescribeBackups"; aws_config=aws_config)
describe_backups(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DescribeBackups", args; aws_config=aws_config)

"""
    DescribeClusters()

Gets information about AWS CloudHSM clusters. This is a paginated operation, which means that each response might contain only a subset of all the clusters. When the response contains only a subset of clusters, it includes a NextToken value. Use this value in a subsequent DescribeClusters request to get more clusters. When you receive a response with no NextToken (or an empty or null value), that means there are no more clusters to get.

# Optional Parameters
- `Filters`: One or more filters to limit the items returned in the response. Use the clusterIds filter to return only the specified clusters. Specify clusters by their cluster identifier (ID). Use the vpcIds filter to return only the clusters in the specified virtual private clouds (VPCs). Specify VPCs by their VPC identifier (ID). Use the states filter to return only clusters that match the specified state.
- `MaxResults`: The maximum number of clusters to return in the response. When there are more clusters than the number you specify, the response contains a NextToken value.
- `NextToken`: The NextToken value that you received in the previous response. Use this value to get more clusters.
"""

describe_clusters(; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DescribeClusters"; aws_config=aws_config)
describe_clusters(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("DescribeClusters", args; aws_config=aws_config)

"""
    InitializeCluster()

Claims an AWS CloudHSM cluster by submitting the cluster certificate issued by your issuing certificate authority (CA) and the CA's root certificate. Before you can claim a cluster, you must sign the cluster's certificate signing request (CSR) with your issuing CA. To get the cluster's CSR, use DescribeClusters.

# Required Parameters
- `ClusterId`: The identifier (ID) of the cluster that you are claiming. To find the cluster ID, use DescribeClusters.
- `SignedCert`: The cluster certificate issued (signed) by your issuing certificate authority (CA). The certificate must be in PEM format and can contain a maximum of 5000 characters.
- `TrustAnchor`: The issuing certificate of the issuing certificate authority (CA) that issued (signed) the cluster certificate. You must use a self-signed certificate. The certificate used to sign the HSM CSR must be directly available, and thus must be the root certificate. The certificate must be in PEM format and can contain a maximum of 5000 characters.

"""

initialize_cluster(ClusterId, SignedCert, TrustAnchor; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("InitializeCluster", Dict{String, Any}("ClusterId"=>ClusterId, "SignedCert"=>SignedCert, "TrustAnchor"=>TrustAnchor); aws_config=aws_config)
initialize_cluster(ClusterId, SignedCert, TrustAnchor, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("InitializeCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterId"=>ClusterId, "SignedCert"=>SignedCert, "TrustAnchor"=>TrustAnchor), args)); aws_config=aws_config)

"""
    ListTags()

Gets a list of tags for the specified AWS CloudHSM cluster. This is a paginated operation, which means that each response might contain only a subset of all the tags. When the response contains only a subset of tags, it includes a NextToken value. Use this value in a subsequent ListTags request to get more tags. When you receive a response with no NextToken (or an empty or null value), that means there are no more tags to get.

# Required Parameters
- `ResourceId`: The cluster identifier (ID) for the cluster whose tags you are getting. To find the cluster ID, use DescribeClusters.

# Optional Parameters
- `MaxResults`: The maximum number of tags to return in the response. When there are more tags than the number you specify, the response contains a NextToken value.
- `NextToken`: The NextToken value that you received in the previous response. Use this value to get more tags.
"""

list_tags(ResourceId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("ListTags", Dict{String, Any}("ResourceId"=>ResourceId); aws_config=aws_config)
list_tags(ResourceId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("ListTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId), args)); aws_config=aws_config)

"""
    RestoreBackup()

Restores a specified AWS CloudHSM backup that is in the PENDING_DELETION state. For mor information on deleting a backup, see DeleteBackup.

# Required Parameters
- `BackupId`: The ID of the backup to be restored. To find the ID of a backup, use the DescribeBackups operation.

"""

restore_backup(BackupId; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("RestoreBackup", Dict{String, Any}("BackupId"=>BackupId); aws_config=aws_config)
restore_backup(BackupId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("RestoreBackup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BackupId"=>BackupId), args)); aws_config=aws_config)

"""
    TagResource()

Adds or overwrites one or more tags for the specified AWS CloudHSM cluster.

# Required Parameters
- `ResourceId`: The cluster identifier (ID) for the cluster that you are tagging. To find the cluster ID, use DescribeClusters.
- `TagList`: A list of one or more tags.

"""

tag_resource(ResourceId, TagList; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("TagResource", Dict{String, Any}("ResourceId"=>ResourceId, "TagList"=>TagList); aws_config=aws_config)
tag_resource(ResourceId, TagList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "TagList"=>TagList), args)); aws_config=aws_config)

"""
    UntagResource()

Removes the specified tag or tags from the specified AWS CloudHSM cluster.

# Required Parameters
- `ResourceId`: The cluster identifier (ID) for the cluster whose tags you are removing. To find the cluster ID, use DescribeClusters.
- `TagKeyList`: A list of one or more tag keys for the tags that you are removing. Specify only the tag keys, not the tag values.

"""

untag_resource(ResourceId, TagKeyList; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("UntagResource", Dict{String, Any}("ResourceId"=>ResourceId, "TagKeyList"=>TagKeyList); aws_config=aws_config)
untag_resource(ResourceId, TagKeyList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = cloudhsm_v2("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceId"=>ResourceId, "TagKeyList"=>TagKeyList), args)); aws_config=aws_config)
