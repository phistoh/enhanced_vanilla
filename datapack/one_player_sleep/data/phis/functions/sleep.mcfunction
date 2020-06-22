# check if someone is sleeping
scoreboard players add @a[nbt=!{SleepTimer:0s}] phis.inbed 1

# fast forward time while someone is sleeping
execute as @p[scores={phis.inbed=1..}] run time add 150

# message
execute as @p[scores={phis.inbed=1}] run tellraw @a [{"text":" > ","color":"gray"},{"translate":"phis.is_sleeping","with":[{"selector":"@s"}],"color":"gray","hoverEvent":{"action":"show_text","value":[{"translate":"phis.sleep_in_bed","with":[{"score":{"name":"@s","objective":"phis.times_slept"},"color":"dark_aqua"}],"color":"gray"}]}}]

# "clear" weather by setting it to rain for one tick
execute as @p[scores={phis.inbed=20}] run weather rain 1

# clean up scoreboard
scoreboard players set @a[nbt={SleepTimer:0s}] phis.inbed 0