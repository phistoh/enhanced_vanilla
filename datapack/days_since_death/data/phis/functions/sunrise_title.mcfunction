# get daytime and number of elapsed days since beginning of the world
execute store result score @a phis.daytime run time query daytime
execute store result score @a phis.worldage run time query day

# check if player is initialized
execute as @a[tag=!is_init] run scoreboard players set @s phis.days_alive 0
execute as @a[tag=!is_init] run scoreboard players set @s phis.streak 0
execute as @a[tag=!is_init] run scoreboard players set @s phis.tmp_deaths 0
execute as @a[tag=!is_init] run scoreboard players set @s phis.daytime 0
execute as @a[tag=!is_init] run scoreboard players set @s phis.worldage 0
execute as @a[tag=!is_init] run tag @s add is_init

# check if player died and update scoreboard
execute as @a[scores={phis.tmp_deaths=1..},tag=!finished] if score @s phis.daytime matches 20..1800 run scoreboard players set @s phis.days_alive 0
execute as @a[scores={phis.tmp_deaths=0},tag=!finished] if score @s phis.daytime matches 20..1800 run scoreboard players add @s phis.days_alive 1
execute as @a[scores={phis.tmp_deaths=0},tag=!finished] if score @s phis.days_alive > @s phis.streak run scoreboard players operation @s phis.streak = @s phis.days_alive
execute as @a[scores={phis.tmp_deaths=1..},tag=!finished] if score @s phis.daytime matches 20..1800 run scoreboard players set @s phis.tmp_deaths 0

# show title
execute as @a[tag=!finished] if score @s phis.daytime matches 20..1800 run title @s subtitle [{"translate":"phis.number_of_days_since_death","with":[{"score":{"name":"@s","objective":"phis.days_alive"},"color":"blue"}],"color":"gray"}]
execute as @a[scores={phis.worldage=1},tag=!finished] if score @s phis.daytime matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.first","color":"gold"}],"color":"gray"}]
execute as @a[scores={phis.worldage=2},tag=!finished] if score @s phis.daytime matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.second","color":"gold"}],"color":"gray"}]
execute as @a[scores={phis.worldage=3},tag=!finished] if score @s phis.daytime matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.third","color":"gold"}],"color":"gray"}]
execute as @a[scores={phis.worldage=4..},tag=!finished] if score @s phis.daytime matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[[{"score":{"name":"@s","objective":"phis.worldage"},"color":"gold"},{"translate":"phis.th","color":"gold"}]],"color":"gray"}]

# grant advancements
execute as @a[scores={phis.streak=1..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:root
execute as @a[scores={phis.streak=3..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:3_days
execute as @a[scores={phis.streak=9..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:9_days
execute as @a[scores={phis.streak=27..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:27_days
execute as @a[scores={phis.streak=81..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:81_days
execute as @a[scores={phis.streak=243..},tag=!finished] if score @s phis.daytime matches 20..1800 run advancement grant @s only phis:243_days

# reset for next day
execute as @a[tag=!finished] if score @s phis.daytime matches 20..1800 run tag @s add finished
execute as @a if score @s phis.daytime matches 1801.. run tag @s remove finished