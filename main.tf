provider "aws" {
  region = var.aws_region
}

########################################
# BUILDING THE VPC FOR THE ENVIRONMENT #
########################################


resource "aws_vpc" "vpc-example" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "waf-${var.fqdn_app_name}-${var.deploymentName}-vpc"
  }
}

#################################################
# BUILDING SUBNETS FOR VPC IN TWO DIFFERENT AZ'S#
#################################################

resource "aws_subnet" "f5-management-a" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.101.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "management-a-vpc-example"
  }
}

resource "aws_subnet" "f5-management-b" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.102.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "management-b-vpc-example"
  }
}

resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "public-a-vpc-example"
  }
}

resource "aws_subnet" "private-a" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.100.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "private-a-vpc-example"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "public-b-vpc-example"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id                  = aws_vpc.vpc-example.id
  cidr_block              = "10.0.200.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "private-b-vpc-example"
  }
}

######################################
# BUILDING INTERNET GATEWAY & ROUTING#
######################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-example.id

  tags = {
    Name = "internet-gateway-vpc-example"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc-example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Default-vpc-example"
  }
}

resource "aws_main_route_table_association" "association-subnet" {
  vpc_id         = aws_vpc.vpc-example.id
  route_table_id = aws_route_table.rt1.id
}
