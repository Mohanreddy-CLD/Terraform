resource "aws_instance" "Ecom" {
  ami                    = var.ami_id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  #vpc_security_group_ids = local.sg_id
  tags = {
    Name = var.ec2_tags.Name
  }
}

resource "aws_security_group" "allow_all" {
  name        = "var.sg_name"
  description = "var.sg_description"

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "var.sg_tags.Name"
  }
}