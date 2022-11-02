output "keypair_details" {
  value     = module.key_pair
  sensitive = true
}
output "server_details" {
  value = module.ec2_instance
}
output "ip_details" {
  value = module.ec2_instance.public_ip
}