# Minecraft Server

A Minecraft server setup for the latest version (1.21.10) - **OPTIMIZED FOR PERFORMANCE**

## 🎮 **Server Address**
```
million-established.gl.joinmc.link
```

## 📋 **Server Specifications**

### Version & Settings
- **Minecraft Version:** 1.21.10 (Latest)
- **Server Type:** Vanilla Java Edition
- **Mode:** Survival (Offline/Cracked)
- **Max Players:** 50
- **Difficulty:** Easy

### Performance Optimization
- **Memory:** 8GB allocated (4GB min, 8GB max)
- **GC:** Optimized G1GC with Aikar's flags
- **View Distance:** 12 chunks (optimized for latency)
- **Simulation Distance:** 8 chunks
- **Network Compression:** 128 bytes (low latency)
- **Entity Broadcast:** 80% range

### System Resources
- **CPU:** 4 cores (AMD EPYC 7763)
- **RAM:** 15GB total (8GB for Minecraft)
- **Storage:** SSD

## 🚀 **Quick Start**

### Start the Server
```bash
./start.sh
```

### Connect to Server
1. Open Minecraft Java Edition **1.21.10**
2. Multiplayer → Add Server
3. Server Address: `million-established.gl.joinmc.link`
4. Join and play!

## ⚙️ **Configuration Files**

- `server.properties` - Server settings
- `start.sh` - Startup script with optimized JVM flags
- `eula.txt` - EULA agreement
- `playit` - Tunnel agent for public access

## 📡 **Network Setup**

The server uses **playit.gg** tunnel service for public access:
- Local port: 25565
- Public address: million-established.gl.joinmc.link
- Data Center: Mumbai2 (India)

## 🛠️ **Management**

### Server Commands
- Start: `./start.sh`
- Stop: Type `stop` in server console or `pkill -f server.jar`
- View logs: `tail -f server.log`

### Playit Tunnel
- Start: `./playit`
- Manage: https://playit.gg/account
- Status: `tail -f playit.log`

## 📊 **Performance Tips**

### For Low Ping (Mumbai/India)
1. Already using Mumbai2 data center
2. Network compression optimized to 128 bytes
3. View distance reduced to 12 chunks
4. Entity updates limited to 80%

### Client-Side Settings (for better FPS)
- Render Distance: 8-12 chunks
- Graphics: Fast
- Smooth Lighting: OFF
- Particles: Minimal
- VSync: OFF (use FPS limiter instead)

## 🔒 **Security Notes**

- **Online Mode:** DISABLED (allows cracked clients)
- **Whitelist:** Disabled (anyone can join)
- **Firewall:** Port 25565 forwarded via playit.gg

⚠️ **Warning:** Server runs in offline mode - anyone can join with any username.

## 📝 **Important Notes**

1. Server auto-pauses after 5 minutes of being empty
2. Playit tunnel must be running for public access
3. Git repository cleaned to prevent lag spikes
4. All world data is preserved between restarts

## 🎯 **Server Stats**

- Uptime monitoring via playit.gg
- Memory usage: ~4-5GB during gameplay
- CPU usage: 10-20% average
- Supports: 10-50+ concurrent players

---

**Server optimized for Indian players with low latency settings!** 🇮🇳