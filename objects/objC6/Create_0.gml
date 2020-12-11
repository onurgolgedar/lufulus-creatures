init_target_statistics()

name = creature_6
type = type_grom
subtype = stype_gronel

range = random_range(250, 275)
spd = 5.3
forceFactor = 9.44
dashPower = 3.4/forceFactor
combatExperience = 50

level = 15
money = 35*DROP_GOLD_RATIO

maxHp = 1500
attackSpeed = 1.35
physicalPower = 85
armor = 0
resistance = 15

efColor1 = c_purple
efColor2 = c_fuchsia
efColor3 = c_white

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic3

grouping_initiate()
fury_initiate()
turtle_initiate()
basicheal_initiate(250)
pull_initiate(23, 0.8)
movingshot_initiate(1, physicalPower*2, 33)
laser_initiate(physicalPower, 2.5*sec)

init_droplist()
update_droplist(objClot_006D, 1, -1, -1, 20*(1+10*global.debugMode))