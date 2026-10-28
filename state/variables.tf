variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-00bb6a80f01f03502"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Map of environment to instance type"
  type        = map(string)
  default = {
    dev  = "t3.micro"
    prod = "t3.medium"
  }
}

variable "instance_config" {
  description = "Map of instances to create via for_each"
  type        = map(string)
  default = {
    Ecom-Web = "web-tier"
    Ecom-App = "app-tier"
  }
}

# Network Variables - Replace defaults with your actual AWS IDs
variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default     = "vpc-0123456789abcdef0" 
}

variable "subnet_id" {
  description = "The Subnet ID where the instances will be deployed"
  type        = string
  default     = "subnet-0123456789abcdef0" 
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Ecom-trail-1"
    purpose = "variables-demo"
  }
}

variable "sg_name" {
  default = "allow_web_traffic"
}

variable "sg_description" {
  default = "Allow standard web traffic ports"
}

variable "ingress_ports" {
  description = "List of ingress ports to open"
  type        = list(number)
  default     = [80, 443] 
}

variable "protocol" {
  description = "Protocol for ingress rules"
  default     = "tcp" # Required when specifying exact ports
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name    = "allow-web"
    purpose = "variables-demo"
  }
}