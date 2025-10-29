#!/bin/bash
# Permanent Effects - Auto-applies to all players

echo "✨ Starting Permanent Effects System..."
echo "   - Night Vision"
echo "   - Haste (Fast Mining)"

while true; do
    # Give night vision and haste to all online players every 30 seconds
    mcrcon -H localhost -P 25575 -p minecraft123 'effect give @a night_vision 60 1 true' > /dev/null 2>&1
    mcrcon -H localhost -P 25575 -p minecraft123 'effect give @a haste 60 2 true' > /dev/null 2>&1
    sleep 30
done
