
output "vpc_name" {
  value = module.gtm_ohio.vpc_name
}
output "vpc_id" {
  value = module.gtm_ohio.vpc_id
}


output "vpc_subnet_a_name" {
  value = module.gtm_ohio.vpc_subnet_a_name
}
output "vpc_subnet_a_id" {
  value = module.gtm_ohio.vpc_subnet_a_id
}
output "vpc_subnet_a_cidr_block" {
  value = module.gtm_ohio.vpc_subnet_a_cidr_block
}

output "security_group_name" {
  value = module.gtm_ohio.security_group_name
}
output "security_group_id" {
  value = module.gtm_ohio.security_group_id
}

output "BIG-IP_name" {
  value = module.gtm_ohio.BIG-IP_name
}

output "BIG-IP_DNS_name" {
  value = module.gtm_ohio.BIG-IP_DNS_name
}

output "BIG-IP_public_IPaddr" {
  value = module.gtm_ohio.BIG-IP_public_IPaddr
}

output "BIG-IP_private_IPaddr" {
  value = module.gtm_ohio.BIG-IP_private_IPaddr
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
