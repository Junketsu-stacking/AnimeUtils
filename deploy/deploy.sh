#!/bin/bash
set -eo pipefail

source .env || { echo "Error: .env not found"; exit 1; }

exec > >(tee -a deploy.log) 2>&1
echo -e "\n=== $(date) === Full deployment ==="

./clone_repos.sh
./build.sh
./start.sh

echo "Deployment completed successfully"