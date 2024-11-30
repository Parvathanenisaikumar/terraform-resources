resource "aws_instance" "first" {
tags = {
Name = "terraform-instance" 
Environment = "dev"
project = "demo" 
}

ami = var.ami
instance_type = "t2.micro"
subnet_id = aws_subnet.two.id
vpc_security_group_ids = [aws_security_group.SG.id]
root_block_device {
volume_size = var.size
}
}

variable "ami" {
type = string
default = "ami-0166fe664262f664c"
}
variable "size" {
type = number
default = 10
}

output "instance" {
value = [aws_instance.first.public_ip, aws_instance.first.private_ip, aws_instance.first.public_dns, aws_instance.first.private_dns]
}
