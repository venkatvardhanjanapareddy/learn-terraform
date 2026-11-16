resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.insatnce_type
    vpc_security_group_ids = [aws_security_group.common.id]

    tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}"
      component = "poc"
    }
    )
}

resource "aws_security_group" "common"{
    name = "${var.project}-${var.environment}-common"

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = merge(
        {
            Name = "${var.project}-${var.environment}-common"
        },
    var.common_tags
    )
}

