# Potion of Recall
scoreboard objectives add is_tp dummy
scoreboard objectives add potions_used dummy
# Select one player to initialize portal
execute as @p[limit=1] run tag @s add init_player
execute as @a[tag=init_player] run gamemode creative @a[tag=init_player]
execute in minecraft:the_end run tp @a[tag=init_player] 500 15 500
execute as @a[tag=init_player] at @s run forceload add ~ ~
execute as @a[tag=init_player] at @s run setblock 500 1 500 minecraft:bedrock
execute as @a[tag=init_player] at @s run setblock 500 2 500 minecraft:end_portal
execute as @a[tag=init_player] run gamemode survival @a[tag=init_player]
execute as @a[tag=init_player] run tag @s remove init_player