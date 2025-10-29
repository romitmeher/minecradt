#!/bin/bash
# MASTER START COMMAND - Starts everything from scratch

echo "🎮 MINECRAFT SERVER MASTER START"
echo "================================"

# Kill any existing processes
echo "🧹 Cleaning up old processes..."
pkill -9 -f "java.*server.jar" 2>/dev/null
pkill -9 playit 2>/dev/null
pkill -9 -f "autosave.sh" 2>/dev/null
sleep 2

# Navigate to directory
cd /workspaces/minecradt

# Start Minecraft server
echo "🚀 Starting Minecraft Server..."
nohup ./start.sh > server.log 2>&1 &
SERVER_PID=$!
echo "   ├─ Server PID: $SERVER_PID"
sleep 15

# Check if server started
if ps -p $SERVER_PID > /dev/null; then
    echo "   └─ ✅ Server running"
else
    echo "   └─ ❌ Server failed to start!"
    exit 1
fi

# Start Playit tunnel
echo "🌐 Starting Playit Tunnel..."
nohup ./playit > playit.log 2>&1 &
PLAYIT_PID=$!
echo "   ├─ Playit PID: $PLAYIT_PID"
sleep 5

# Start auto-save
echo "💾 Starting Auto-Save (5 sec)..."
nohup ./autosave.sh > autosave.log 2>&1 &
SAVE_PID=$!
echo "   └─ AutoSave PID: $SAVE_PID"

# Start permanent night vision
echo "🌙 Starting Permanent Night Vision..."
nohup ./permanent-nightvision.sh > nightvision.log 2>&1 &
NIGHTVISION_PID=$!
echo "   └─ Night Vision PID: $NIGHTVISION_PID"

# Optimize processes
echo "⚡ Optimizing process priorities..."
./optimize.sh > /dev/null 2>&1

# Keep-alive system (prevents Codespace idle timeout)
echo "🔄 Starting Keep-Alive System..."
nohup ./codespace-keepalive.sh > /dev/null 2>&1 &
KEEPALIVE_PID=$!
echo "   └─ KeepAlive PID: $KEEPALIVE_PID"

sleep 3

# Display status
echo ""
echo "✅ ALL SYSTEMS OPERATIONAL!"
echo "================================"
echo "📡 Server Address: million-established.gl.joinmc.link"
echo "👥 Max Players: 50"
echo "💾 Auto-Save: Every 5 seconds"
echo "🔄 Keep-Alive: Active"
echo ""
echo "📊 Process IDs:"
echo "   Server:    $SERVER_PID"
echo "   Playit:    $PLAYIT_PID"
echo "   AutoSave:  $SAVE_PID"
echo "   KeepAlive: $KEEPALIVE_PID"
echo ""
echo "🛠️  Management Commands:"
echo "   Status:  mcrcon -H localhost -P 25575 -p minecraft123 'list'"
echo "   Restart: ./restart.sh"
echo "   Stop:    mcrcon -H localhost -P 25575 -p minecraft123 'stop'"
echo ""
echo "📝 Logs:"
echo "   Server:   tail -f server.log"
echo "   Playit:   tail -f playit.log"
echo "   AutoSave: tail -f autosave.log"
echo ""
echo "🎮 Ready to play!"
