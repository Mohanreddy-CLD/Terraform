output "ec2_instance_info" {
  description = "Information about the created EC2 instances"
  
  value = {
    # Iterate through the instances map and pick specific, non-deprecated attributes
    for key, instance in aws_instance.Ecom : key => {
      instance_id = instance.id
      public_ip   = instance.public_ip
      private_ip  = instance.private_ip
    }
  }
}