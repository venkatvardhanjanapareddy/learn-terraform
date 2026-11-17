resource "aws_instance" "workspace-demo" {
  ami = data.aws_ami.ami_id.id
  instance_type = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [ aws_security_group.workspace-demo.id ]

  tags = var.ec2_tags
}
# this workspace approach is not recommended even though it has the same code 
# cons - no isolation with 2 aws accounts for state files, (2 accounts can't be added)
# change in code effects on all env, handle with care.
resource "aws_security_group" "workspace-demo" {
  name = "workspace-demo-${terraform.workspace}"
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
    Name = "workspace-demo-${terraform.workspace}"
  }
} 