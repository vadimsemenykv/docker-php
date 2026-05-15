#!/bin/bash

set -e

REPO="vadymsemeniuk/docker-php"
PLATFORMS="linux/amd64,linux/arm64"

# Setup buildx
docker buildx create --name multiarch --use 2>/dev/null || docker buildx use multiarch
docker buildx inspect --bootstrap

docker login

# PHP 7.1
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-71 \
  -t $REPO:7.1 \
  --push \
  .

# PHP 7.2
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-72 \
  -t $REPO:7.2 \
  --push \
  .

# PHP 7.3
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-73 \
  -t $REPO:7.3 \
  --push \
  .

# PHP 7.4
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-74 \
  -t $REPO:7.4 \
  --push \
  .

# PHP 8.0
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-80 \
  -t $REPO:8.0 \
  --push \
  .

# PHP 8.1
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-81 \
  -t $REPO:8.1 \
  --push \
  .

# PHP 8.2
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-82 \
  -t $REPO:8.2 \
  --push \
  .

# PHP 8.3
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-83 \
  -t $REPO:8.3 \
  --push \
  .

# PHP 8.4
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-84 \
  -t $REPO:8.4 \
  --push \
  .

# PHP 8.5 (also tagged as latest)
docker buildx build \
  --platform $PLATFORMS \
  -f DockerFile-85 \
  -t $REPO:8.5 \
  -t $REPO:latest \
  --push \
  .

echo "Done. Images pushed:"
echo "  $REPO:7.1"
echo "  $REPO:7.2"
echo "  $REPO:7.3"
echo "  $REPO:7.4"
echo "  $REPO:8.0"
echo "  $REPO:8.1"
echo "  $REPO:8.2"
echo "  $REPO:8.3"
echo "  $REPO:8.4"
echo "  $REPO:8.5"
echo "  $REPO:latest"
