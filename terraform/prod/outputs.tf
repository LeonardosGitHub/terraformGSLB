
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

output "big_ip_name" {
  value = module.gtm_ohio.big_ip_name
}

output "big_ip_dns_name" {
  value = module.gtm_ohio.big_ip_dns_name
}

output "big_ip_public_IPaddr" {
  value = module.gtm_ohio.big_ip_public_IPaddr
}

output "big_ip_private_IPaddr" {
  value = module.gtm_ohio.big_ip_private_IPaddr
}
