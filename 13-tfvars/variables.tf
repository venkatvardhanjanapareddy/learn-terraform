variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-tfvars-demo"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}