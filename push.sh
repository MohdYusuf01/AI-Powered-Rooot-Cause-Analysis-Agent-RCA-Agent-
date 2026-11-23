#!/bin/bash

# Navigate to project root
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "========================================================"
echo "   Push to GitHub: AI-Powered Root Cause Analysis Agent"
echo "========================================================"
echo ""

read -p "Enter your GitHub repository URL (e.g. https://github.com/USERNAME/REPO.git): " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "No repository URL provided. Aborting."
    exit 1
fi

# Set remote origin
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"

echo ""
echo "Pushing code to $REPO_URL..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================================"
    echo "  SUCCESS: Code successfully pushed to GitHub!"
    echo "========================================================"
else
    echo ""
    echo "[!] Push failed. If authentication was rejected:"
    echo "    1. Use a Personal Access Token (PAT) with 'repo' scope as your password"
    echo "       (Generate one at: https://github.com/settings/tokens)"
    echo "    2. Or use SSH URL: git@github.com:USERNAME/REPO.git"
fi
