provider "aws" {
    region = var.region
}

module "network" {
    source = "./network"
}

module "security_groups" {
    source = "./security_groups"
    vpc_id = module.network.vpc_id
}

module "instances" {
    source = "./instances"
    public_subnet_1_id = module.network.public_subnet_1_id
    bastion_sg_id = module.security_groups.bastion_sg_id
    jenkins_sg_id = module.security_groups.jenkins_sg_id
}
