#!/bin/bash

# RED ZONE - Create GitHub Release via API

echo "🚀 RED ZONE - Creating GitHub Release via API..."

# Check if we have the built apps
if [ ! -f "dist/RED ZONE-1.0.0.dmg" ]; then
    echo "❌ Error: macOS Intel app not found!"
    echo "Please run 'npm run build:mac' first."
    exit 1
fi

if [ ! -f "dist/RED ZONE-1.0.0-arm64.dmg" ]; then
    echo "❌ Error: macOS ARM64 app not found!"
    echo "Please run 'npm run build:mac' first."
    exit 1
fi

if [ ! -f "dist/RED ZONE Setup 1.0.0.exe" ]; then
    echo "❌ Error: Windows app not found!"
    echo "Please run 'npm run build:win' first."
    exit 1
fi

# Get current version from package.json
VERSION=$(node -p "require('./package.json').version")
echo "📦 Version: $VERSION"

# Check for GitHub token
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Error: GITHUB_TOKEN environment variable not set!"
    echo "Please set your GitHub token:"
    echo "export GITHUB_TOKEN=your_github_token_here"
    echo ""
    echo "To get a token:"
    echo "1. Go to https://github.com/settings/tokens"
    echo "2. Click 'Generate new token'"
    echo "3. Select 'repo' permissions"
    echo "4. Copy the token and set it as GITHUB_TOKEN"
    exit 1
fi

# Repository details
REPO_OWNER="favstats"
REPO_NAME="redzone"
TAG_NAME="v$VERSION"
RELEASE_NAME="RED ZONE v$VERSION"

# Create release notes
RELEASE_BODY=$(cat << 'EOF'
# 🎮 RED ZONE v1.0.0

## 🚀 Desktop Applications

This release includes desktop applications for:

### 🍎 macOS
- **Intel Mac**: `RED ZONE-1.0.0.dmg` (98MB)
- **Apple Silicon**: `RED ZONE-1.0.0-arm64.dmg` (93MB)

### 🪟 Windows
- **Windows 10/11**: `RED ZONE Setup 1.0.0.exe` (76MB)

## 🎯 Game Features

### 🎮 **Weapon Arsenal**
- **Pistol** - Reliable starting weapon
- **SMG** - Rapid-fire automatic weapon
- **Shotgun** - Devastating close-range damage
- **Marksman Rifle** - High-precision long-range weapon
- **LMG** - Heavy firepower with large magazine
- **Sniper Rifle** - Extreme damage with piercing rounds
- **Grenade Launcher** - Explosive area damage
- **Flamethrower** - Continuous fire with burn damage

### 🏗️ **Defensive Structures**
- **Turrets** - Automated defense with multiple types
- **Barricades** - Block enemy movement and provide cover
- **Vines** - Slow and damage enemies
- **Mines** - Explosive traps for area denial

### 🤖 **AI Allies**
- **Wolf** - Fast, aggressive soldiers
- **Bear** - Steady, high-damage units
- **Owl** - Precise long-range support
- **Fennec** - Quick, evasive fighters
- **Dolphin** - Healing and revival support

### 🎨 **Visual & Audio Features**
- **Procedural 8-bit Music** - Dynamic background music
- **Particle Effects** - Enhanced visual feedback
- **Dynamic Weather** - Rain, lightning, and fog effects
- **Procedural Background** - Industrial cityscape
- **Screen Effects** - Blood splatter, camera flash, screen shake

## 🎮 How to Play

1. **Download** the appropriate app for your platform
2. **Install** the application
3. **Launch** RED ZONE
4. **Click** "Enter the Red Zone" to begin
5. **Survive** against waves of enemies!

## 🛠️ Technical Details

- **Built with Electron** - Cross-platform desktop apps
- **Pure HTML5/JavaScript** - No external dependencies
- **Canvas Rendering** - Smooth 60fps gameplay
- **Web Audio API** - Dynamic music and sound generation

## 🚀 Installation

### macOS
1. Download the appropriate DMG file for your Mac
2. Double-click the DMG to mount it
3. Drag RED ZONE to your Applications folder
4. Launch from Applications

### Windows
1. Download the EXE installer
2. Run the installer and follow the prompts
3. Launch RED ZONE from the Start Menu or Desktop

## 🎯 Controls

- **WASD** - Move
- **Mouse** - Aim and shoot
- **1-8** - Switch weapons
- **T** - Place turret
- **B** - Place barricade
- **H** - Place healing platform
- **Esc** - Pause game

---

**Ready to enter the RED ZONE?** 🎮

*Survive the waves, master the arsenal, and become the ultimate defender!*

---

**Created by:** Fabio Votta  
**Developed with:** Cursor AI  
**License:** MIT
EOF
)

echo "📝 Creating GitHub release..."

# Create the release
RELEASE_RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/json" \
  -d "{
    \"tag_name\": \"$TAG_NAME\",
    \"name\": \"$RELEASE_NAME\",
    \"body\": $(echo "$RELEASE_BODY" | jq -R -s .),
    \"draft\": false,
    \"prerelease\": false
  }" \
  "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases")

# Check if release was created successfully
RELEASE_ID=$(echo "$RELEASE_RESPONSE" | jq -r '.id')
if [ "$RELEASE_ID" = "null" ] || [ -z "$RELEASE_ID" ]; then
    echo "❌ Error creating release:"
    echo "$RELEASE_RESPONSE" | jq -r '.message // .'
    exit 1
fi

echo "✅ Release created successfully! ID: $RELEASE_ID"

# Upload assets
echo "📤 Uploading assets..."

# Upload macOS Intel
echo "📦 Uploading macOS Intel..."
curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/octet-stream" \
  --data-binary "@dist/RED ZONE-1.0.0.dmg" \
  "https://uploads.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/$RELEASE_ID/assets?name=RED%20ZONE-1.0.0.dmg"

# Upload macOS ARM64
echo "📦 Uploading macOS ARM64..."
curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/octet-stream" \
  --data-binary "@dist/RED ZONE-1.0.0-arm64.dmg" \
  "https://uploads.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/$RELEASE_ID/assets?name=RED%20ZONE-1.0.0-arm64.dmg"

# Upload Windows
echo "📦 Uploading Windows..."
curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/octet-stream" \
  --data-binary "@dist/RED ZONE Setup 1.0.0.exe" \
  "https://uploads.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/$RELEASE_ID/assets?name=RED%20ZONE%20Setup%201.0.0.exe"

echo ""
echo "🎉 GitHub release created successfully!"
echo "🌐 View your release at: https://github.com/$REPO_OWNER/$REPO_NAME/releases/tag/$TAG_NAME"
echo ""
echo "📦 Desktop apps are now available for download!"
