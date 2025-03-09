output "ec2_public_ip" {
  value = aws_instance.ourfirst.public_ip
}
