resource "aws_instance" "condtions-demo" {
  ami           = var.ami_id
  instance_type = var.environment=="dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.condtions-demo.id]

  tags = {
    Name = "${var.project}-${var.environment}" #interpolation, using normal value with var values
  }
}

resource "aws_security_group" "condtions-demo" {
  # ... other configuration ...
  name = "condtions-demo"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
    Name = "${var.project}-${var.environment}"
  }
}
