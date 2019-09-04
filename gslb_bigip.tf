provider "aws" {
  region = "us-west-2"
}

########################################
# BUILDING THE VPC FOR THE ENVIRONMENT #
########################################


resource "aws_vpc" "vpc_gslb_oregon" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "${var.tldn_cluster_name}_gslb_oregon"
  }
}

###########################
# BUILDING SUBNET FOR VPC #
###########################

resource "aws_subnet" "f5_subnet_a" {
  vpc_id                  = aws_vpc.vpc_gslb_oregon.id
  cidr_block              = "10.0.101.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${aws_vpc.vpc_gslb_oregon.tags.Name}_subnet_a"
  }
}

######################################
# BUILDING INTERNET GATEWAY & ROUTING#
######################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_gslb_oregon.id

  tags = {
    Name = "${aws_vpc.vpc_gslb_oregon.tags.Name}_internet_gateway"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc_gslb_oregon.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${aws_vpc.vpc_gslb_oregon.tags.Name}_DefaultRoute"
  }
}

resource "aws_main_route_table_association" "association_subnet" {
  vpc_id         = aws_vpc.vpc_gslb_oregon.id
  route_table_id = aws_route_table.rt1.id
}

###########################
# BUILDING SECURITY GROUP #
###########################

resource "aws_security_group" "bigipexternalsecuritygroup" {
  name   = "${aws_vpc.vpc_gslb_oregon.tags.Name}_bigip_SecGroupExternal"
  vpc_id = aws_vpc.vpc_gslb_oregon.id

  #bigipExternalSecurityGroup
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["65.60.250.160/32"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["65.60.250.160/32"]
  }

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "${aws_vpc.vpc_gslb_oregon.tags.Name}_bigip_SecGroupExternal"
  }
}

########################
# BUILDING F5 INSTANCE #
########################


resource "aws_instance" "f5_bigip" {
  ami                         = "ami-02e5101021b8c60c7"
  instance_type               = "m5.large"
  subnet_id                   = aws_subnet.f5_subnet_a.id                          #(Optional) The VPC Subnet ID to launch in.
  associate_public_ip_address = true                                               #(Optional) Associate a public ip address with an instance in a VPC. Boolean value.
  key_name                    = "leonardo_oregon_aws"                              #(Optional) The key name of the Key Pair to use for the instance
  vpc_security_group_ids      = [aws_security_group.bigipexternalsecuritygroup.id] #(Optional, VPC only) A list of security group IDs to associate with.

  #private_ip = "" (Optional) Private IP address to associate with the instance in a VPC.
  #availability_zone = "" (Optional) The AZ to start the instance in.
  tags = {
    Name = "${aws_vpc.vpc_gslb_oregon.tags.Name}_bigip_instance"
  }
}

