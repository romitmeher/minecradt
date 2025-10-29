#!/bin/bash
# Auto-save every 5 seconds

echo "💾 Starting auto-save (every 5 seconds)..."

while true; do
    sleep 5
    mcrcon -H localhost -P 25575 -p minecraft123 "save-all" > /dev/null 2>&1
    echo "[$(date '+%H:%M:%S')] World saved"
done
