# check if someone is sleeping
tag @a[nbt=!{SleepTimer:0s}] add phis.inbed

# fast forward time while someone is sleeping
execute as @a[tag=phis.inbed] run time add 150

# message
execute as @a[nbt={SleepTimer:1s}] run tellraw @a [{"text":" > ","color":"gray"},{"translate":"phis.is_sleeping","with":[{"selector":"@s"}],"color":"gray","hoverEvent":{"action":"show_text","value":[{"translate":"phis.sleep_in_bed","with":[{"score":{"name":"@s","objective":"phis.times_slept"},"color":"dark_aqua"}],"color":"gray"}]}}]

# "clear" weather by setting it to rain for one tick
execute as @a[nbt={SleepTimer:20s}] run weather rain 1

# clean up scoreboartag
tag @a[nbt={SleepTimer:0s}] remove phis.inbed