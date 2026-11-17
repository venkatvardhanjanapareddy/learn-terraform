resource "aws_instance" "tfvars-demo" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.tfvars-demo.id ]

  tags = var.ec2_tags
}

resource "aws_security_group" "tfvars-demo" {
  name = "tfvars-demo-${var.environment}"

  ingress {
  to_port = 0
  from_port = 0
  cidr_blocks = [ "0.0.0.0/0" ]
  protocol = "-1"
  }


  egress {
  to_port = 0
  from_port = 0
  cidr_blocks = [ "0.0.0.0/0" ]
  protocol = "-1"
  }

  tags = {
    Name = "tfvars-demo-${var.environment}"
  }
}