variable "project" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "Amazom Machine Image ID"
}

variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
  type    = string
  default = "Z07166913431ZYKE9ODG1"
}

variable "domain_name" {
  type    = string
  default = "vardhandaws.online"
}