#!/bin/bash
set -eo pipefail

source .env || { echo "Error: .env not found"; exit 1; }

exec > >(tee -a deploy.log) 2>&1
echo -e "\n=== $(date) === Building images ==="

build_image() {
  local service=$1
  local repo_var="${service^^}_REPO"
  local repo=${!repo_var}
  
  echo "Building $service from $repo..."
  docker build -t "${DOCKER_REGISTRY}/${service}:latest" "$repo" || {
    echo "Error building $service"; exit 1
  }
}

build_image "frontend"
build_image "backend"
build_image "business-logic"

echo "Image building completed"