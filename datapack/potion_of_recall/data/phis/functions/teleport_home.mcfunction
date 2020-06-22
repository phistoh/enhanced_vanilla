# only teleport players which have consumed the potion of recall
scoreboard players add @a[nbt={ActiveEffects:[{Id:9b,Amplifier:9b},{Id:15b,Amplifier:2b}]}] is_tp 1

# disable "The End?" and "The End" advancements
execute as @p[scores={is_tp=1..}] run advancement revoke @s only phis:hidden no_recall_potion

# sound and particle effects
execute at @p[scores={is_tp=2}] anchored eyes run particle minecraft:portal ^ ^ ^ 0 0 0 0.5 200 normal @p
execute as @p[scores={is_tp=5}] at @s run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 2.0
execute at @p[scores={is_tp=6}] anchored eyes run particle minecraft:soul ^ ^ ^ 0 0 0 0.5 200 normal @p

# make player immovable
execute as @p[scores={is_tp=7}] run effect give @s minecraft:slowness 2 9 true

# increment potions_used statistic
scoreboard players add @p[scores={is_tp=10}] potions_used 1

# chat message
execute as @p[scores={is_tp=12}] run tellraw @a [{"text":" > ","color":"gray"},{"translate":"phis.is_recalling","with":[{"selector":"@s"}],"color":"gray","hoverEvent":{"action":"show_text","value":[{"translate":"phis.stat.potions_of_recalling_used","with":[{"score":{"name":"@s","objective":"potions_used"},"color":"dark_aqua"}],"color":"gray"}]}}]

# set up post-teleport scoreboard and teleport player to the end
execute as @p[scores={is_tp=38}] run tag @s add finished_tp
execute as @p[scores={is_tp=39}] run effect give @s minecraft:night_vision 2 1 true
execute in minecraft:the_end as @p[scores={is_tp=40}] run tp @s 500 5 500

# post-teleport sound / title
execute as @p[tag=finished_tp] at @s run playsound minecraft:block.conduit.activate master @s ~ ~ ~ 2.0
execute as @p[tag=finished_tp,scores={potions_used=1}] run title @s subtitle [{"translate":"phis.number_of_potions_used_one","color":"gray","with":[{"score":{"name":"@s","objective":"potions_used"},"color":"dark_aqua"}]}]
execute as @p[tag=finished_tp,scores={potions_used=2..}] run title @s subtitle [{"translate":"phis.number_of_potions_used_multiple","color":"gray","with":[{"score":{"name":"@s","objective":"potions_used"},"color":"dark_aqua"}]}]
execute as @p[tag=finished_tp] run title @s title {"translate":"phis.welcome_back","color":"gold"}

# reset scoreboards
scoreboard players set @p[scores={is_tp=1..},nbt=!{ActiveEffects:[{Id:9b,Amplifier:9b},{Id:15b,Amplifier:2b}]}] is_tp 0
execute as @p[tag=finished_tp,nbt=!{ActiveEffects:[{Id:9b,Amplifier:9b},{Id:15b,Amplifier:2b}]}] run tag @s remove finished_tp

# enable "The End?" and "The End" advancements
execute as @p[scores={is_tp=0}] run advancement grant @s only phis:hidden no_recall_potion