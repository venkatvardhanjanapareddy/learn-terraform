variable "insatnce_type" {
    default = "t3.micro"
}

variable "ami_id"{
    default = "ami-0055977a6e828a4f4"
}

variable "project"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "common_tags"{
    type = map 
    default = {
        Project = "Roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}