
output "vpc_name" {
  value = aws_vpc.gslb_vpc.tags.Name
}
output "vpc_id" {
  value = aws_vpc.gslb_vpc.id
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

output "big_ip_name" {
  value = aws_instance.f5_bigip.tags.Name
}

output "big_ip_dns_name" {
  value = aws_instance.f5_bigip.public_dns
}

output "big_ip_public_IPaddr" {
  value = aws_instance.f5_bigip.public_ip
}

output "big_ip_private_IPaddr" {
  value = aws_instance.f5_bigip.private_ip
}
