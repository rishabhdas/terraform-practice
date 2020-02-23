output "bastion_host_dns" {
  value = module.instances.bastion_host_dns
}

output "jenkins_host_dns" {
  value = module.instances.jenkins_host_dns
}
