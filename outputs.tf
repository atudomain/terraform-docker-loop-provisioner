output "container_ips" {
    value = docker_container.nginx.*.ip_address
}
