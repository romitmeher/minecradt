#!/bin/bash
# Oracle Cloud Setup Script for Minecraft Server
# Run this script on your Oracle Cloud VM after creation

echo "🚀 Setting up Minecraft Server on Oracle Cloud..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install Java 21
echo "📦 Installing Java 21..."
sudo apt install -y openjdk-21-jre-headless

# Install required tools
sudo apt install -y wget curl git screen

# Create minecraft directory
mkdir -p ~/minecraft
cd ~/minecraft

# Download Minecraft server
echo "⬇️ Downloading Minecraft 1.21.10..."
wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

# Accept EULA
echo "eula=true" > eula.txt

# Download playit for tunnel
echo "⬇️ Downloading playit.gg tunnel..."
curl -SsL https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o playit
chmod +x playit

# Create optimized start script
cat > start.sh << 'EOF'
#!/bin/bash
java -Xmx8G -Xms4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
EOF
chmod +x start.sh

# Create server.properties with optimized settings
cat > server.properties << 'EOF'
enable-jmx-monitoring=false
rcon.port=25575
level-seed=
gamemode=survival
enable-command-block=false
enable-query=false
generator-settings={}
enforce-secure-profile=true
level-name=world
motd=A Minecraft Server - Oracle Cloud
query.port=25565
pvp=true
generate-structures=true
max-chained-neighbor-updates=1000000
difficulty=easy
network-compression-threshold=128
max-players=50
max-tick-time=60000
require-resource-pack=false
use-native-transport=true
max-world-size=29999984
enable-status=true
allow-flight=false
initial-enabled-packs=vanilla
broadcast-rcon-to-ops=true
view-distance=12
server-ip=
resource-pack-prompt=
allow-nether=true
server-port=25565
enable-rcon=true
sync-chunk-writes=false
op-permission-level=4
prevent-proxy-connections=false
hide-online-players=false
resource-pack=
entity-broadcast-range-percentage=80
simulation-distance=8
rcon.password=minecraft123
player-idle-timeout=0
debug=false
force-gamemode=false
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
function-permission-level=2
initial-disabled-packs=
level-type=minecraft\:normal
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
spawn-protection=16
resource-pack-sha1=
max-world-size=29999984
online-mode=false
EOF

# Create systemd service for auto-start
echo "🔧 Creating systemd service..."
sudo tee /etc/systemd/system/minecraft.service > /dev/null << 'EOF'
[Unit]
Description=Minecraft Server
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME/minecraft
ExecStart=$HOME/minecraft/start.sh
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Replace $USER and $HOME in service file
sudo sed -i "s|\$USER|$(whoami)|g" /etc/systemd/system/minecraft.service
sudo sed -i "s|\$HOME|$HOME|g" /etc/systemd/system/minecraft.service

# Enable and start service
sudo systemctl daemon-reload
sudo systemctl enable minecraft
sudo systemctl start minecraft

echo ""
echo "✅ Minecraft server installed!"
echo ""
echo "📡 Setting up playit tunnel..."
echo "Run: cd ~/minecraft && ./playit"
echo "Then claim the tunnel at the provided URL"
echo ""
echo "📊 Useful commands:"
echo "  - Check status: sudo systemctl status minecraft"
echo "  - View logs: sudo journalctl -u minecraft -f"
echo "  - Stop server: sudo systemctl stop minecraft"
echo "  - Start server: sudo systemctl start minecraft"
echo "  - Restart server: sudo systemctl restart minecraft"
echo ""
echo "🎮 Server will auto-start on boot!"
