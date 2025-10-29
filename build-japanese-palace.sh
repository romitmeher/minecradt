#!/bin/bash
# Build MASSIVE Japanese Empire Palace with fully functional rooms
# Center: -1254, 87, 1186

BASE_X=-1254
BASE_Y=87
BASE_Z=1186

echo "🗑️ Clearing existing structure..."
# Clear in chunks
for y in 82 90 98 106; do
  mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-35)) $y $(($BASE_Z-35)) $(($BASE_X+35)) $(($y+7)) $(($BASE_Z+35)) air"
  sleep 0.2
done

echo "🏞️ Creating palace grounds (80x80)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-40)) $(($BASE_Y-1)) $(($BASE_Z-40)) $(($BASE_X+40)) $(($BASE_Y-1)) $(($BASE_Z+40)) stone"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-40)) $BASE_Y $(($BASE_Z-40)) $(($BASE_X+40)) $BASE_Y $(($BASE_Z+40)) smooth_stone"

echo "🏯 Building palace walls (60x60)..."
# Red carpet floor
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-30)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+30)) $(($BASE_Y+1)) $(($BASE_Z+30)) red_carpet"

# Outer walls (red nether brick - Japanese red)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-30)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+30)) $(($BASE_Y+10)) $(($BASE_Z-30)) red_nether_bricks hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-30)) $(($BASE_Y+1)) $(($BASE_Z+30)) $(($BASE_X+30)) $(($BASE_Y+10)) $(($BASE_Z+30)) red_nether_bricks hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-30)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X-30)) $(($BASE_Y+10)) $(($BASE_Z+30)) red_nether_bricks hollow"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+30)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+30)) $(($BASE_Y+10)) $(($BASE_Z+30)) red_nether_bricks hollow"

# Traditional roof
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-32)) $(($BASE_Y+11)) $(($BASE_Z-32)) $(($BASE_X+32)) $(($BASE_Y+11)) $(($BASE_Z+32)) dark_oak_planks"

# Grand entrance (10 blocks wide, 8 tall)
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-5)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+5)) $(($BASE_Y+8)) $(($BASE_Z-30)) air"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-6)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X-6)) $(($BASE_Y+9)) $(($BASE_Z-30)) gold_block"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+6)) $(($BASE_Y+1)) $(($BASE_Z-30)) $(($BASE_X+6)) $(($BASE_Y+9)) $(($BASE_Z-30)) gold_block"

echo "👑 Creating THRONE ROOM (center)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-10)) $(($BASE_Y+1)) $(($BASE_Z-10)) $(($BASE_X+10)) $(($BASE_Y+1)) $(($BASE_Z+10)) quartz_block"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $BASE_X $(($BASE_Y+1)) $(($BASE_Z+5)) gold_block"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $BASE_X $(($BASE_Y+2)) $(($BASE_Z+5)) quartz_stairs[facing=south]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-1)) $(($BASE_Y+3)) $(($BASE_Z+5)) glowstone"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+1)) $(($BASE_Y+3)) $(($BASE_Z+5)) glowstone"

echo "⚔️ Creating ARMORY (left front)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-28)) $(($BASE_Y+1)) $(($BASE_Z-28)) $(($BASE_X-15)) $(($BASE_Y+1)) $(($BASE_Z-15)) stone_bricks"
# Weapon stands
mcrcon -H localhost -P 25575 -p minecraft123 "summon armor_stand $(($BASE_X-25)) $(($BASE_Y+1)) $(($BASE_Z-25)) {ShowArms:1b,HandItems:[{id:'netherite_sword',Count:1b},{}],ArmorItems:[{id:'netherite_boots',Count:1b},{id:'netherite_leggings',Count:1b},{id:'netherite_chestplate',Count:1b},{id:'netherite_helmet',Count:1b}]}"
mcrcon -H localhost -P 25575 -p minecraft123 "summon armor_stand $(($BASE_X-20)) $(($BASE_Y+1)) $(($BASE_Z-25)) {ShowArms:1b,HandItems:[{id:'diamond_sword',Count:1b},{}],ArmorItems:[{id:'diamond_boots',Count:1b},{id:'diamond_leggings',Count:1b},{id:'diamond_chestplate',Count:1b},{id:'diamond_helmet',Count:1b}]}"
# Weapon chest
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-27)) $(($BASE_Y+2)) $(($BASE_Z-20)) chest[facing=east]{Items:[{Slot:0b,id:'netherite_sword',Count:1b},{Slot:1b,id:'netherite_axe',Count:1b},{Slot:2b,id:'bow',Count:1b},{Slot:3b,id:'crossbow',Count:1b},{Slot:4b,id:'arrow',Count:64b},{Slot:5b,id:'shield',Count:1b}]}"

echo "📚 Creating LIBRARY (right front)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+15)) $(($BASE_Y+1)) $(($BASE_Z-28)) $(($BASE_X+28)) $(($BASE_Y+1)) $(($BASE_Z-15)) oak_planks"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+27)) $(($BASE_Y+2)) $(($BASE_Z-27)) $(($BASE_X+27)) $(($BASE_Y+5)) $(($BASE_Z-16)) bookshelf"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+16)) $(($BASE_Y+2)) $(($BASE_Z-27)) $(($BASE_X+26)) $(($BASE_Y+5)) $(($BASE_Z-27)) bookshelf"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+21)) $(($BASE_Y+2)) $(($BASE_Z-21)) enchanting_table"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+24)) $(($BASE_Y+2)) $(($BASE_Z-21)) lectern[facing=west]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+18)) $(($BASE_Y+2)) $(($BASE_Z-21)) crafting_table"

echo "🍖 Creating DINING HALL (left back)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-28)) $(($BASE_Y+1)) $(($BASE_Z+15)) $(($BASE_X-15)) $(($BASE_Y+1)) $(($BASE_Z+28)) spruce_planks"
# Dining table
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-26)) $(($BASE_Y+2)) $(($BASE_Z+20)) $(($BASE_X-17)) $(($BASE_Y+2)) $(($BASE_Z+20)) oak_slab[type=top]"
# Chairs
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-26)) $(($BASE_Y+2)) $(($BASE_Z+19)) oak_stairs[facing=south]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-23)) $(($BASE_Y+2)) $(($BASE_Z+19)) oak_stairs[facing=south]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-20)) $(($BASE_Y+2)) $(($BASE_Z+19)) oak_stairs[facing=south]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-17)) $(($BASE_Y+2)) $(($BASE_Z+19)) oak_stairs[facing=south]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-26)) $(($BASE_Y+2)) $(($BASE_Z+21)) oak_stairs[facing=north]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-23)) $(($BASE_Y+2)) $(($BASE_Z+21)) oak_stairs[facing=north]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-20)) $(($BASE_Y+2)) $(($BASE_Z+21)) oak_stairs[facing=north]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-17)) $(($BASE_Y+2)) $(($BASE_Z+21)) oak_stairs[facing=north]"
# Kitchen appliances
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-27)) $(($BASE_Y+2)) $(($BASE_Z+25)) furnace[facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-27)) $(($BASE_Y+2)) $(($BASE_Z+26)) smoker[facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-27)) $(($BASE_Y+2)) $(($BASE_Z+24)) blast_furnace[facing=east]"
# Food chest
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-26)) $(($BASE_Y+2)) $(($BASE_Z+27)) chest[facing=west]{Items:[{Slot:0b,id:'cooked_beef',Count:64b},{Slot:1b,id:'bread',Count:64b},{Slot:2b,id:'golden_apple',Count:16b},{Slot:3b,id:'cooked_porkchop',Count:64b},{Slot:4b,id:'cake',Count:16b}]}"

echo "🛏️ Creating BEDROOMS (right back)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+15)) $(($BASE_Y+1)) $(($BASE_Z+15)) $(($BASE_X+28)) $(($BASE_Y+1)) $(($BASE_Z+28)) white_wool"
# Multiple beds
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+25)) $(($BASE_Y+2)) $(($BASE_Z+25)) red_bed[part=foot,facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+26)) $(($BASE_Y+2)) $(($BASE_Z+25)) red_bed[part=head,facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+25)) $(($BASE_Y+2)) $(($BASE_Z+20)) red_bed[part=foot,facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+26)) $(($BASE_Y+2)) $(($BASE_Z+20)) red_bed[part=head,facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+18)) $(($BASE_Y+2)) $(($BASE_Z+25)) white_bed[part=foot,facing=east]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+19)) $(($BASE_Y+2)) $(($BASE_Z+25)) white_bed[part=head,facing=east]"
# Storage chests
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+27)) $(($BASE_Y+2)) $(($BASE_Z+27)) chest[facing=west]{Items:[{Slot:0b,id:'diamond',Count:64b},{Slot:1b,id:'emerald',Count:64b},{Slot:2b,id:'gold_ingot',Count:64b}]}"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+20)) $(($BASE_Y+2)) $(($BASE_Z+27)) ender_chest"

echo "⚒️ Creating WORKSHOP (center left)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-28)) $(($BASE_Y+1)) $(($BASE_Z-10)) $(($BASE_X-15)) $(($BASE_Y+1)) $(($BASE_Z+10)) cobblestone"
# Work stations
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-25)) $(($BASE_Y+2)) $(($BASE_Z-5)) crafting_table"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-25)) $(($BASE_Y+2)) $(($BASE_Z)) crafting_table"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-25)) $(($BASE_Y+2)) $(($BASE_Z+5)) anvil"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-20)) $(($BASE_Y+2)) $(($BASE_Z-5)) smithing_table"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-20)) $(($BASE_Y+2)) $(($BASE_Z)) grindstone[face=floor]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-20)) $(($BASE_Y+2)) $(($BASE_Z+5)) stonecutter"
# Tool chest
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-27)) $(($BASE_Y+2)) $(($BASE_Z)) chest[facing=west]{Items:[{Slot:0b,id:'diamond_pickaxe',Count:1b},{Slot:1b,id:'diamond_axe',Count:1b},{Slot:2b,id:'diamond_shovel',Count:1b},{Slot:3b,id:'diamond_hoe',Count:1b},{Slot:4b,id:'shears',Count:1b},{Slot:5b,id:'flint_and_steel',Count:1b}]}"

echo "🧪 Creating ALCHEMY LAB (center right)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+15)) $(($BASE_Y+1)) $(($BASE_Z-10)) $(($BASE_X+28)) $(($BASE_Y+1)) $(($BASE_Z+10)) polished_blackstone"
# Brewing stands
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+25)) $(($BASE_Y+2)) $(($BASE_Z-5)) brewing_stand"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+25)) $(($BASE_Y+2)) $(($BASE_Z)) brewing_stand"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+25)) $(($BASE_Y+2)) $(($BASE_Z+5)) brewing_stand"
# Cauldrons
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+20)) $(($BASE_Y+2)) $(($BASE_Z-5)) water_cauldron[level=3]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+20)) $(($BASE_Y+2)) $(($BASE_Z+5)) water_cauldron[level=3]"
# Potion ingredients chest
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+27)) $(($BASE_Y+2)) $(($BASE_Z)) chest[facing=west]{Items:[{Slot:0b,id:'blaze_powder',Count:64b},{Slot:1b,id:'nether_wart',Count:64b},{Slot:2b,id:'glowstone_dust',Count:64b},{Slot:3b,id:'redstone',Count:64b},{Slot:4b,id:'glass_bottle',Count:64b}]}"

echo "💎 Creating TREASURE VAULT (center back)..."
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-8)) $(($BASE_Y+1)) $(($BASE_Z+15)) $(($BASE_X+8)) $(($BASE_Y+1)) $(($BASE_Z+25)) gold_block"
# Diamond display
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-5)) $(($BASE_Y+2)) $(($BASE_Z+20)) $(($BASE_X+5)) $(($BASE_Y+2)) $(($BASE_Z+20)) diamond_block"
# Treasure chests
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-6)) $(($BASE_Y+2)) $(($BASE_Z+20)) chest[facing=east]{Items:[{Slot:0b,id:'diamond',Count:64b},{Slot:1b,id:'emerald',Count:64b},{Slot:2b,id:'netherite_ingot',Count:64b},{Slot:3b,id:'gold_ingot',Count:64b},{Slot:4b,id:'iron_ingot',Count:64b}]}"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+6)) $(($BASE_Y+2)) $(($BASE_Z+20)) chest[facing=west]{Items:[{Slot:0b,id:'enchanted_golden_apple',Count:64b},{Slot:1b,id:'totem_of_undying',Count:10b},{Slot:2b,id:'elytra',Count:1b},{Slot:3b,id:'netherite_block',Count:64b}]}"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $BASE_X $(($BASE_Y+2)) $(($BASE_Z+22)) ender_chest"

echo "🌸 Creating JAPANESE GARDENS..."
# Front garden
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-12)) $(($BASE_Y+1)) $(($BASE_Z-38)) $(($BASE_X+12)) $(($BASE_Y+1)) $(($BASE_Z-32)) grass_block"
# Cherry blossom trees
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-8)) $(($BASE_Y+2)) $(($BASE_Z-36)) $(($BASE_X-8)) $(($BASE_Y+5)) $(($BASE_Z-36)) oak_log"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-9)) $(($BASE_Y+6)) $(($BASE_Z-37)) $(($BASE_X-7)) $(($BASE_Y+7)) $(($BASE_Z-35)) pink_wool"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+8)) $(($BASE_Y+2)) $(($BASE_Z-36)) $(($BASE_X+8)) $(($BASE_Y+5)) $(($BASE_Z-36)) oak_log"
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X+7)) $(($BASE_Y+6)) $(($BASE_Z-37)) $(($BASE_X+9)) $(($BASE_Y+7)) $(($BASE_Z-35)) pink_wool"
# Stone pathway
mcrcon -H localhost -P 25575 -p minecraft123 "fill $(($BASE_X-3)) $(($BASE_Y+1)) $(($BASE_Z-38)) $(($BASE_X+3)) $(($BASE_Y+1)) $(($BASE_Z-31)) stone_brick_slab"
# Garden lanterns
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-10)) $(($BASE_Y+3)) $(($BASE_Z-35)) lantern"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+10)) $(($BASE_Y+3)) $(($BASE_Z-35)) lantern"

echo "🔥 Installing palace lighting..."
# Main hall lanterns
for x in -25 -15 -5 5 15 25; do
  for z in -25 -15 -5 5 15 25; do
    mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+$x)) $(($BASE_Y+8)) $(($BASE_Z+$z)) lantern[hanging=true]"
  done
done

echo "🎌 Adding imperial banners..."
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-15)) $(($BASE_Y+8)) $(($BASE_Z-29)) red_banner[rotation=8]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+15)) $(($BASE_Y+8)) $(($BASE_Z-29)) red_banner[rotation=8]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X-29)) $(($BASE_Y+8)) $(($BASE_Z-15)) red_banner[rotation=4]"
mcrcon -H localhost -P 25575 -p minecraft123 "setblock $(($BASE_X+29)) $(($BASE_Y+8)) $(($BASE_Z+15)) red_banner[rotation=12]"

echo "✅ JAPANESE EMPIRE PALACE COMPLETE!"
mcrcon -H localhost -P 25575 -p minecraft123 "say ⛩️🏯 JAPANESE EMPIRE PALACE is complete!"
mcrcon -H localhost -P 25575 -p minecraft123 "say 📜 8 FUNCTIONAL ROOMS: Throne Room, Armory, Library, Dining Hall, Bedrooms, Workshop, Alchemy Lab, Treasure Vault!"
mcrcon -H localhost -P 25575 -p minecraft123 "say 🎌 60x60 palace with full equipment, tools, beds, enchanting, brewing, and treasure chests!"
mcrcon -H localhost -P 25575 -p minecraft123 "say 👑 Long live the Emperor!"
