init_target_statistics()

type = type_kador
subtype = stype_crokador
name = creature_w1

range = 60
spd = 4.2
forceFactor = 10.1
dashPower = 4/forceFactor
combatExperience = 75

level = 5
money = 50*DROP_GOLD_RATIO

maxHp = 300
attackSpeed = 1.3
physicalPower = 40
armor = 20
resistance = 20

efColor1 = c_blue
efColor2 = c_aqua
efColor3 = c_ltblue

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
turtle_initiate()
strike_initiate(4*dashPower, 0.6)
shell_initiate()
slowstone_initiate(objSlowStone_SO)

init_droplist()
update_droplist(choose(objBow_002D, objClot_003, objSw_002D, objSh_002), 6, -1, -1, 1000, 1, true)
update_droplist(objPlatinum, -1, -1, -1, 1000, 1, true)