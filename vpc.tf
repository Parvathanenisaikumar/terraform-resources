resource "aws_vpc" "one" {
tags = {
Name = "terraform-vpc"
}
cidr_block = "44.0.0.0/16"
instance_tenancy = "default"
enable_dns_hostnames = "true"
}

resource "aws_subnet" "two" {
tags = {
Name = "terraform-subnet"
}
vpc_id = aws_vpc.one.id
cidr_block = "44.0.0.0/24"
availability_zone = "us-east-1a"
map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "three" {
vpc_id = aws_vpc.one.id
tags = {
Name = "terraform-Gateway"
}
}

resource "aws_route_table" "four" {
tags = {
Name = "terraform_route"
}
vpc_id = aws_vpc.one.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.three.id
}
}
resource "aws_route_table_association" "five" {
subnet_id = aws_subnet.two.id
route_table_id = aws_route_table.four.id
}
