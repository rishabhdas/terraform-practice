# Resource Definition

# Basic Network Components - VPC, Private and Public Subnets
resource "aws_vpc" "practice_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    tags = {
        Name = "TF_Practice_VPC"
    }
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.practice_vpc.id
    cidr_block = var.private_subnet_1
    availability_zone = element(var.availability_zone, 0)
    tags = {
        Name = "TF_Practice_Private_Subnet_1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.practice_vpc.id
    cidr_block = var.private_subnet_2
    availability_zone = element(var.availability_zone, 1)
    tags = {
        Name = "TF_Practice_Private_Subnet_2"
    }
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.practice_vpc.id
    cidr_block = var.public_subnet_1
    availability_zone = element(var.availability_zone, 0)
    tags = {
        Name = "TF_Practice_Public_Subnet_1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.practice_vpc.id
    cidr_block = var.public_subnet_2
    availability_zone = element(var.availability_zone, 1)
    tags = {
        Name = "TF_Practice_Public_Subnet_2"
    }
}

# Internet and NAT Gateways
resource "aws_internet_gateway" "practice_vpc_igw" {
    vpc_id = aws_vpc.practice_vpc.id
    tags = {
        Name = "TF_Practice_IGW"
    }
}

resource "aws_eip" "practice_vpc_eip" {
    vpc = true
}


resource "aws_nat_gateway" "practice_vpc_nat" {
    allocation_id = aws_eip.practice_vpc_eip.id
    subnet_id = aws_subnet.public_subnet_1.id
    tags = {
        Name = "TF_Practice_NAT_GW"
    }
}


# Route Tables
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.practice_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.practice_vpc_igw.id
    }
    tags = {
        Name = "Practice_VPC_Public_Route_Table"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.practice_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.practice_vpc_nat.id
    }
    tags = {
        Name = "Practice_VPC_Private_Route_Table"
    }
}

# Route Table Associations
resource "aws_route_table_association" "public_subnet_1_route" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_route" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_1_route" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_route" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
}