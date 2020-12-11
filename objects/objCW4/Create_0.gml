init_target_statistics()

name = creature_w4
type = type_grom
subtype = stype_gronel

range = random_range(280, 320)
spd = 4.5
forceFactor = 9.45
dashPower = 2.8/forceFactor
combatExperience = 75

level = 7
money = 8*DROP_GOLD_RATIO

maxHp = 7400
attackSpeed = 1.1
physicalPower = 220
armor = 33
resistance = 33

efColor1 = c_red
efColor2 = c_maroon
efColor3 = c_red

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic4

grouping_initiate()
shell_initiate()
fury_initiate()
strike_initiate(4.5*dashPower, 1)
laser_initiate(physicalPower*2, 2.5*sec)

init_droplist()
update_droplist(choose(objCrossbow_005D, objClot_005, objNeck_006D, objSw_006D_3, objSh_006), 7, -1, -1, 1000, 1, true)
update_droplist(objCrystal, -1, -1, -1, 1000, 1, true)