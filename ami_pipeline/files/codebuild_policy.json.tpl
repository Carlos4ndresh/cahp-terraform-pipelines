{
  "Version": "2012-10-17",
  "Statement": [
      {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketVersioning",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:PutObjectAcl",
                "s3:PutObject"
            ],
            "Resource": [
                "${bucket}",
                "${bucket}/*",
            ],
            "Effect": "Allow"
        },     
        {
            "Action": [
                "codebuild:*"
            ],
            "Effect": "Allow",
            "Resource": [
                "${codebuild_project}"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": [
                "*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Action": [
                "codestar-connections:GetConnection",
                "codestar-connections:GetHost",
                "codestar-connections:GetIndividualAccessToken",
                "codestar-connections:GetInstallationUrl",
                "codestar-connections:ListConnections",
                "codestar-connections:ListHosts",
                "codestar-connections:ListInstallationTargets",
                "codestar-connections:ListTagsForResource",
                "codestar-connections:PassConnection",
                "codestar-connections:UseConnection"
            ],
            "Effect": "Allow",
            "Resource": "${codestar_conn}"
        },         
    {
      "Sid": "EBSThings",
      "Action": "ebs:*",
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
          "StringEquals": {
              "ec2:AuthorizedService": "codebuild.amazonaws.com"
          }
      }
    },
    {
      "Sid": "EC2Things",
      "Action": [
        "ec2:AllocateAddress",
        "ec2:AssignPrivateIpAddresses",
        "ec2:AssociateAddress",
        "ec2:AttachNetworkInterface",
        "ec2:AttachVolume",
        "ec2:CopyImage",
        "ec2:CopySnapshot",
        "ec2:CreateCapacityReservation",
        "ec2:CreateImage",
        "ec2:CreateInstanceExportTask",
        "ec2:CreateKeyPair",
        "ec2:CreateLaunchTemplate",
        "ec2:CreateLaunchTemplateVersion",
        "ec2:CreateNetworkInterface",
        "ec2:CreateNetworkInterfacePermission",
        "ec2:CreatePlacementGroup",
        "ec2:CreateReplaceRootVolumeTask",
        "ec2:CreateRestoreImageTask",
        "ec2:CreateSnapshot",
        "ec2:CreateSnapshots",
        "ec2:CreateStoreImageTask",
        "ec2:CreateTags",
        "ec2:CreateVolume",
        "ec2:DeleteKeyPair",
        "ec2:DeleteLaunchTemplate",
        "ec2:DeleteLaunchTemplateVersions",
        "ec2:DeleteNetworkInterface",
        "ec2:DeleteNetworkInterfacePermission",
        "ec2:DeleteSnapshot",
        "ec2:DeleteTags",
        "ec2:DeleteVolume",
        "ec2:DeregisterImage",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeExportImageTasks",
        "ec2:DescribeFastLaunchImages",
        "ec2:DescribeFastSnapshotRestores",
        "ec2:DescribeImageAttribute",
        "ec2:DescribeImages",
        "ec2:DescribeImportImageTasks",
        "ec2:DescribeImportSnapshotTasks",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeInstanceCreditSpecifications",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeInstanceTypeOfferings",
        "ec2:DescribeInstanceTypes",
        "ec2:DescribeInstances",
        "ec2:DescribeKeyPairs",
        "ec2:DescribeLaunchTemplateVersions",
        "ec2:DescribeLaunchTemplates",
        "ec2:DescribeNetworkInterfacePermissions",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeRegions",
        "ec2:DescribeSnapshotAttribute",
        "ec2:DescribeSnapshotTierStatus",
        "ec2:DescribeSnapshots",
        "ec2:DescribeStoreImageTasks",
        "ec2:DescribeTags",
        "ec2:DescribeVolumeAttribute",
        "ec2:DescribeVolumeStatus",
        "ec2:DescribeVolumes",
        "ec2:DescribeVolumesModifications",
        "ec2:DetachNetworkInterface",
        "ec2:DetachVolume",
        "ec2:DisableEbsEncryptionByDefault",
        "ec2:DisassociateAddress",
        "ec2:EnableEbsEncryptionByDefault",
        "ec2:EnableImageDeprecation",
        "ec2:ExportImage",
        "ec2:GetConsoleOutput",
        "ec2:GetConsoleScreenshot",
        "ec2:GetEbsDefaultKmsKeyId",
        "ec2:GetEbsEncryptionByDefault",
        "ec2:GetInstanceTypesFromInstanceRequirements",
        "ec2:GetSerialConsoleAccessStatus",
        "ec2:ImportImage",
        "ec2:ImportInstance",
        "ec2:ImportKeyPair",
        "ec2:ImportSnapshot",
        "ec2:ImportVolume",
        "ec2:ListSnapshotsInRecycleBin",
        "ec2:ModifyAddressAttribute",
        "ec2:ModifyAvailabilityZoneGroup",
        "ec2:ModifyImageAttribute",
        "ec2:ModifyInstanceAttribute",
        "ec2:ModifyInstanceCreditSpecification",
        "ec2:ModifyInstanceEventStartTime",
        "ec2:ModifyInstanceMetadataOptions",
        "ec2:ModifyInstancePlacement",
        "ec2:ModifyLaunchTemplate",
        "ec2:ModifyNetworkInterfaceAttribute",
        "ec2:ModifyPrivateDnsNameOptions",
        "ec2:ModifySnapshotAttribute",
        "ec2:ModifySnapshotTier",
        "ec2:ModifySubnetAttribute",
        "ec2:ModifyVolume",
        "ec2:ModifyVolumeAttribute",
        "ec2:MonitorInstances",
        "ec2:RebootInstances",
        "ec2:RegisterImage",
        "ec2:ReleaseAddress",
        "ec2:ReportInstanceStatus",
        "ec2:ResetImageAttribute",
        "ec2:ResetInstanceAttribute",
        "ec2:ResetNetworkInterfaceAttribute",
        "ec2:ResetSnapshotAttribute",
        "ec2:RestoreSnapshotFromRecycleBin",
        "ec2:RestoreSnapshotTier",
        "ec2:RunInstances",
        "ec2:RunScheduledInstances",
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:TerminateInstances",
        "ec2:UnassignIpv6Addresses",
        "ec2:UnassignPrivateIpAddresses",
        "ec2:UnmonitorInstances"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
          "StringEquals": {
              "ec2:AuthorizedService": "codebuild.amazonaws.com"
          }
      }
    }
  ]
}