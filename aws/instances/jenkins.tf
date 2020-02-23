resource "aws_instance" "jenkins" {
    ami = lookup(var.regional_amis, var.region)
    instance_type = var.instance_type
    subnet_id = var.public_subnet_1_id
    associate_public_ip_address = true
    vpc_security_group_ids = [var.jenkins_sg_id]
    key_name = var.bastion_keypair
    tags = {
        Name = "Practice_VPC_Jenkins"
        Purpose = "Jenkins"
    }
    user_data = <<EOS
    #!/bin/bash
    yum update -y
    yum install -y wget git java-openjdk
    wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
    rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
    yum install -y jenkins
    service jenkins start
    chkconfig jenkins on
    EOS   
}