variable "instance_type" {
  type = map 
  default = {
    dev = "t3.micro"
    prod = "t3.small"
  }
}

variable "env" {
  default = "dev"
}

variable "ec2_tags" {
  default = {
    Name = "poc-instance"
    terraform = "true"
    component = "poc"
  }
}