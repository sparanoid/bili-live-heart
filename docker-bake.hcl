variable "DEFAULT_TAG" {
  default = ["sparanoid/bili-live-heart:local"]
}

# Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  dockerfile = "fork.Dockerfile"
  tags = "${DEFAULT_TAG}"
}

# Default target if none specified
group "default" {
  targets = ["build-local"]
}

target "build" {
  inherits = ["docker-metadata-action"]
}

target "build-local" {
  inherits = ["build"]
  output = ["type=docker"]
}

target "build-all" {
  inherits = ["build"]
  platforms = [
    "linux/amd64",
    "linux/arm/v7",
    "linux/arm64",
  ]
}
