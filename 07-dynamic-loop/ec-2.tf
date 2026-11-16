resource "aws_instance" "roboshop" {
  for_each               = var.instances
  ami                    = var.ami_id
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop.id]

  tags = merge(
    var.common-tags,
    {
      Name = "roboshop-dev"
    }
  )
}

# resource "aws_security_group" "common" {

#   name = "${var.project}-${var.environment}-common"

#   egress {
#     from_port   = 0
#     to_port     = 0
#     cidr_blocks = ["0.0.0.0/0"]
#     protocol    = "vpc"
#   }

#   tags = merge(
#     var.common-tags,
#     {
#       Name = "${var.project}-${var.environment}-common"
#     }
#   )
# }

resource "aws_security_group" "roboshop" {
#   for_each = var.instances
#   name     = "${var.project}-${var.environment}-${each.value.instance_type}"

  name     = "${var.project}-${var.environment}"

  dynamic "ingress" {
    for_each = var.ingress-rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.cidr_blocks
      protocol    = "tcp"
    }
  }

  tags = merge(
    var.common-tags,
    {
      Name = "${var.project}-${var.environment}"
    }
  )
}