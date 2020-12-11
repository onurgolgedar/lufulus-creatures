init_target_statistics()

name = creature_w2
type = type_grom
subtype = stype_gorkrim

level = 15
money = 200*DROP_GOLD_RATIO

range = random_range(120, 150)
rangeMelee = 60
spd = 5
forceFactor = 8.68
dashPower = 4.15/forceFactor
combatExperience = 50

maxHp = 1840
attackSpeed = 1.25
physicalPower = 65
physicalPower_rangedFactor = 0.75
armor = 0
resistance = 0

efColor1 = c_aqua
efColor2 = c_aqua
efColor3 = c_blue

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic

grouping_initiate()
fury_initiate()
strike_initiate(4.05*dashPower, 1)
shell_initiate()

init_droplist()
update_droplist(choose(objBow_004, objNeck_003, objSw_004D, objSh_003), 6, -1, -1, 1000, 1, true)
update_droplist(objPlatinum, -1, -1, -1, 1000, 1, true)
update_droplist(objSilver, -1, -1, -1, 1000, 1, true)