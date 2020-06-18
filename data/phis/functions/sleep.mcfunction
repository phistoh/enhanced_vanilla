scoreboard players add @a[nbt=!{SleepTimer:0s}] inbed 1
execute as @p[scores={inbed=1..}] run time add 150
execute at @p[scores={inbed=1}] as @p[scores={inbed=1}] run tellraw @a [{"selector":"@s"}," schläft."]
execute as @p[scores={inbed=20}] run weather rain 1
scoreboard players set @a[nbt={SleepTimer:0s}] inbed 0