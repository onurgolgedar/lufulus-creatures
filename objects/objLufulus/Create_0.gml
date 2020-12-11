init_target_statistics()

name = creature_lufulus
type = type_grom
subtype = stype_gorkrim

level = 40
money = 400000*DROP_GOLD_RATIO

range = 200
rangeMelee = 80
spd = 6.5
forceFactor = 15.97
dashPower = 6/forceFactor
combatExperience = 100

maxHp = 85000
attackSpeed = 1.85
physicalPower = 370
physicalPower_rangedFactor = 0.85
armor = 65
resistance = 65

efColor1 = c_fuchsia
efColor2 = c_purple
efColor3 = c_lime

event_inherited()
basicMagicSprite = sprCreatureBasicMagic3
boss = true

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4.3*dashPower, 1.5)
poison_initiate(physicalPower*1.5, 2.5*sec, 1)
rofux_initiate(physicalPower/2.5)

init_droplist()