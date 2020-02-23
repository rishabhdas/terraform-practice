# terraform-practice

## Provisioning on AWS

The Terraform script in aws directory will provision the following resources:

- VPC
- 2 Private Subnets, one in each Availability Zone
- 2 Public Subnets, one in each Availability Zone
- Internet Gateway. Associate this with the VPC
- NAT Gateway
- EIP for NAT Gateway
- Public and Private route tables, routes
- Bastion Security Group, allowing SSH access to all
- Jenkins Security Group, allowing HTTP access on port 8080
- Bastion Host - EC2 Instance on Public Subnet
- Jenkins Host - EC2 Instance on Public Subnet