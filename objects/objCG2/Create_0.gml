init_target_statistics()

name = creature_g2
type = type_grom
subtype = stype_gorkrim

level = 21
money = 40*DROP_GOLD_RATIO

range = random_range(120, 135)
rangeMelee = 60
spd = 6.25
forceFactor = 8.93
dashPower = 4/forceFactor
combatExperience = 50

maxHp = 2550
attackSpeed = 1.65
physicalPower = 92
armor = 12
resistance = 12

efColor1 = c_green
efColor2 = c_customgreen
efColor3 = c_lime

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic

grouping_initiate()
fury_initiate()
strike_initiate(4.5*dashPower, 1)
equalteam_initiate()

init_droplist()
update_droplist(objBow_005D_2, 1, -1, -1, 10*(1+10*global.debugMode))