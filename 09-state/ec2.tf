resource "aws_instance" "roboshop" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.common.id ]

  tags = {
    Name = "roboshop-dev"
  }
}

resource "aws_security_group" "common" {
  name = "roboshop-common-states"

  egress {
    to_port = 0
    from_port = 0
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    name = "roboshop-devss"
    terraform = "true"
    project = "roboshop"
    env = "dev"
  }
}