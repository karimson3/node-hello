variable "docker_username" {}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "node_app" {
  name         = "${var.docker_username}/my-node-app"
  keep_locally = false
}

resource "docker_container" "node_app" {
  name  = "node-hello"
  image = docker_image.node_app.name
  ports {
    internal = 3000
    external = 3000
  }
}
