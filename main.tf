terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

variable "docker_username" {}

resource "docker_image" "node_hello" {
  name         = "${var.docker_username}/node-hello"
  keep_locally = false
}

resource "docker_container" "node_hello" {
  name  = "node-hello"
  image = docker_image.node_hello.name
  ports {
    internal = 3000
    external = 3000
  }
}
