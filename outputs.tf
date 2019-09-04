
output "vpc_name" {
  value = aws_vpc.vpc_gslb_oregon.tags.Name
}
output "vpc_id" {
  value = aws_vpc.vpc_gslb_oregon.id
}


output "vpc_subnet_a_name" {
  value = aws_subnet.f5_subnet_a.tags.Name
}
output "vpc_subnet_a_id" {
  value = aws_subnet.f5_subnet_a.id
}
output "vpc_subnet_a_cidr_block" {
  value = aws_subnet.f5_subnet_a.cidr_block
}

output "security_group_name" {
  value = aws_security_group.bigipexternalsecuritygroup.tags.Name
}
output "security_group_id" {
  value = aws_security_group.bigipexternalsecuritygroup.id
}

output "BIG-IP_name" {
  value = aws_instance.f5_bigip.tags.Name
}

output "BIG-IP_DNS_name" {
  value = aws_instance.f5_bigip.public_dns
}

output "BIG-IP_public_IPaddr" {
  value = aws_instance.f5_bigip.public_ip
}

output "BIG-IP_private_IPaddr" {
  value = aws_instance.f5_bigip.private_ip
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
