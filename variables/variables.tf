variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-00bb6a80f01f03502"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Ecom-trail-1"
    purpose = "variables-demo"
  }

}

variable "sg_name" {
  default = "vars-file-allow_all"
}

variable "sg_description" {
  default = "allow all traffic"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "protocol" {
  default = "-1"
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