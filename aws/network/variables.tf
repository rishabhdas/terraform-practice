variable "vpc_cidr_block" {
    description = "CIDR block for VPC"
    default = "10.2.0.0/16"
}

variable "private_subnet_1" {
    description = "CIDR block for Private Subnet 1"
    default = "10.2.1.0/24"
}

variable "private_subnet_2" {
    description = "CIDR block for Private Subnet 2"
    default = "10.2.2.0/24"
}

variable "public_subnet_1" {
    description = "CIDR block for Public Subnet 1"
    default = "10.2.3.0/24"
}

variable "public_subnet_2" {
    description = "CIDR block for Public Subnet 2"
    default = "10.2.4.0/24"
}

variable "availability_zone" {
    description = "Availability Zones to use"
    default = ["us-west-2a","us-west-2b"]
}
