resource "aws_route53_record" "www" {
  # Iterates directly over the instances created in main.tf
  for_each = aws_instance.Ecom

  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  # Dynamically fetches the public IP of each instance
  records = [aws_instance.Ecom[each.key].public_ip] 
}
