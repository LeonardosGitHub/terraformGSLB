variable "aws_region" {
  description = "aws region (default is us-east-1)"
  default     = "us-east-1"
}
variable "fqdn_app_name" {
  description = "fqdn app name, only hypens. example = app-example-com"
}


##############################
## Variables below from CFT ##
##############################

variable "Vpc" {
  description = ""
  default     = "us-east-1"
}
variable "adminUsername" {
  description = ""
  default     = "us-east-1"
}
variable "allowUsageAnalytics" {
  description = ""
  default     = "us-east-1"
}
variable "appInternalDnsName" {
  description = ""
  default     = "us-east-1"
}
variable "application" {
  description = ""
  default     = "us-east-1"
}
variable "applicationPoolTagKey" {
  description = ""
  default     = "us-east-1"
}
variable "applicationPoolTagValue" {
  description = ""
  default     = "us-east-1"
}
variable "applicationPort" {
  description = ""
  default     = "us-east-1"
}
variable "availabilityZones" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqAddress" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqLicensePoolName" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqLicenseSkuKeyword1" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqLicenseUnitOfMeasure" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqPasswordS3Arn" {
  description = ""
  default     = "us-east-1"
}
variable "bigIqUsername" {
  description = ""
  default     = "us-east-1"
}
variable "bigipElasticLoadBalancer" {
  description = ""
  default     = "us-east-1"
}
variable "costcenter" {
  description = ""
  default     = "us-east-1"
}
variable "customImageId" {
  description = ""
  default     = "us-east-1"
}
variable "declarationUrl" {
  description = ""
  default     = "us-east-1"
}
variable "deploymentName" {
  description = "Unique name for deployment"
  default     = "us-east-1"
}
variable "environment" {
  description = ""
  default     = "us-east-1"
}
variable "group" {
  description = ""
  default     = "us-east-1"
}
variable "highCpuThreshold" {
  description = ""
  default     = "us-east-1"
}
variable "imageName" {
  description = ""
  default     = "us-east-1"
}
variable "instanceType" {
  description = ""
  default     = "us-east-1"
}
variable "lowCpuThreshold" {
  description = ""
  default     = "us-east-1"
}
variable "managementGuiPort" {
  description = ""
  default     = 8443
}
variable "notificationEmail" {
  description = ""
  default     = "leonardo.simon@f5.com"
}
variable "ntpServer" {
  description = ""
  default     = "us-east-1"
}
variable "owner" {
  description = ""
  default     = "us-east-1"
}
variable "policyLevel" {
  description = ""
  default     = "us-east-1"
}
variable "restrictedSrcAddress" {
  description = ""
  default     = ["0.0.0.0/0"]
}
variable "restrictedSrcAddressApp" {
  description = ""
  default     = "us-east-1"
}
variable "scaleDownBytesThreshold" {
  description = ""
  default     = "us-east-1"
}
variable "scaleUpBytesThreshold" {
  description = ""
  default     = "us-east-1"
}
variable "scalingMaxSize" {
  description = "Maximum number of BIG-IPs to scale UP"
}
variable "scalingMinSize" {
  description = "Minimum number of BIG-IPs to build"
}
variable "sshKey" {
  description = ""
  default     = "leonardo_f5_aws"
}
variable "subnets" {
  description = ""
  default     = "us-east-1"
}
variable "throughput" {
  description = ""
  default     = "us-east-1"
}
variable "timezone" {
  description = ""
  default     = "us-east-1"
}
variable "virtualServicePort" {
  description = ""
  default     = "us-east-1"
}
variable "LaunchConfigUserData" {
  description = ""
  default     = <<-EOF
                #!/bin/bash -x\n",
                "/opt/aws/apitools/cfn-init/bin/cfn-init -v -s "AWS::StackId" -r BigipLaunchConfig --region "AWS::Region" \n"
                EOF
}
variable "LaunchConfigUserData2" {
  description = ""
  default = <<-EOF
                #!/bin/bash -x\n
                "/opt/aws/apitools/cfn-init/bin/cfn-init -v -s {\"Ref\": \"AWS::StackId\"} -r BigipLaunchConfig --region {\"Ref\": \"AWS::Region\"}\n"
                EOF
}

/*
"Parameters": {
    "Vpc": {
        "ConstraintDescription": "This must be an existing VPC within the working region.",
        "Type": "AWS::EC2::VPC::Id"
    },
    "adminUsername": {
        "AllowedPattern": "[a-zA-Z0-9._-]+",
        "ConstraintDescription": "Verify your BIG-IP admin username. Note that the user name can contain only alphanumeric characters, periods ( . ), underscores ( _ ), or hyphens ( - ). The user name cannot be any of the following: adm, apache, bin, daemon, guest, lp, mail, manager, mysql, named, nobody, ntp, operator, partition, password, pcap, postfix, radvd, root, rpc, rpm, sshd, syscheck, tomcat, uucp, or vcsa.",
        "Default": "cluster-admin",
        "Description": "BIG-IP Admin User for clustering",
        "MaxLength": 255,
        "MinLength": 1,
        "Type": "String"
    },
    "allowUsageAnalytics": {
        "AllowedValues": [
            "Yes",
            "No"
        ],
        "Default": "Yes",
        "Description": "This deployment can send anonymous statistics to F5 to help us determine how to improve our solutions. If you select **No** statistics are not sent.",
        "Type": "String"
    },
    "appInternalDnsName": {
        "Default": "www.example.com",
        "Description": "DNS name poolapp.example.com for the application pool.  This is not required if you are using the Service Discovery feature.",
        "Type": "String"
    },
    "application": {
        "Default": "f5app",
        "Description": "Name of the Application Tag",
        "Type": "String"
    },
    "applicationPoolTagKey": {
        "Default": "default",
        "Description": "This is used for the Service Discovery feature. If you specify a non-default value here, the template automatically discovers the pool members you have tagged with this key and the value you specify next.",
        "Type": "String"
    },
    "applicationPoolTagValue": {
        "Default": "default",
        "Description": "This is used for the Service Discovery feature. If you specify a non-default value here, the template automatically discovers the pool members you have tagged with the key you specified and this value.",
        "Type": "String"
    },
    "applicationPort": {
        "ConstraintDescription": "Must be a valid port number (1-65535).",
        "Default": 80,
        "Description": "Port for the application pool member on BIG-IP VE",
        "MaxValue": 65535,
        "MinValue": 1,
        "Type": "Number"
    },
    "availabilityZones": {
        "Description": "Availability Zones where you want to deploy BIG-IP VEs (we recommend at least 2)",
        "Type": "List<AWS::EC2::AvailabilityZone::Name>"
    },
    "bigIqAddress": {
        "ConstraintDescription": "Verify the private IP address of the BIG-IQ device that contains the pool of licenses",
        "Description": "Private IP address of the BIG-IQ device that contains the pool of BIG-IP licenses",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigIqLicensePoolName": {
        "ConstraintDescription": "Verify the Name of BIG-IQ License Pool",
        "Description": "Name of the pool on BIG-IQ that contains the BIG-IP licenses",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigIqLicenseSkuKeyword1": {
        "ConstraintDescription": "Verify the BIG-IQ license filter to use for sku keyword 1",
        "Default": "OPTIONAL",
        "Description": "The BIG-IQ license filter (based on SKU keyword) you want to use for licensing the BIG-IPs from the BIG-IQ, for example LTM, BR, BT, ASM or LTMASM. Note: This is only required when licensing with an ELA/subscription (utility) pool on the BIG-IQ, if not using this pool type leave the default of OPTIONAL.",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigIqLicenseUnitOfMeasure": {
        "ConstraintDescription": "Verify the BIG-IQ License Unit Of Measure",
        "Default": "OPTIONAL",
        "Description": "The BIG-IQ license unit of measure to use during BIG-IP licensing via BIG-IQ, for example yearly, monthly, daily or hourly. Note: This is only required when licensing with an ELA/subscription (utility) pool on the BIG-IQ, if not using this pool type leave the default of OPTIONAL.",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigIqPasswordS3Arn": {
        "ConstraintDescription": "Verify the S3 ARN of BIG-IQ Password file",
        "Description": "S3 ARN of the BIG-IQ Password file. e.g. arn:aws:s3:::bucket_name/full_path_to_file for public regions. For GovCloud (US) region, start with arn:aws-us-gov:s3. For China region, start with arn:aws-cn:s3.",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigIqUsername": {
        "ConstraintDescription": "Verify the BIG-IQ user with privileges to license BIG-IP. Can be Admin, Device Manager, or Licensing Manager",
        "Description": "BIG-IQ user with privileges to license BIG-IP. Must be 'Admin', 'Device Manager', or 'Licensing Manager'",
        "MaxLength": "255",
        "MinLength": "1",
        "Type": "String"
    },
    "bigipElasticLoadBalancer": {
        "Default": "ExampleBigipELB",
        "Description": "Name of the AWS Elastic Load Balancer for the BIG-IP VEs",
        "Type": "String"
    },
    "costcenter": {
        "Default": "f5costcenter",
        "Description": "Name of the Cost Center Tag",
        "Type": "String"
    },
    "customImageId": {
        "ConstraintDescription": "Must be a valid AMI Id",
        "Default": "OPTIONAL",
        "Description": "If you would like to deploy using a custom BIG-IP image, provide the AMI Id.  **Note**: Unless specifically required, leave the default of **OPTIONAL**",
        "MaxLength": 255,
        "MinLength": 1,
        "Type": "String"
    },
    "declarationUrl": {
        "AllowedPattern": "^(http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$|^none$|^default$",
        "Default": "default",
        "Description": "URL for the AS3 declaration JSON file to be deployed. If left at **default**, the recommended F5 application service configuration will be applied. Enter **none** to deploy without a service configuration.",
        "Type": "String"
    },
    "deploymentName": {
        "Default": "example",
        "Description": "Name the template uses to create object names",
        "MaxLength": 25,
        "Type": "String"
    },
    "environment": {
        "Default": "f5env",
        "Description": "Name of the Environment Tag",
        "Type": "String"
    },
    "group": {
        "Default": "f5group",
        "Description": "Name of the Group Tag",
        "Type": "String"
    },
    "highCpuThreshold": {
        "ConstraintDescription": "Select a value between 0 to 100",
        "Default": 80,
        "Description": "High CPU Percentage threshold to begin scaling up BIG-IP VE instances",
        "MaxValue": 100,
        "MinValue": 0,
        "Type": "Number"
    },
    "imageName": {
        "AllowedValues": [
            "AllOneBootLocation",
            "AllTwoBootLocations"
        ],
        "ConstraintDescription": "Must be a valid F5 BIG-IP VE image type",
        "Default": "AllTwoBootLocations",
        "Description": "Image names starting with All have all BIG-IP modules available.  Use Two Boot Locations if you expect to upgrade the BIG-IP VE in the future (the Two Boot Location options are only applicable to BIG-IP v13.1.1 or later). If you do not need room to upgrade (if you intend to create a new instance when a new version of BIG-IP VE is released), use one Boot Location.",
        "Type": "String"
    },
    "instanceType": {
        "AllowedValues": [
            "m3.2xlarge",
            "m4.xlarge",
            "m4.2xlarge",
            "m4.4xlarge",
            "m4.10xlarge",
            "m5.large",
            "m5.xlarge",
            "m5.2xlarge",
            "m5.4xlarge",
            "c3.4xlarge",
            "c3.8xlarge",
            "c4.4xlarge",
            "c4.8xlarge",
            "c5.large",
            "c5.xlarge",
            "c5.2xlarge",
            "c5.4xlarge",
            "cc2.8xlarge",
            "c5n.2xlarge",
            "c5n.4xlarge"
        ],
        "ConstraintDescription": "Must be a valid EC2 instance type for BIG-IP",
        "Default": "m3.2xlarge",
        "Description": "AWS instance type",
        "Type": "String"
    },
    "lowCpuThreshold": {
        "ConstraintDescription": "Select a value between 0 to 100",
        "Default": 0,
        "Description": "Low CPU Percentage threshold to begin scaling down BIG-IP VE instances",
        "MaxValue": 100,
        "MinValue": 0,
        "Type": "Number"
    },
    "managementGuiPort": {
        "ConstraintDescription": "Must be a valid, unused port on the BIG-IP.",
        "Default": "8443",
        "Description": "Port for the BIG-IP management Configuration utility",
        "Type": "Number"
    },
    "notificationEmail": {
        "AllowedPattern": ".+@.+",
        "ConstraintDescription": "Must be a valid email address.",
        "Description": "Valid email address to send Auto Scaling event notifications",
        "Type": "String"
    },
    "ntpServer": {
        "Default": "0.pool.ntp.org",
        "Description": "NTP server for this implementation",
        "Type": "String"
    },
    "owner": {
        "Default": "f5owner",
        "Description": "Name of the Owner Tag",
        "Type": "String"
    },
    "policyLevel": {
        "AllowedValues": [
            "low",
            "medium",
            "high"
        ],
        "ConstraintDescription": "Select the WAF Policy Level you want to use",
        "Default": "high",
        "Description": "WAF Policy Level you want to use to protect the applications",
        "Type": "String"
    },
    "restrictedSrcAddress": {
        "AllowedPattern": "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
        "ConstraintDescription": "Must be a valid IP CIDR range of the form x.x.x.x/x.",
        "Description": " The IP address range used to SSH and access managment GUI on the EC2 instances",
        "MaxLength": "18",
        "MinLength": "9",
        "Type": "String"
    },
    "restrictedSrcAddressApp": {
        "AllowedPattern": "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
        "ConstraintDescription": "Must be a valid IP CIDR range of the form x.x.x.x/x.",
        "Description": " The IP address range that can be used to access web traffic (80/443) to the EC2 instances",
        "MaxLength": "18",
        "MinLength": "9",
        "Type": "String"
    },
    "scaleDownBytesThreshold": {
        "Default": 10000,
        "Description": "Incoming bytes threshold to begin scaling down BIG-IP VE instances",
        "Type": "Number"
    },
    "scaleUpBytesThreshold": {
        "Default": 35000,
        "Description": "Incoming bytes threshold to begin scaling up BIG-IP VE instances",
        "Type": "Number"
    },
    "scalingMaxSize": {
        "ConstraintDescription": "Must be a number between 2-8",
        "Default": 3,
        "Description": "Maximum number of BIG-IP instances (2-8) that can be created in the Auto Scale Group",
        "MaxValue": 8,
        "MinValue": 2,
        "Type": "Number"
    },
    "scalingMinSize": {
        "ConstraintDescription": "Must be a number between 1-8",
        "Default": 1,
        "Description": "Minimum number of BIG-IP instances (1-8) you want available in the Auto Scale Group",
        "MaxValue": 8,
        "MinValue": 1,
        "Type": "Number"
    },
    "sshKey": {
        "Description": "EC2 KeyPair to enable SSH access to the BIG-IP instance",
        "Type": "AWS::EC2::KeyPair::KeyName"
    },
    "subnets": {
        "ConstraintDescription": "The subnet IDs must be within an existing VPC",
        "Description": "Public or external subnets for the availability zones",
        "Type": "List<AWS::EC2::Subnet::Id>"
    },
    "throughput": {
        "AllowedValues": [
            "25Mbps",
            "200Mbps",
            "1000Mbps",
            "5000Mbps"
        ],
        "ConstraintDescription": "Select the BIG-IP throughput you want to use",
        "Default": "1000Mbps",
        "Description": "Maximum amount of throughput for BIG-IP VE",
        "Type": "String"
    },
    "timezone": {
        "Default": "UTC",
        "Description": "Olson timezone string. Acceptable values can be found from /usr/share/zoneinfo directory located on BIG-IP. Also, see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones referencing the TZ* column for Olsen timezone examples.",
        "Type": "String"
    },
    "virtualServicePort": {
        "ConstraintDescription": "Must be a valid port number (1-65535).",
        "Default": 80,
        "Description": "Port for the virtual service on BIG-IP VE",
        "MaxValue": 65535,
        "MinValue": 1,
        "Type": "Number"
    }
}
*/

