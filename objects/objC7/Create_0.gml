init_target_statistics()

name = creature_7
type = type_kador
subtype = stype_crokador

level = 20
money = 70*DROP_GOLD_RATIO

range = 100
spd = 5.8
forceFactor = 9.7
dashPower = 4.3/forceFactor
combatExperience = 50

maxHp = 4300
attackSpeed = 1.65
physicalPower = 145
armor = 10
resistance = 10

efColor1 = c_red
efColor2 = c_maroon
efColor3 = c_purple

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4.6*dashPower, 1)

init_droplist()
update_droplist(objSw_008D_4, 1, -1, -1, 15*(1+10*global.debugMode))