output "bastion_host_dns" {
  value = aws_instance.bastion_host.public_dns
}

output "bastion_host_id" {
  value = aws_instance.bastion_host.id
}

output "jenkins_host_dns" {
  value = aws_instance.jenkins.public_dns
}

output "jenkins_host_id" {
  value = aws_instance.jenkins.id
}
