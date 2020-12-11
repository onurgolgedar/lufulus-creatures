init_target_statistics()

name = creature_a2
type = type_grom
subtype = stype_gorkrim

range = random_range(120, 150)
rangeMelee = 60
spd = 5.4
forceFactor = 8.93
dashPower = 4/forceFactor
combatExperience = 100

level = 25
money = 90*DROP_GOLD_RATIO

maxHp = 4800
attackSpeed = 1.37
physicalPower = 265
physicalPower_rangedFactor = 0.75
armor = 24
resistance = 14

efColor1 = c_aqua
efColor2 = c_aqua
efColor3 = c_blue

baseBonusExperienceRate = 0.15
event_inherited()
basicMagicSprite = sprCreatureBasicMagic2

grouping_initiate()
fury_initiate()
strike_initiate(4*dashPower, 0.8)
shell_initiate()
basicheal_initiate(250)

brainattack_initiate(c_purple, physicalPower/5, 0.5, sprCA1Brain)

init_droplist()
update_droplist(objNeck_006D_3, 1, -1, -1, 15*(1+10*global.debugMode))