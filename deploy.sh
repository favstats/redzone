#!/bin/bash

# RED ZONE - GitHub Pages Deployment Script

echo "🚀 RED ZONE - Deploying to GitHub Pages..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository!"
    echo "Please run this script from the project root directory."
    exit 1
fi

# Check if we have the necessary files
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found!"
    echo "Please ensure the game file exists in the current directory."
    exit 1
fi

# Check if we have a remote origin
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "❌ Error: No remote origin found!"
    echo "Please add a remote origin: git remote add origin <your-repo-url>"
    exit 1
fi

# Get the repository URL
REPO_URL=$(git remote get-url origin)
echo "📦 Repository: $REPO_URL"

# Check if we're on the main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Warning: Not on main branch (currently on $CURRENT_BRANCH)"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Deployment cancelled."
        exit 1
    fi
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  Warning: You have uncommitted changes!"
    read -p "Commit changes before deploying? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📝 Committing changes..."
        git add .
        git commit -m "Update game files before deployment"
    else
        echo "❌ Please commit or stash your changes before deploying."
        exit 1
    fi
fi

# Push to main branch
echo "📤 Pushing to main branch..."
git push origin main

# Extract repository name from URL
if [[ $REPO_URL == *"github.com"* ]]; then
    REPO_NAME=$(echo $REPO_URL | sed 's/.*github\.com[:/]\([^/]*\/[^/]*\).*/\1/')
    REPO_NAME=${REPO_NAME%.git}
    echo "📋 Repository name: $REPO_NAME"
else
    echo "⚠️  Warning: Repository URL doesn't look like GitHub"
    REPO_NAME="your-repo-name"
fi

echo ""
echo "✅ Deployment completed!"
echo ""
echo "🌐 Your game should be available at: https://$REPO_NAME.github.io"
echo "📝 Make sure to enable GitHub Pages in your repository settings!"
echo ""
echo "📋 Next steps:"
echo "1. Go to your repository on GitHub"
echo "2. Go to Settings > Pages"
echo "3. Set Source to 'Deploy from a branch'"
echo "4. Select 'main' branch and '/ (root)' folder"
echo "5. Click Save"
echo ""
echo "🎮 Your game will be live in a few minutes!"
