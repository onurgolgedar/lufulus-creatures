init_target_statistics()

name = creature_11
type = type_grom
subtype = stype_gronel

range = random_range(250, 275)
spd = 5.5
forceFactor = 10.33
dashPower = 3.7/forceFactor
combatExperience = 50

level = 23
money = 80*DROP_GOLD_RATIO

maxHp = 5800
attackSpeed = 1.45
physicalPower = 195
armor = 18
resistance = 18

efColor1 = c_aqua
efColor2 = c_lime
efColor3 = c_ltgreen

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic

grouping_initiate()
fury_initiate()
turtle_initiate()
basicheal_initiate(500)
pull_initiate(30, 1)
movingshot_initiate(1, physicalPower*2, 33)
poison_initiate(physicalPower*1.5, 2*sec, 0)

init_droplist()
update_droplist(objSw_014D_3, 1, -1, -1, 15*(1+10*global.debugMode))