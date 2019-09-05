variable "aws_region" {
  description = "Select aws region to deploy. Example: VA=us-east-1, OH=us-east-2, OR=us-west-2"
}
variable "tldn_cluster_name" {
  description = "tldn for specific cluster, only underscores. Example = tldn1_example_com"
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
