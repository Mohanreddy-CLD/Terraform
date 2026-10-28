resource "aws_instance" "Ecom" {
  # Using for_each to create multiple instances based on the map in variables
  count               = length(var.instance)
  
  ami                    = var.ami_id
  # Corrected logic: Check var.environment instead of var.instance_type
  instance_type          = var.instance_type[var.environment]
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  tags = {
    var.common_tags
    Name    = var.instance[count.index] # Assigns the name from the map key (e.g., Ecom-Web)
    purpose = var.ec2_tags["purpose"]
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  # Dynamic block to loop through multiple ingress ports
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
    # Corrected: Removed the double quotes around the variable
    Name    = var.sg_tags["Name"]
    purpose = var.sg_tags["purpose"]
  }
}