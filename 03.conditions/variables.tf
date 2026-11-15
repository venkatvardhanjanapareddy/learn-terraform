variable "project"{
    type = string
    default = "roboshop"
}

variable "environment"{
    type = string
    default = "prod"
}

variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "Amazom Machine Image ID"
}
