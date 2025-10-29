#!/bin/bash
# CODESPACE KEEP-ALIVE - Prevents idle timeout

echo "🔄 Starting Codespace Keep-Alive System..."

# Function to keep terminal active
keep_terminal_alive() {
    while true; do
        # Simulate activity every 5 minutes
        echo -ne "\033[?25l" > /dev/tty 2>/dev/null  # Hide cursor
        sleep 300  # 5 minutes
        echo "[$(date '+%H:%M:%S')] Codespace kept alive" >> /tmp/codespace-keepalive.log
    done
}

# Function to keep VS Code connection active
keep_vscode_alive() {
    while true; do
        # Touch a file to show activity
        touch /tmp/activity-marker
        sleep 180  # 3 minutes
    done
}

# Run both in background
keep_terminal_alive &
keep_vscode_alive &

echo "✅ Keep-Alive system active!"
echo "   - Terminal activity: Every 5 minutes"
echo "   - VS Code activity: Every 3 minutes"
echo "   - Log: /tmp/codespace-keepalive.log"

# Keep this script running
wait
