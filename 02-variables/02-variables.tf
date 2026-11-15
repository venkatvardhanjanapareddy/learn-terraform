variable "myname" {
  type        = string
  default     = "Vardhan"
  description = "name of the creator"
}

variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "Amazom Machine Image ID"
}

variable "instance_type" {
  type    = string
#   default = "t3.micro"
  description = "instance type of EC2"
  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Use any of these instance types t3.micro, t3.small, t3.medium"
  }
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "variables-demo",
    Environment = "dev",
    Project     = "roboshop",
    Terraform   = "true"
  }
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}