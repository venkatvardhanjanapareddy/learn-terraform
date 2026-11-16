locals {
  instance_type = "t3.micro"
  common_name = "${var.project}-${var.env}"
  common_tags = {
    Name = local.common_name
    Project = var.project
    Environment = var.env
    Terraform = "true"
  }
}