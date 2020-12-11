init_target_statistics()

name = creature_a1
type = type_grom
subtype = stype_gorkrim

range = random_range(120, 150)
rangeMelee = 60
spd = 5.1
forceFactor = 8.93
dashPower = 4/forceFactor
combatExperience = 100

level = 18
money = 50*DROP_GOLD_RATIO

maxHp = 3000
attackSpeed = 1.2
physicalPower = 180
physicalPower_rangedFactor = 0.75
armor = 10
resistance = 10

efColor1 = c_aqua
efColor2 = c_aqua
efColor3 = c_blue

baseBonusExperienceRate = 0.15
event_inherited()
basicMagicSprite = sprCreatureBasicMagic2

fury_initiate()
strike_initiate(4*dashPower, 0.8)

grouping_initiate()
brainattack_initiate(c_purple, physicalPower/8, 0.5, sprCA1Brain)
basicheal_initiate(190)

init_droplist()