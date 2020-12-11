init_target_statistics()

name = creature_4
type = type_grom
subtype = stype_gorkrim

level = 10
money = 16*DROP_GOLD_RATIO

range = random_range(120, 150)
rangeMelee = 60
spd = 5.2
forceFactor = 10.91
dashPower = 4.2/forceFactor
combatExperience = 50

maxHp = 740
attackSpeed = 1.4
physicalPower = 45
physicalPower_rangedFactor = 0.75
armor = 0
resistance = 0

efColor1 = c_aqua
efColor2 = c_aqua
efColor3 = c_blue

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic2

grouping_initiate()
fury_initiate()
strike_initiate(4.6*dashPower, 1)
shell_initiate()
pull_initiate(17, 0.8)

init_droplist()
update_droplist(objSw_005D_2, 1, -1, -1, 15*(1+10*global.debugMode))