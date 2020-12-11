init_target_statistics()

name = creature_12
type = type_grom
subtype = stype_gorkrim

level = 25
money = 90*DROP_GOLD_RATIO

range = random_range(120, 150)
rangeMelee = 60
spd = 6
forceFactor = 10.16
dashPower = 4.4/forceFactor
combatExperience = 50

maxHp = 8500
attackSpeed = 1.42
physicalPower = 240
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

init_droplist()