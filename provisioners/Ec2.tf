resource "aws_instance" "Ecom" {
  for_each               = var.instance_config
  
  ami                    = var.ami_id
  instance_type          = var.instance_type[var.environment]
  subnet_id              = var.subnet_id # <--- ADD THIS
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  tags = {
    Name    = each.key 
    purpose = var.ec2_tags["purpose"]
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id # <--- ADD THIS

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = var.protocol
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = var.sg_tags["Name"]
    purpose = var.sg_tags["purpose"]
  }
}