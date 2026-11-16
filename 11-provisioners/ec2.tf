resource "aws_instance" "provisioners" {
  ami = "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.provisioners.id ]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} and ${self.tags["Name"]} > intentory.ini" # self = aws_instance.provisioners
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  
  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh"
     ]
  }

#   provisioner "remote-exec" {
#     # command = "sudo dnf install nging -y" this won't work with remote-exec
#     inline = [ 
#         "sudo dnf install nginx -y",
#         "sudo systemctl start nginx",
#         "sudo systemctl enable nginx"
#      ]
#   }

  provisioner "remote-exec" {
    # this is called graceful termination/destroy
    when = destroy
    inline = [ 
        "sudo systemctl stop nginx"
     ]
  }

#   provisioner "local-exec" {
#     when = destroy
#     command = "echo 'The instance is goinng to be destroyed'"
#   }

  tags = {
    Name = "provisioners-demo"
  }
}

resource "aws_security_group" "provisioners" {
  name = "provisioners-demo"

  ingress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "provisioners-demo"
  }
}