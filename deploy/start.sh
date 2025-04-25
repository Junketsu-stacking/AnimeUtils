#!/bin/bash
set -eo pipefail

source .env || { echo "Error: .env not found"; exit 1; }

exec > >(tee -a deploy.log) 2>&1
echo -e "\n=== $(date) === Starting services ==="

docker-compose down --remove-orphans
docker-compose up -d --build

# Проверка состояния
sleep 5
docker-compose ps

echo -e "\nApplication URLs:"
echo "Frontend:    http://localhost:3000"
echo "Backend API: http://localhost:8000"
echo "Business Logic: http://localhost:5000"