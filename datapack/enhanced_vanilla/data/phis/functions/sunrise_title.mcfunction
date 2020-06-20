# get daytime and number of elapsed days since beginning of the world
execute store result score @p day_time run time query daytime
execute store result score @p days_elapsed run time query day

# check if player died and update scoreboard
execute as @p[scores={temp_deaths=1..},tag=!finished] if score @s day_time matches 20..1800 run scoreboard players set @s days_since_death 0
execute as @p[scores={temp_deaths=0},tag=!finished] if score @s day_time matches 20..1800 run scoreboard players add @s days_since_death 1
execute as @p[scores={temp_deaths=1..},tag=!finished] if score @s day_time matches 20..1800 run scoreboard players set @s temp_deaths 0

# show title
execute as @p[tag=!finished] if score @s day_time matches 20..1800 run title @s subtitle [{"translate":"phis.number_of_days_since_death","with":[{"score":{"name":"@s","objective":"days_since_death"},"color":"blue"}],"color":"gray"}]
execute as @p[scores={days_elapsed=1},tag=!finished] if score @s day_time matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.first","color":"gold"}],"color":"gray"}]
execute as @p[scores={days_elapsed=2},tag=!finished] if score @s day_time matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.second","color":"gold"}],"color":"gray"}]
execute as @p[scores={days_elapsed=3},tag=!finished] if score @s day_time matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[{"translate":"phis.third","color":"gold"}],"color":"gray"}]
execute as @p[scores={days_elapsed=4..},tag=!finished] if score @s day_time matches 20..1800 run title @s title [{"translate":"phis.number_of_days","with":[[{"score":{"name":"@s","objective":"days_elapsed"},"color":"gold"},{"translate":"phis.th","color":"gold"}]],"color":"gray"}]

# reset for next day
execute as @p[tag=!finished] if score @s day_time matches 20..1800 run tag @s add finished
execute as @p if score @s day_time matches 1801.. run tag @s remove finished