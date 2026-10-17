resource "aws_instance" "Ecom" {
  ami           = "ami-00bb6a80f01f03502" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  #vpc_security_group_ids = local.sg_id
  tags = {
    Name = "Ecom-trail-1"
  }
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all_change"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    lifecycle {
      create_before_destroy = true
    }

    tags = {
        Name = "allow-all"
    }
}