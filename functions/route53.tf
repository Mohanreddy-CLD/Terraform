resource "aws_route53_record" "www" {
  # Iterates directly over the instances created in main.tf
  count = length(aws_instance.Ecom)

  zone_id = var.zone_id
  name    = "${count.index}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  # Dynamically fetches the public IP of each instance
  records = [aws_instance.Ecom[each.key].public_ip] 
}
