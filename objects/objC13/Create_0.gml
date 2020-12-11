init_target_statistics()

name = creature_13
type = type_grom
subtype = stype_gorkrim

level = 25
money = 100*DROP_GOLD_RATIO

range = random_range(120, 150)
rangeMelee = 60
spd = 6
forceFactor = 7.72
dashPower = 4.4/forceFactor
combatExperience = 50

maxHp = 9200
attackSpeed = 1.42
physicalPower = 225
physicalPower_rangedFactor = 0.75
armor = 34
resistance = 34

efColor1 = c_aqua
efColor2 = c_aqua
efColor3 = c_blue

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic2

grouping_initiate()
fury_initiate()
strike_initiate(4.5*dashPower, 1)
shell_initiate()

init_droplist()
update_droplist(objSw_014D_2, 1, -1, -1, 15*(1+10*global.debugMode))