module "compute" {
  source        = "./ec2"
}

output "ec2_public_ip" {
  value = aws_instance.ourfirst.public_ip
  description = "Public IP of the EC2 instance"
}
