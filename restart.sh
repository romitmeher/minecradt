#!/bin/bash
# Safe restart script - saves world before restarting

echo "🛑 Preparing to restart server..."

# Warn players
mcrcon -H localhost -P 25575 -p minecraft123 "say Server restarting in 10 seconds! Saving world..."
sleep 3

# Force save
echo "💾 Saving world..."
mcrcon -H localhost -P 25575 -p minecraft123 "save-all flush"
sleep 2

# Stop server gracefully
echo "🛑 Stopping server..."
mcrcon -H localhost -P 25575 -p minecraft123 "stop"
sleep 5

# Kill playit
pkill playit
sleep 2

# Start everything again
echo "🚀 Starting server..."
./autostart.sh

echo "✅ Server restarted successfully!"
