provider "aws" {
  region = "us-east-2"
}

########################################
# BUILDING THE VPC FOR THE ENVIRONMENT #
########################################


resource "aws_vpc" "vpc_gslb_ohio" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "vpc_${var.tldn_cluster_name}_gslb_ohio"
  }
}

############################
# BUILDING SUBNETS FOR VPC #
############################

resource "aws_subnet" "f5_subnet_a" {
  vpc_id                  = aws_vpc.vpc_gslb_ohio.id
  cidr_block              = "10.0.101.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${aws_vpc.vpc_gslb_ohio.tags.Name}_subnet_a"
  }
}

######################################
# BUILDING INTERNET GATEWAY & ROUTING#
######################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_gslb_ohio.id

  tags = {
    Name = "${aws_vpc.vpc_gslb_ohio.tags.Name}_internet_gateway"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc_gslb_ohio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${aws_vpc.vpc_gslb_ohio.tags.Name}_DefaultRoute"
  }
}

resource "aws_main_route_table_association" "association_subnet" {
  vpc_id         = aws_vpc.vpc_gslb_ohio.id
  route_table_id = aws_route_table.rt1.id
}

