variable "project"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "instance_data"{
    type = map 
    default = {
        mongodb = {
            instance_type = "t3.micro"
            port_number = 27017
        }
        redis = {
            instance_type = "t3.micro"
            port_number = 6379
        }
        mysql = {
            instance_type = "t3.small"
            port_number = 3306
        }
        rabbitmq = {
            instance_type = "t3.micro"
            port_number = 15672
        }
        frontend = {
            instance_type = "t3.micro"
            port_number = 80
        }
    }
}

variable "domain_name" {
  default = "vardhandaws.online"
}

variable "zone_id" {
  default = "Z07166913431ZYKE9ODG1"
}