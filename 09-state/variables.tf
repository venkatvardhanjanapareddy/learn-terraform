variable "instance_type" {
  type = string
  default = "t3.micro"

  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance type must be of t3.micro, t3.small, t3.medium"
  }
}