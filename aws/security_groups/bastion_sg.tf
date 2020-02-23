resource "aws_security_group" "bastion_ssh" {
    name = "Practice_VPC_Bastion"
    description = "Bastion Host to connect to instances"
    vpc_id = var.vpc_id
    tags = {
        Name = "Practice_VPC_Bastion"
    }
}

resource "aws_security_group_rule" "bastion_allow_ssh" {
    type = "ingress"
    to_port = 22
    from_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.bastion_ssh.id
}

resource "aws_security_group_rule" "bastion_allow_egress" {
    type = "egress"
    to_port = 0
    from_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.bastion_ssh.id
}