
output "vpc_id" {
  value = aws_vpc.vpc_gslb_ohio.id
}

output "vpc_subnet_a_cidr_block" {
  value = aws_subnet.f5_subnet_a.cidr_block
}
output "vpc_subnet_a_id" {
  value = aws_subnet.f5_subnet_a.id
}

/*
output "BIG-IPexternalSecurityGroup-id" {
  value = aws_security_group.bigipexternalsecuritygroup.id
}

output "s3BucketName" {
  value = aws_s3_bucket.S3Bucket.id
}

output "elb_dns_name" {
  #value = aws_elb.example.dns_name
  value = aws_elb.f5-autoscale-waf-elb.dns_name
}

output "sshKey" {
  value = var.aws_keypair
}

output "managementSubnetAz1" {
  value = aws_subnet.f5-management-a.id
}

output "managementSubnetAz2" {
  value = aws_subnet.f5-management-b.id
}

output "SecurityGroupforWebServers" {
  value = aws_security_group.instance.id
}

output "restrictedSrcAddress" {
  value = "0.0.0.0/0"
}

output "ssl_certificate_id" {
  value = aws_iam_server_certificate.elb_cert.arn
}

output "aws_alias" {
  value = var.aws_alias
}
*/
