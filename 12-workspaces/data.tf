data "aws_ami" "ami_id" {
  most_recent = true
  filter {
    name = "name"
    values = [ "Redhat-9-DevOps-Practice" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  owners = [ "973714476881" ]
}

output "ami_id" {
  value = data.aws_ami.ami_id.id
}