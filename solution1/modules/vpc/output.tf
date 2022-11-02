output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
output "pub_sub1_id" {
  value = aws_subnet.pub_sub1.id
}
output "sg_id" {
  value = aws_security_group.sg.id
}
