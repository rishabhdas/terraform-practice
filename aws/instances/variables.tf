variable "region" {
    default = "us-west-2"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "regional_amis" {
    type = map(string)
    default = {
        us-west-2 = "ami-0e8c04af2729ff1bb"
        us-east-1 = "ami-0a887e401f7654935"
    }
}

variable "bastion_keypair" {
    default = "bastion_keypair"
}


# Importing variables from different modules

variable "public_subnet_1_id" {}
variable "bastion_sg_id" {}
variable "jenkins_sg_id" {}
