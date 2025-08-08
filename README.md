# 🎮 RED ZONE: Arsenal Update

A thrilling top-down survival shooter where you defend the perimeter against waves of zombies using an arsenal of weapons and defensive structures.

![RED ZONE Gameplay](https://img.shields.io/badge/Status-Playable-brightgreen)
![Version](https://img.shields.io/badge/Version-Arsenal%20Update-blue)
![Platform](https://img.shields.io/badge/Platform-Web%20Browser-lightgrey)
![Made with Cursor](https://img.shields.io/badge/Made%20with-Cursor%20AI-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 🎯 Game Overview

RED ZONE is an intense survival shooter where you must hold your ground against increasingly difficult waves of enemies. With the Arsenal Update, you now have access to multiple weapons, defensive structures, and AI allies to help you survive.

## ✨ Features

### 🎯 **Weapon Arsenal**
- **Pistol** - Reliable starting weapon
- **SMG** - Rapid-fire automatic weapon
- **Shotgun** - Devastating close-range damage
- **Marksman Rifle** - High-precision long-range weapon
- **LMG** - Heavy firepower with large magazine
- **Sniper Rifle** - Extreme damage with piercing rounds
- **Grenade Launcher** - Explosive area damage
- **Flamethrower** - Continuous fire with burn damage

### 🏗️ **Defensive Structures**
- **Turrets** - Automated defense with multiple types:
  - Basic Turret - Balanced firepower
  - Heavy Turret - High damage, slower fire rate
  - Sniper Turret - Long-range precision
  - Shotgun Turret - Close-range spread damage
  - Flamethrower Turret - Continuous fire with burn effects
- **Barricades** - Block enemy movement and provide cover
- **Vines** - Slow and damage enemies
- **Mines** - Explosive traps for area denial

### 🤖 **AI Allies**
- **Wolf** - Fast, aggressive soldiers
- **Bear** - Steady, high-damage units
- **Owl** - Precise long-range support
- **Fennec** - Quick, evasive fighters
- **Dolphin** - Healing and revival support

### 🎮 **Gameplay Mechanics**
- **Wave System** - Progressive difficulty with boss battles
- **Combo System** - Chain kills for bonus points
- **Power Mode** - Rare activation for devastating firepower
- **Special Abilities** - Random powerful effects
- **Auto-Reload** - Automatic weapon reloading
- **Damage Numbers** - Visual feedback for hits
- **Healing Platforms** - Restore ally health
- **Graveyard System** - Fallen allies leave graves
- **Revival Mechanics** - Dolphin can revive fallen allies

### 🎨 **Visual & Audio Features**
- **Procedural 8-bit Music** - Dynamic background music
- **Particle Effects** - Enhanced visual feedback
- **Dynamic Weather** - Rain, lightning, and fog effects
- **Procedural Background** - Industrial cityscape
- **Screen Effects** - Blood splatter, camera flash, screen shake

## 🎮 Controls

### **Movement & Combat**
- **WASD** - Move
- **Mouse** - Aim
- **Left Click** - Fire weapon
- **R** - Reload
- **Space** - Dash (consumes stamina)

### **Weapon Selection**
- **1-8** - Switch weapons
- **Tab** - Switch turret type

### **Defensive Structures**
- **T** - Place turret
- **B** - Place barricade
- **V** - Place vines
- **M** - Place mine
- **H** - Place healing platform

### **Special Actions**
- **Q** - Activate special ability
- **F** - Toggle damage numbers
- **R** - Toggle auto-reload
- **Esc** - Pause game

## 🚀 How to Play

1. **Start the Game** - Click "Enter the Red Zone" to begin
2. **Prepare** - Use the first 20 seconds to place defensive structures
3. **Survive** - Defend against waves of enemies from all directions
4. **Collect** - Pick up weapon drops and power-ups
5. **Upgrade** - Unlock new weapons and improve your arsenal
6. **Survive** - Reach higher waves for greater challenges

## 🎯 Gameplay Tips

### **Early Game**
- Place turrets strategically around your position
- Use barricades to create chokepoints
- Collect weapon drops to expand your arsenal
- Stay mobile to avoid being surrounded

### **Mid Game**
- Manage your ammunition carefully
- Use special abilities at key moments
- Coordinate with AI allies
- Build combos for bonus points

### **Late Game**
- Master weapon switching for different situations
- Use power mode strategically
- Maintain defensive structures
- Prepare for boss battles

## 🏆 Scoring System

- **Base Score** - Points for each enemy killed
- **Combo Multiplier** - Chain kills for bonus points
- **Wave Bonus** - Higher waves give more points
- **Survival Time** - Longer survival = higher score

## 🎨 Visual Features

- **Dynamic Lighting** - Day/night cycle affects visibility
- **Particle Effects** - Explosions, muzzle flashes, and impacts
- **Smooth Animations** - Fluid movement and combat
- **Visual Feedback** - Damage numbers, health bars, and status effects
- **Atmospheric Design** - Dark, gritty survival aesthetic

## 🎵 Audio Features

- **Procedural Sound Effects** - Dynamic weapon sounds
- **Impact Audio** - Realistic hit and explosion sounds
- **Atmospheric Audio** - Immersive game environment
- **8-bit Music Generation** - Dynamic background music

## 🛠️ Technical Details

- **Pure HTML5/JavaScript** - No external dependencies
- **Canvas Rendering** - Smooth 60fps gameplay
- **Responsive Design** - Works on various screen sizes
- **Cross-Platform** - Runs in any modern web browser

## 🚀 Installation

### Browser Version
1. Download the `index.html` file
2. Open it in any modern web browser
3. Click "Enter the Red Zone" to start playing

### Desktop Version
Download the latest release for your platform:
- **Windows**: `redzone-windows.exe`
- **macOS**: `redzone-macos.app`
- **Linux**: `redzone-linux`

## 🛠️ Development

### Prerequisites
- Modern web browser (Chrome, Firefox, Safari, Edge)
- No additional dependencies required

### Local Development
1. Clone the repository:
```bash
git clone https://github.com/fabiovotta/redzone.git
cd redzone
```

2. Open `index.html` in your browser or use a local server:
```bash
# Using Python
python -m http.server 8000

# Using Node.js
npx serve .

# Using PHP
php -S localhost:8000
```

3. Navigate to `http://localhost:8000` in your browser

## 📦 Building Desktop Version

### Using Electron
1. Install Node.js and npm
2. Install dependencies:
```bash
npm install
```

3. Build the desktop app:
```bash
npm run build
```

4. Or use the automated script:
```bash
node build.js
```

## 🎨 Game Architecture

### Core Systems
- **Game Loop**: 60 FPS update and render cycle
- **Entity System**: Player, enemies, allies, projectiles, and structures
- **AI System**: Pathfinding, behavior trees, and personality-based actions
- **Audio System**: Procedural music generation and sound effects
- **Particle System**: Visual effects and feedback
- **UI System**: HUD, menus, and screen management

### Technical Features
- **Canvas 2D Rendering**: Smooth graphics and animations
- **Web Audio API**: Dynamic music and sound generation
- **Local Storage**: Settings and progress persistence
- **Responsive Design**: Works on various screen sizes
- **Performance Optimized**: Efficient rendering and update loops

## 🌐 Browser Compatibility

- ✅ Chrome/Chromium
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ Mobile browsers (with touch controls)

## 🎮 Game Modes

- **Survival Mode** - Endless waves with increasing difficulty
- **Boss Battles** - Special boss encounters at wave 5
- **Night Mode** - Toggle for atmospheric lighting changes

## 🔧 Customization

The game includes various settings and features:
- **Auto-reload** - Automatic weapon reloading
- **Damage Numbers** - Visual damage feedback
- **Turret Types** - Multiple defensive options
- **Weapon Drops** - Progressive weapon unlocking
- **Settings Menu** - Customize audio, graphics, and gameplay
- **Skill Tree** - Upgrade health, speed, damage, reload, and stamina

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Guidelines
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Fabio Votta**
- **GitHub**: [@fabiovotta](https://github.com/fabiovotta)
- **Game**: Developed with Cursor AI

## 🙏 Acknowledgments

- **Cursor AI**: For helping bring this game to life
- **Web Audio API**: For the procedural music system
- **Canvas API**: For the smooth graphics and animations
- **All players**: Who will defend the Red Zone!

## 📈 Roadmap

### Future Features
- [ ] Multiplayer support
- [ ] More enemy types
- [ ] Additional weapons and abilities
- [ ] Campaign mode
- [ ] Mobile support
- [ ] Steam release

### Known Issues
- Performance may vary on older devices
- Audio settings require page refresh to apply
- Some browsers may have minor rendering differences

## 📊 Game Statistics

- **Lines of Code**: ~8,000+
- **File Size**: ~400KB
- **Supported Browsers**: Chrome, Firefox, Safari, Edge
- **Development Time**: Created with Cursor AI
- **License**: MIT

---

**Ready to enter the RED ZONE?** 🎮

*Survive the waves, master the arsenal, and become the ultimate defender!*
