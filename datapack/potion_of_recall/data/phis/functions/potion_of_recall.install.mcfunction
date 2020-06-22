# Mark players as currently teleporting; scoreboard instead of tag because it counts ticks
scoreboard objectives add phis.is_tp dummy
# Keeps track of the number of potions used
scoreboard objectives add phis.pots_used dummy

# Select one player to initialize portal
execute as @p[limit=1] run tag @s add phis.init_player
execute as @a[tag=phis.init_player] run gamemode creative @a[tag=phis.init_player]
execute in minecraft:the_end run tp @a[tag=phis.init_player] 500 15 500
execute as @a[tag=phis.init_player] at @s run forceload add ~ ~
execute as @a[tag=phis.init_player] at @s run setblock 500 1 500 minecraft:bedrock
execute as @a[tag=phis.init_player] at @s run setblock 500 2 500 minecraft:end_portal
execute as @a[tag=phis.init_player] run gamemode survival @a[tag=phis.init_player]
execute as @a[tag=phis.init_player] run tag @s remove phis.init_player