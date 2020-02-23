resource "aws_security_group" "jenkins_webapp" {
    name = "Practice_VPC_Jenkins_SG"
    description = "Jenkins Security Group"
    vpc_id = var.vpc_id
    tags = {
        Name = "Practice_VPC_Jenkins_SG"
    }
}

resource "aws_security_group_rule" "jenkins_allow_http" {
    type = "ingress"
    to_port = 8080
    from_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.jenkins_webapp.id
}

resource "aws_security_group_rule" "jenkins_allow_egress" {
    type = "egress"
    to_port = 0
    from_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.jenkins_webapp.id
}