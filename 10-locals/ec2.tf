resource "aws_instance" "locals-demo" {
  ami = var.ami_id
  instance_type = local.instance_type

  vpc_security_group_ids = [ aws_security_group.locals-demo.id ]

  tags = merge(
    {
        Name = "locals-demo"
    },
    local.common_tags
  )
}

resource "aws_security_group" "locals-demo" {
  name = "locals-demo"
  
  egress {
    to_port = 0
    from_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
  }

  tags = merge(
    local.common_tags,
    {
    Name = "${local.common_name}-locals-demo"
    }
  )

}