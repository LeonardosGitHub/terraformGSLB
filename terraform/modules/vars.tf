
variable "tldn_gslb_cluster_name" {
  description = "tldn for specific cluster, only underscores. Example = tldn1_example_com"
}

variable "which_az" {
  description = "Which availability zone to deploy to? You're options are: \"us-east-1\", \"us-east-2\", \"us-west-2\", \"eu-west-2\""
}

variable "aws_region" {
  description = "Available regions"
  default = {
    us-east-1      = "us-east-1"
    us-east-2      = "us-east-2"
    us-west-2      = "us-west-2"
    eu-west-2      = "eu-west-2"
    ap-southeast-1 = "ap-southeast-1"
  }
}

variable "vpc_cidr_block" {
  description = "CIDR_blocks for each region"
  default = {
    us-east-1      = "10.0.101.0/24"
    us-east-2      = "10.0.102.0/24"
    us-west-2      = "10.0.103.0/24"
    eu-west-2      = "10.0.104.0/24"
    ap-southeast-1 = "10.0.105.0/24"
  }
}

variable "subnet_cidr_block" {
  description = "CIDR_blocks for each region"
  default = {
    us-east-1      = "10.0.101.0/25"
    us-east-2      = "10.0.102.0/25"
    us-west-2      = "10.0.103.0/25"
    eu-west-2      = "10.0.104.0/25"
    ap-southeast-1 = "10.0.105.0/25"
  }
}
variable "ami" {
  description = "AMI for BIG-IP in each region"
  default = {
    #us-east-1      = "ami-0e8317e79370604a1" #Version 13.1.1.4 PAYG Better 1Gbps
    #us-east-2      = "ami-0842ee864d1e460bf" #Version 13.1.1.4 PAYG Better 1Gbps
    #us-west-2      = "ami-02e5101021b8c60c7" #Version 13.1.1.4 PAYG Better 1Gbps
    #eu-west-2      = "ami-05125a2b85e0d09d1" #Version 13.1.1.4 PAYG Better 1Gbps
    #ap-southeast-1 = "ami-0bc94dff5178064ac" #Version 13.1.1.4 PAYG Better 1Gbps

    us-east-1      = "ami-0ee410d2438e6a405" #Version 14.1.2  PAYG Better 1Gbps
    us-east-2      = "ami-05a80f217481eb33a" #Version 14.1.2  PAYG Better 1Gbps
    us-west-2      = "ami-0461f4b0861922ec5" #Version 14.1.2  PAYG Better 1Gbps
    eu-west-2      = "ami-01103e16af9bbbcf2" #Version 14.1.2  PAYG Better 1Gbps
    ap-southeast-1 = "ami-09a476b4ec7982373" #Version 14.1.2  PAYG Better 1Gbps
  }
}

variable "key_pair" {
  description = "asd"
  default = {
    us-east-1      = "leonardo_f5_aws"
    us-east-2      = "f5_aws_acct_keypair"
    us-west-2      = "leonardo_oregon_aws"
    eu-west-2      = "leonardo_london_aws"
    ap-southeast-1 = "leonardo_singapore_aws"
  }
}


/*
variable "aws_region" {
  description = "Select aws region to deploy. Example: VA=us-east-1, OH=us-east-2, OR=us-west-2"
}
variable "dcX" {
  description = "What DC will this be instantiated? Valid options: virginia, ohio, or oregon"
}
variable "ami" {
  description = "AMI specific to region. Example: VA=ami-0e8317e79370604a1, OH=ami-0842ee864d1e460bf, OR=ami-02e5101021b8c60c7"
}
variable "key_pair" {
  description = "What region specific key pair will be used? Example: VA=leonardo_f5_aws, OH=f5_aws_acct_keypair, OR=leonardo_oregon_aws"
}
*/
