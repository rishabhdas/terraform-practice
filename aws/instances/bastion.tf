resource "aws_instance" "bastion_host" {
    ami = lookup(var.regional_amis, var.region)
    instance_type = var.instance_type
    subnet_id = var.public_subnet_1_id
    associate_public_ip_address = true
    vpc_security_group_ids = [var.bastion_sg_id]
    key_name = var.bastion_keypair
    tags = {
        Name = "Practice_VPC_Bastion_Host"
        Purpose = "Bastion"
    }
}