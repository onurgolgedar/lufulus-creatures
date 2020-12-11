init_target_statistics()

name = creature_8
type = type_kador
subtype = stype_crokador

level = 20
money = 60*DROP_GOLD_RATIO

range = 70
spd = 5.8
forceFactor = 8.66
dashPower = 4/forceFactor
combatExperience = 50

maxHp = 5500
attackSpeed = 1.32
physicalPower = 125
armor = 34
resistance = 34

efColor1 = c_red
efColor2 = c_maroon
efColor3 = c_purple

baseBonusExperienceRate = 0.3
event_inherited()

grouping_initiate()
fury_initiate()
turtle_initiate()
shell_initiate()
strike_initiate(4*dashPower, 1)
pull_initiate(20, 0.9)
laser_initiate(physicalPower, 2.5*sec)

init_droplist()