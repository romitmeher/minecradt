#!/bin/bash
# Auto-start script for Minecraft server

echo "🚀 Starting Minecraft Server..."
cd /workspaces/minecradt

# Start Minecraft server
nohup ./start.sh > server.log 2>&1 &
echo "⏳ Waiting for server to start..."
sleep 15

# Start playit tunnel
nohup ./playit > playit.log 2>&1 &
echo "🌐 Starting tunnel..."
sleep 5

# Optimize processes
./optimize.sh

# Start auto-save (every 5 seconds)
nohup ./autosave.sh > autosave.log 2>&1 &
echo "💾 Auto-save enabled (every 5 seconds)"

echo ""
echo "✅ Server is ready!"
echo "📡 Address: million-established.gl.joinmc.link"
echo ""
echo "📊 Check status:"
echo "  - Server log: tail -f server.log"
echo "  - Playit log: tail -f playit.log"
echo "  - Players: mcrcon -H localhost -P 25575 -p minecraft123 'list'"
