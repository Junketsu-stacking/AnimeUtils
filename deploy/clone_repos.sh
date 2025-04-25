#!/usr/bin/env bash
set -eo pipefail

# --- Конфигурация ---
BRANCH="production"
LOG_FILE="deploy.log"
REPOS=("WebSiteFrontend" "WebSiteBackend" "ShikimoriApiMicroservice")

# --- Инициализация ---
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT="$SCRIPT_DIR/.."
ENV_FILE="$PROJECT_ROOT/.env"

# --- Логирование ---
exec > >(tee -a "$LOG_FILE") 2>&1
echo -e "\n[$(date +"%Y-%m-%d %T")] === Starting repository setup ==="

# --- Функции ---
load_env() {
    if [ -f "$ENV_FILE" ]; then
        # Безопасная загрузка .env (игнорируем строки с пробелами вокруг =)
        export $(grep -v '^#' "$ENV_FILE" | grep -v '^$' | xargs)
    else
        echo "Error: .env file not found at $ENV_FILE"
        exit 1
    fi

    # Валидация обязательных переменных
    local required_vars=("GITHUB_ORG_NAME" "GITHUB_TOKEN")
    for var in "${required_vars[@]}"; do
        if [ -z "${!var}" ]; then
            echo "Error: Required variable $var is not set in .env"
            exit 1
        fi
    done

    # Установка метода клонирования по умолчанию
    export CLONE_METHOD=${CLONE_METHOD:-"https"}
}

check_dependencies() {
    local deps=("git" "curl" "jq")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo "Error: $dep is not installed"
            exit 1
        fi
    done
}

get_org_repos() {
    echo "Fetching organization repositories..."
    local response
    response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        "https://api.github.com/orgs/$GITHUB_ORG_NAME/repos?per_page=100")
    
    if echo "$response" | jq -e '.[].name' >/dev/null 2>&1; then
        mapfile -t REPOS < <(echo "$response" | jq -r '.[].name')
    else
        echo "Error: Failed to fetch repositories"
        echo "API Response: $response"
        exit 1
    fi
}

clone_repository() {
    local repo=$1
    local url
    
    if [ "$CLONE_METHOD" = "ssh" ]; then
        url="git@github.com:$GITHUB_ORG_NAME/$repo.git"
    else
        url="https://$GITHUB_TOKEN@github.com/$GITHUB_ORG_NAME/$repo.git"
    fi

    echo "Cloning $repo ($CLONE_METHOD)..."
    git clone -b "$BRANCH" "$url" "$repo" || {
        echo "Error: Failed to clone $repo"
        exit 1
    }
}

update_repository() {
    local repo=$1
    echo "Updating $repo..."
    
    cd "$repo" || exit 1
    
    # Reset and clean repository
    git reset --hard HEAD
    git clean -fd
    
    # Checkout to target branch
    git checkout "$BRANCH"
    
    # Pull changes
    git pull origin "$BRANCH" || {
        echo "Error: Failed to pull changes for $repo"
        exit 1
    }
    
    cd ..
}

process_repository() {
    local repo=$1
    
    if [ -d "$repo" ]; then
        if [ -d "$repo/.git" ]; then
            update_repository "$repo"
        else
            echo "Error: $repo exists but is not a git repository"
            exit 1
        fi
    else
        clone_repository "$repo"
    fi
}

# --- Main ---
main() {
    load_env
    check_dependencies
    
    # Если REPOS пуст, получаем все репозитории организации
    if [ ${#REPOS[@]} -eq 0 ]; then
        get_org_repos
    fi

    # Проверка доступа к GitHub
    if ! curl -s -H "Authorization: token $GITHUB_TOKEN" \
        "https://api.github.com/user" | jq -e '.login' >/dev/null; then
        echo "Error: Invalid GitHub token"
        exit 1
    fi

    for repo in "${REPOS[@]}"; do
        process_repository "$repo"
    done
    
    echo "=== Completed successfully ==="
    echo "Repositories processed: ${#REPOS[@]}"
    echo "Branch: $BRANCH"
    echo "Method: $CLONE_METHOD"
}

main "$@"