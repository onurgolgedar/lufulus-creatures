init_target_statistics()

name = creature_b2
type = type_grom
subtype = stype_gorkrim

level = 27
money = 5000*DROP_GOLD_RATIO

range = 170
rangeMelee = 75
spd = 6.7
forceFactor = 15.55
dashPower = 4.2/forceFactor
combatExperience = 75

maxHp = 27000
attackSpeed = 1.65
physicalPower = 370
physicalPower_rangedFactor = 0.8
armor = 54
resistance = 54

efColor1 = c_red
efColor2 = c_maroon
efColor3 = c_customred3

event_inherited()
basicMagicSprite = sprCreatureBasicMagic4
boss = true

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4.2*dashPower, 1.1)
poison_initiate(physicalPower*1.4, 3*sec, 1)
shell_initiate()
rofux_initiate(physicalPower/2)
pull_initiate(45, 0.7)
laser_initiate(physicalPower*3, 3*sec)

init_droplist()
update_droplist(choose(objSw_004S, objSw_005S, objSw_006S, objCrossbow_001S, objNeck_002S, objNeck_004S), 1+irandom(1), -1, -1, 1000, 1, true)
update_droplist(choose(objMed_005, objNeck_003S, objNeck_001S), 2, -1, -1, 250, 1, true)
update_droplist(choose(objGoldPiece, objCrystal), -1, -1, -1, 500, 1, true)
update_droplist(choose(objGoldPiece, objCrystal), -1, -1, -1, 500, 1, true)
update_droplist(choose(objGoldPiece, objCrystal), -1, -1, -1, 500, 1, true)
update_droplist(objCrystal, -1, -1, -1, 1000, 1, true)