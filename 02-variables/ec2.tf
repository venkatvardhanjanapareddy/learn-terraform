resource "aws_instance" "variable-demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.variable-demo.id]

  tags = merge({
    Name = "variable-demo"
    },
    var.ec2_tags
  )
}

resource "aws_security_group" "variable-demo" {
  name = "variable-demo"
  # ... other configuration ...

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "variable-demo"
  }
}
