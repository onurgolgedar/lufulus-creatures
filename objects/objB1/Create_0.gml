init_target_statistics()

name = creature_b1
type = type_grom
subtype = stype_gorkrim

level = 18
money = 500*DROP_GOLD_RATIO

range = 160
rangeMelee = 75
spd = 6.6
forceFactor = 15.55
dashPower = 5.5/forceFactor
combatExperience = 75

maxHp = 8200
attackSpeed = 1.27
physicalPower = 145
physicalPower_rangedFactor = 0.8
armor = 27
resistance = 27

efColor1 = c_fuchsia
efColor2 = c_aqua
efColor3 = c_blue

event_inherited()
basicMagicSprite = sprCreatureBasicMagic2
boss = true

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4.2*dashPower, 1.25)
poison_initiate(physicalPower*1, 3*sec, 1)
shell_initiate()
basicheal_initiate(300)
rofux_initiate(physicalPower/2.5)
pull_initiate(37, 0.6)

init_droplist()
update_droplist(choose(objSw_001S, objSw_002S, objSw_003S, objBow_001S, objNeck_001S, objNeck_003S), 1, -1, -1, 1000, 1, true)
update_droplist(choose(objMed_004, objNeck_002S, objNeck_004S), 1, -1, -1, 250, 1, true)
update_droplist(choose(objPlatinum, objGoldPiece), 1, -1, -1, 500, 1, true)
update_droplist(choose(objPlatinum, objGoldPiece), 1, -1, -1, 500, 1, true)
update_droplist(objPotion_001, -1, -1, -1, 1000, 2, true)