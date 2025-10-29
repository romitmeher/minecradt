#!/bin/bash
# Build MASSIVE Japanese Empire Palace with fully functional rooms
# Center: -1254, 87, 1186

BASE_X=-1254
BASE_Y=87
BASE_Z=1186

echo "🗑️ Clearing area for JAPANESE EMPIRE PALACE..."
# Clear in smaller chunks to avoid limit
for x_offset in -30 -10 10; do
  for z_offset in -30 -10 10; do
    mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+$x_offset)) $(($BASE_Y-5)) $(($BASE_Z+$z_offset)) $(($BASE_X+$x_offset+20)) $(($BASE_Y+25)) $(($BASE_Z+$z_offset+20)) air"
    sleep 0.1
  done
done

echo "🏞️ Creating palace grounds..."
# Create flat stone platform (80x80)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-40)) $(($BASE_Y-1)) $(($BASE_Z-40)) $(($BASE_X+40)) $(($BASE_Y-1)) $(($BASE_Z+40)) stone"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-40)) $BASE_Y $(($BASE_Z-40)) $(($BASE_X+40)) $BASE_Y $(($BASE_Z+40)) smooth_stone"

echo "� Building JAPANESE EMPIRE PALACE..."

# === MAIN BUILDING (40x40) ===
# Foundation (polished blackstone)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $BASE_Y $(($BASE_Z-20)) $(($BASE_X+20)) $BASE_Y $(($BASE_Z+20)) polished_blackstone"

# Outer walls - First floor (white quartz, 8 blocks high)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+8)) $(($BASE_Z-20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z+20)) $(($BASE_X+20)) $(($BASE_Y+8)) $(($BASE_Z+20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X-20)) $(($BASE_Y+8)) $(($BASE_Z+20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+20)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+8)) $(($BASE_Z+20)) quartz_block hollow"

# Second floor
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+9)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+9)) $(($BASE_Z+20)) quartz_slab[type=double]"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+10)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+17)) $(($BASE_Z-20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+10)) $(($BASE_Z+20)) $(($BASE_X+20)) $(($BASE_Y+17)) $(($BASE_Z+20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+10)) $(($BASE_Z-20)) $(($BASE_X-20)) $(($BASE_Y+17)) $(($BASE_Z+20)) quartz_block hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+20)) $(($BASE_Y+10)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+17)) $(($BASE_Z+20)) quartz_block hollow"

# Roof (dark oak slabs)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-21)) $(($BASE_Y+18)) $(($BASE_Z-21)) $(($BASE_X+21)) $(($BASE_Y+18)) $(($BASE_Z+21)) dark_oak_slab"

# Grand entrance (6 blocks wide, 7 tall)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-3)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X+3)) $(($BASE_Y+7)) $(($BASE_Z-20)) air"

# Entrance pillars (blackstone)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-4)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X-4)) $(($BASE_Y+7)) $(($BASE_Z-20)) polished_blackstone"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+4)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X+4)) $(($BASE_Y+7)) $(($BASE_Z-20)) polished_blackstone"

# Large windows - First floor (glass)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-17)) $(($BASE_Y+3)) $(($BASE_Z-20)) $(($BASE_X-10)) $(($BASE_Y+6)) $(($BASE_Z-20)) glass"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+10)) $(($BASE_Y+3)) $(($BASE_Z-20)) $(($BASE_X+17)) $(($BASE_Y+6)) $(($BASE_Z-20)) glass"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+3)) $(($BASE_Z-10)) $(($BASE_X-20)) $(($BASE_Y+6)) $(($BASE_Z+10)) glass"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+20)) $(($BASE_Y+3)) $(($BASE_Z-10)) $(($BASE_X+20)) $(($BASE_Y+6)) $(($BASE_Z+10)) glass"

# Second floor windows
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-17)) $(($BASE_Y+12)) $(($BASE_Z-20)) $(($BASE_X-10)) $(($BASE_Y+15)) $(($BASE_Z-20)) glass"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+10)) $(($BASE_Y+12)) $(($BASE_Z-20)) $(($BASE_X+17)) $(($BASE_Y+15)) $(($BASE_Z-20)) glass"

# Interior lighting (glowstone grid)
for x in -15 -5 5 15; do
  for z in -15 -5 5 15; do
    mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+$x)) $(($BASE_Y+7)) $(($BASE_Z+$z)) glowstone"
    mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+$x)) $(($BASE_Y+16)) $(($BASE_Z+$z)) glowstone"
  done
done

# Corner towers (quartz pillars)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X-20)) $(($BASE_Y+20)) $(($BASE_Z-20)) quartz_pillar"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+20)) $(($BASE_Y+1)) $(($BASE_Z-20)) $(($BASE_X+20)) $(($BASE_Y+20)) $(($BASE_Z-20)) quartz_pillar"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z+20)) $(($BASE_X-20)) $(($BASE_Y+20)) $(($BASE_Z+20)) quartz_pillar"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+20)) $(($BASE_Y+1)) $(($BASE_Z+20)) $(($BASE_X+20)) $(($BASE_Y+20)) $(($BASE_Z+20)) quartz_pillar"

# Garden pathway (stone brick path)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-3)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+3)) $(($BASE_Y+1)) $(($BASE_Z-21)) stone_brick_slab"

# Decorative garden lights
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-5)) $(($BASE_Y+1)) $(($BASE_Z-25)) sea_lantern"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+5)) $(($BASE_Y+1)) $(($BASE_Z-25)) sea_lantern"

# Welcome sign
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X)) $(($BASE_Y+1)) $(($BASE_Z-22)) oak_sign[rotation=8]{front_text:{messages:'[\"\\\"Welcome to\\\"\",\"\\\"MEGA MANSION\\\"\",\"\\\"\\\"\",\"\\\"\\\"\"]'}}"

echo "✅ MEGA MANSION COMPLETE!"
mcrcon -H localhost -P 25575 -p minecraft123 "say 🏰 MEGA MANSION is ready! 40x40 with 2 floors! Come check it out!"
