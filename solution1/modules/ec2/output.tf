output "keypair_details" {
  value     = module.key_pair
  sensitive = true
}
output "aws_instance_id" {
  value = aws_instance.elastic.id
}
output "aws_instance_ip" {
  value = aws_instance.elastic.public_ip
}