#!/bin/bash
set -eo pipefail

# Загрузка переменных
source .env || { echo "Error: .env not found"; exit 1; }

# Проверка зависимостей
for cmd in git curl docker; do
  command -v $cmd >/dev/null 2>&1 || { echo >&2 "Error: $cmd not installed"; exit 1; }
done

# Логирование
exec > >(tee -a deploy.log) 2>&1
echo -e "\n=== $(date) === Cloning repositories ==="

clone_or_update() {
  local repo=$1
  local url="https://${GITHUB_TOKEN}@github.com/${GITHUB_ORG}/${repo}.git"

  if [ -d "$repo" ]; then
    echo "Updating $repo..."
    cd "$repo"
    git reset --hard HEAD
    git clean -fd
    git checkout "$BRANCH"
    git pull origin "$BRANCH"
    cd ..
  else
    echo "Cloning $repo..."
    git clone -b "$BRANCH" "$url" "$repo"
  fi
}

# Основной процесс
for repo in "$FRONTEND_REPO" "$BACKEND_REPO" "$BUSINESS_LOGIC_REPO"; do
  clone_or_update "$repo"
done

echo "All repositories processed successfully"