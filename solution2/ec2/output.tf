output "keypair_details" {
  value     = module.key_pair
  sensitive = true
}
output "openvpn_details" {
  value = module.ec2_instance
}