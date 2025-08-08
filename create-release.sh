#!/bin/bash

# RED ZONE - Create GitHub Release Script

echo "🚀 RED ZONE - Creating GitHub Release..."

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

# Create release notes
cat > release-notes.md << EOF
# 🎮 RED ZONE v$VERSION

## 🚀 Desktop Applications

This release includes desktop applications for:

### 🍎 macOS
- **Intel Mac**: \`RED ZONE-1.0.0.dmg\` (98MB)
- **Apple Silicon**: \`RED ZONE-1.0.0-arm64.dmg\` (93MB)

### 🪟 Windows
- **Windows 10/11**: \`RED ZONE Setup 1.0.0.exe\` (76MB)

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

echo "📝 Release notes created: release-notes.md"
echo ""
echo "📋 Next steps:"
echo "1. Go to https://github.com/favstats/redzone/releases"
echo "2. Click 'Create a new release'"
echo "3. Set tag to 'v$VERSION'"
echo "4. Set title to 'RED ZONE v$VERSION'"
echo "5. Copy content from release-notes.md"
echo "6. Upload the files from dist/ folder:"
echo "   - RED ZONE-1.0.0.dmg"
echo "   - RED ZONE-1.0.0-arm64.dmg"
echo "   - RED ZONE Setup 1.0.0.exe"
echo "7. Publish the release!"
echo ""
echo "🎮 Your desktop apps are ready for release!"
