# Enhanced Vanilla datapack
A collection of datapacks which "enhance" the vanilla Minecraft experience

## Description of modules
* `days_since_death`: This datapack keeps track of the world age (in days) and of the number of days since the player last died. The datapack shows both statistics each morning as a title to the player. It also stores the longest survival streak in a scoreboard.
* `lose_xp`: This datapack makes the player lose their experience points even when gamerule `keepInventory` is set to `true`.
* `one_player_sleep`: This datapack fast forwards time when a player is lying in bed, thus allowing "one player sleep" on multiplayer servers. This way of skipping the night does not reset the world age. It also clears the weather upon sleeping.
* `potion_of_recall`: This datapack introduces a "Potion of Recall" which teleports the player back to their spawn when they drink the potion. It also keeps track of the amount of potions used. The potion itself is not yet available in the vanilla loot tables and only obtainable by commands.
* `vanilla_tweaks`: This datapack features some small loot table and crafting recipe adjustments:
	* Jungle temple dispenser now can contain spectral arrows, several tipped arrows (slowness, poison, weakness, leaping, healing, strong poison) and splash potions (slowness, poison, weakness)
	* The [Ender Dragon](https://minecraft.gamepedia.com/Ender_Dragon) drops [Elytra](https://minecraft.gamepedia.com/Elytra) upon death
	* [Arrows](https://minecraft.gamepedia.com/Arrow) can now additionally be crafted with [Iron Nuggets](https://minecraft.gamepedia.com/Iron_Nugget) or [Prismarine Shards](https://minecraft.gamepedia.com/Prismarine_Shard) in place of [Flint](https://minecraft.gamepedia.com/Flint)
	* In recipes where [Blackstone](https://minecraft.gamepedia.com/Blackstone) can replace [Cobblestone](https://minecraft.gamepedia.com/Cobblestone) ([Furnace](https://minecraft.gamepedia.com/Furnace), Stone [tools](https://minecraft.gamepedia.com/Tool)/[weapons](https://minecraft.gamepedia.com/Weapons)) the player can also use [Andesite](https://minecraft.gamepedia.com/Andesite) [Diorite](https://minecraft.gamepedia.com/Diorite) or [Granite](https://minecraft.gamepedia.com/Granite)
	* It is possible to craft *four* [Clay Balls](https://minecraft.gamepedia.com/Clay_Ball) out of a single [Clay block](https://minecraft.gamepedia.com/Clay) (thus making the Clay Ball → Clay recipe reversible)
	* It is possible to craft *nine* [Nether Warts](https://minecraft.gamepedia.com/Nether_Wart) out of a single [Nether Wart block](https://minecraft.gamepedia.com/Nether_Wart_Block) (thus making the Nether Wart → Nether Wart block recipe reversible)
	* Smoking [Rotten Flesh](https://minecraft.gamepedia.com/Rotten_Flesh) in the [Smoker](https://minecraft.gamepedia.com/Smoker) yields [Leather](https://minecraft.gamepedia.com/Leather)
	
## Screenshots
![days_since_death title](https://raw.githubusercontent.com/phistoh/enhanced_vanilla/master/.readme/days_since_death_1.png)
	
## Installation

## Technical Information
* `days_since_death`: 
* `lose_xp`: The datapack simply sets the level of a player to zero when they die.
* `potion_of_recall`: The datapack creates an "end portal" block near the void in the End. Upon drinking the potion the player gets teleport just above the portal. They then fall into it and teleport back to their spawn. This has the advantage that the datapack does not need to store the player's current spawn point because the game keeps track of it. The drawback though is, that the player encounters two loading screens (one for teleporting to the End and one for teleporting back) and that they see the credits prematurely if they drink their first potion before leaving the end the intended way. Though the datapack keeps track of the respective "End advancements" and does not grant them prematurely.

## Changes
- **1.0**: Initial upload

## Ideas / To do
[ ] Feather artifact which grants the slow falling effect when a player holds it in their hand or offhand
[ ] Showing the player's coordinates when they hold a compass in their hand or offhand (so the gamerule `reducedDebugInfo` can be used and coordinates become an "ingame feature" instead of a debug feature)
[ ] Making lodestone "cheaper" (so they can be used in early game)
[ ] Make players drop items on death but make them indestructible and increase the despawn timer (thus removing the need for the `keepInventory` gamerule but still making the game a little more forgiving)