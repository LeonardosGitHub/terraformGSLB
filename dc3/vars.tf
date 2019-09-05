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
variable "tldn_cluster_name" {
  description = "tldn for specific cluster, only underscores. Example = tldn1_example_com"
}

variable "cidr_block" {
  default = {
    virginia = "us-east-1"
    ohio     = "us-east-2"
    oregon   = "us-west-2"
  }
}

variable "aws_region" {
  description = "asd"
  default = {
    virginia = "us-east-1"
    ohio     = "us-east-2"
    oregon   = "us-west-2"
  }
}

variable "dataCenter" {
  description = "asd"
  default = {
    virginia = "virginia"
    ohio     = "ohio"
    oregon   = "oregon"
  }
}

variable "ami" {
  description = "asd"
  default = {
    virginia = "ami-0e8317e79370604a1"
    ohio     = "ami-0842ee864d1e460bf"
    oregon   = "ami-02e5101021b8c60c7"
  }
}

variable "key_pair" {
  description = "asd"
  default = {
    virginia = "leonardo_f5_aws"
    ohio     = "f5_aws_acct_keypair"
    oregon   = "leonardo_f5_aws"
  }
}


variable "ohio_dataCenter" {
  description = "asd"
  default = {
    aws_region = "us-east-2"
    ami        = "ami-0842ee864d1e460bf"
    key_pair   = "f5_aws_acct_keypair"
    dc_name    = "ohio"
  }

}

variable "virgina_dataCenter" {
  description = ""
  default = {
    aws_region = "us-east-1"
    ami        = "ami-0e8317e79370604a1"
    key_pair   = "leonardo_f5_aws"
    dc_name    = "virgina"
  }

}

variable "oregon_dataCenter" {
  description = ""
  default = {
    aws_region = "us-east-1"
    ami        = "ami-0e8317e79370604a1"
    key_pair   = "leonardo_f5_aws"
    dc_name    = "oregon"
  }

}
