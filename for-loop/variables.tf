variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-00bb6a80f01f03502"
}

variable "instance_config" {
  description = "Map of instance names to create"
  type        = map(string)
  default = {
    "Ecom-Web" = "web-server"
    "Ecom-App" = "app-server"
    "Ecom-DB"  = "database"
  }
}

variable "instance_type" {
  default     = {
    dev  = "t3.micro"
    prod = "t2.small"
  }
}

variable "ec2_tags" {
  type = map(string)
  default = {
    purpose = "variables-demo"
  }
}

variable "sg_name" {
  default = "allow_all"
}

variable "sg_description" {
  default = "allow all traffic"
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type        = list(number)
  default     = [22, 80, 443] # Define the exact ports you want to open
}

variable "protocol" {
  default = "tcp" # Changed from "-1" since specific ports usually require TCP/UDP
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name    = "allow-all"
    purpose = "variables-demo"
  }
}

variable "zone_id" {
  default     = "Z05496083TGA6W64AEKNJ" # Replace with your actual Route53 Zone ID
}

variable "domain_name" {
  default     = "marpukosam.xyz" # Replace with your actual domain name
}