#!/bin/bash
# Performance optimization script

# Reduce VS Code extensions CPU usage
echo "Reducing VS Code background processes..."

# Set CPU nice priority for non-critical processes
renice +10 -p $(pgrep -f "redhat.java") 2>/dev/null
renice +10 -p $(pgrep -f "extensionHost") 2>/dev/null

# Give Minecraft server higher priority
renice -5 -p $(pgrep -f "server.jar") 2>/dev/null
renice -5 -p $(pgrep playit) 2>/dev/null

echo "✅ Process priorities optimized"
echo "Minecraft server and playit tunnel now have higher CPU priority"
echo "VS Code extensions have lower priority to reduce interference"
