#security group
resource "aws_security_group" "webserver_access" {
        name = "webserver_access"
        description = "allow ssh and http"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }


}

resource "aws_instance" "ourfirst" {
  ami           = "ami-0cb91c7de36eed2cb"
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"
  user_data = filebase64("install_apache.sh")
  security_groups        = ["${aws_security_group.webserver_access.name}"]
  key_name               = "revision"
  tags = {
    Name  = "ec2-test"
    Location = "Mumbai"
  }

connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("/home/ubuntu/.ssh/revision.pem")
  host        = self.public_ip
}

  # Install Ansible on the EC2 instance
provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sudo apt install -y ansible",
      "mkdir -p ~/ansible/roles",
      "echo 'Ansible installed successfully'",
      "git clone https://github.com/hhgsharish/Ansible_Playbook_Harish.git ~/ansible",
      "echo 'Ansible and repository setup complete'"
    ]
  }
 provisioner "remote-exec" {
    inline = [
      "cd ~/playbooks/ansible",
      "ansible-playbook -i 'localhost,' -c local webserver.yml"
    ]
  }




}


