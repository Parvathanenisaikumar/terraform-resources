resource "aws_security_group" "SG" {
name = "terraform-sg"
description = "created by terraform in vpc that is created by terraform"
vpc_id = aws_vpc.one.id

dynamic "ingress" {
for_each = var.ports
content {
from_port = ingress.value
to_port = ingress.value
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

variable "ports" {
type = list(number)
default = [22, 443, 80, 8080]
}

