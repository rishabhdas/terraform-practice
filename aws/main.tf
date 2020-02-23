provider "aws" {
    region = var.region
    access_key = "AKIAIFMCAU76HGQIU2OQ"
    secret_key = "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"
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
