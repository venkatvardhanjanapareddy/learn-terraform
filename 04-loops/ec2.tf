resource "aws_instance" "count-demo" {
  count         = length(var.instances)
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.roboshop[count.index].id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}" #interpolation, using normal value with var values
  }
}

resource "aws_security_group" "common" {
  # ... other configuration ...
  name = "${var.project}-${var.environment}-common"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "roboshop" {
  # ... other configuration ...
  count = length(var.instances)
  name  = "${var.project}-${var.environment}-${var.instances[count.index]}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}