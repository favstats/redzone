#!/usr/bin/env node

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('🚀 RED ZONE - Building Desktop Applications...\n');

// Check if package.json exists
if (!fs.existsSync('package.json')) {
  console.error('❌ package.json not found! Please run npm init first.');
  process.exit(1);
}

// Check if index.html exists
if (!fs.existsSync('index.html')) {
  console.error('❌ index.html not found! Please ensure the game file exists.');
  process.exit(1);
}

// Install dependencies if node_modules doesn't exist
if (!fs.existsSync('node_modules')) {
  console.log('📦 Installing dependencies...');
  try {
    execSync('npm install', { stdio: 'inherit' });
    console.log('✅ Dependencies installed successfully!\n');
  } catch (error) {
    console.error('❌ Failed to install dependencies:', error.message);
    process.exit(1);
  }
}

// Create assets directory if it doesn't exist
if (!fs.existsSync('assets')) {
  fs.mkdirSync('assets');
  console.log('📁 Created assets directory');
}

// Build for all platforms
const platforms = [
  { name: 'Windows', command: 'npm run build:win' },
  { name: 'macOS', command: 'npm run build:mac' },
  { name: 'Linux', command: 'npm run build:linux' }
];

console.log('🔨 Building desktop applications...\n');

platforms.forEach(platform => {
  console.log(`🏗️  Building for ${platform.name}...`);
  try {
    execSync(platform.command, { stdio: 'inherit' });
    console.log(`✅ ${platform.name} build completed!\n`);
  } catch (error) {
    console.error(`❌ ${platform.name} build failed:`, error.message);
    console.log(`💡 Note: ${platform.name} builds may require specific dependencies or may not work on all systems.\n`);
  }
});

console.log('🎉 Build process completed!');
console.log('📁 Check the "dist" folder for your desktop applications.');
console.log('\n📋 Available commands:');
console.log('  npm start          - Run the game in Electron');
console.log('  npm run build      - Build for current platform');
console.log('  npm run build:win  - Build for Windows');
console.log('  npm run build:mac  - Build for macOS');
console.log('  npm run build:linux - Build for Linux');
console.log('\n🚀 Ready for release!');
