resource "aws_instance" "roboshop"{
    for_each = var.instance_data
    ami = "ami-0055977a6e828a4f4"
    instance_type = "${each.value.instance_type}"

    vpc_security_group_ids = [aws_security_group.roboshop-common.id, aws_security_group.roboshop[each.key].id]

    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "roboshop-common"{
    name = "${var.project}-${var.environment}-common"

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project}-${var.environment}-common"
    }
}

resource "aws_security_group" "roboshop"{
    for_each = var.instance_data
    name = "${var.project}-${var.environment}-${each.key}"

    egress {
        from_port = each.value.port_number
        to_port = each.value.port_number
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project}-${var.environment}-${each.key}"
    }
}