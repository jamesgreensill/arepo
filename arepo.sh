#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

path="$1"

if [ -z "$path" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

if [ -e "$path" ]; then
    echo "Path exists — nothing to create."
else
    echo "Path does not exist — creating..."
    mkdir -p "$path"
fi

cd "$path"

repo_name=$(basename "$path")
if [ ! -f "README.md" ]; then
    echo "# $repo_name" > README.md
    echo "" >> README.md
    echo "This repository was initialized automatically." >> README.md
    echo "Created: $(date)" >> README.md
    echo "Added default README.md"
else
    echo "README.md already exists, skipping."
fi

if [ ! -d ".git" ]; then
    echo "Initializing new Git repository..."
    git init -q
    git add .
    git commit -m "Initial commit" >/dev/null 2>&1 || echo "Nothing to commit"
    if command -v gh >/dev/null 2>&1; then
        echo "Creating remote repo on GitHub: $repo_name"
        gh repo create "$repo_name" --public --source=. --remote=origin --push
    else
        echo "itHub CLI not found (gh). Skipping remote creation."
        echo "You can manually set the remote later:"
        echo "  git remote add origin <your_repo_url>"
        echo "  git push -u origin main"
    fi
else
    echo "Git repo already initialized here."
fi
