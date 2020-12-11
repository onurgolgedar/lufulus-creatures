init_target_statistics()

type = type_kador
subtype = stype_crokador
name = creature_1

range = 60
spd = 3.8
forceFactor = 10.91
dashPower = 3.5/forceFactor
combatExperience = 20

level = 2
money = 3*DROP_GOLD_RATIO

maxHp = 110
attackSpeed = 1
physicalPower = 13
armor = 0
resistance = 0

efColor1 = c_red
efColor2 = c_orange
efColor3 = c_yellow

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
turtle_initiate()
strike_initiate(4*dashPower, 0.6)
slowstone_initiate(objSlowStone_SO)

init_droplist()
update_droplist(objNeck_001D_2, 1, -1, -1, 25*(1+10*global.debugMode))