variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  type = map(any)
  default = {
    mongodb = {
      instance_type = "t3.micro"
    }
    redis = {
      instance_type = "t3.micro"
    }
    mysql = {
      instance_type = "t3.micro"
    }
  }
}

variable "ami_id" {
  default = "ami-0055977a6e828a4f4"
}

variable "common-tags" {
  default = {
    Name        = "roboshop-dev"
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "ingress-rules" {
  default = {
    ssh = {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port 22 for all ssh connection"
    }
    mysql = {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port 3306 for db access"
    }
    redis = {
      port        = 6379
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port 3306 for db access"
    }
  }
}