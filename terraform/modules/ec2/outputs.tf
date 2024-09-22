output "public_ip" {
  description = "This is the ip of public instance"
  value = aws_instance.ec2_slave_node.public_ip
}
