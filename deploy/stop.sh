#!/bin/bash
set -eo pipefail

source .env || { echo "Error: .env not found"; exit 1; }

exec > >(tee -a deploy.log) 2>&1
echo -e "\n=== $(date) === Stopping services ==="

docker-compose down --remove-orphans
docker system prune -f