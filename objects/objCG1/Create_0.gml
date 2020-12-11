init_target_statistics()

name = creature_g1
type = type_grom
subtype = stype_gorkrim

level = 13
money = 12*DROP_GOLD_RATIO

range = random_range(110, 125)
rangeMelee = 55
spd = 5.8
forceFactor = 8.93
dashPower = 3.8/forceFactor
combatExperience = 50

maxHp = 700
attackSpeed = 1.5
physicalPower = 42
armor = 10
resistance = 15

efColor1 = c_olive
efColor2 = c_yellow
efColor3 = c_red

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic

grouping_initiate()
fury_initiate()
strike_initiate(4.1*dashPower, 0.8)
equalteam_initiate()

init_droplist()
update_droplist(objNeck_004D_3, 1, -1, -1, 10*(1+10*global.debugMode))