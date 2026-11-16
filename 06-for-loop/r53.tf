resource "aws_route53_record" "records" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.vardhandaws.online
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

# when using map, how to get the key and value for frontend
resource "aws_route53_record" "frontend" {
  count = contains(keys(var.instance_data), "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}" #vardhandaws.online
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.roboshop, "frontend").public_ip]
  allow_overwrite = true
}