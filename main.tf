terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.12.2"
    }
  }
  required_version = ">= 0.14.9"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  count = length(var.containers)

  image = docker_image.nginx.latest
  name  = var.containers[count.index].name
  ports {
    internal = 80
    external = var.containers[count.index].port
  }
  provisioner "local-exec" {
    command = "echo ${self.name} >> /myname.txt"
    interpreter = [
      "docker", "exec", "${self.name}", "sh", "-c"
    ]
  }
}