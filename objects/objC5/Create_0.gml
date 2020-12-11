init_target_statistics()

name = creature_5
type = type_kador
subtype = stype_crokador

level = 12
money = 28*DROP_GOLD_RATIO

range = 60
spd = 4.9
forceFactor = 14.60
dashPower = 3.8/forceFactor
combatExperience = 40

maxHp = 1600
attackSpeed = 1
physicalPower = 85
armor = 15
resistance = 0

efColor1 = c_orange
efColor2 = c_yellow
efColor3 = c_orange

baseBonusExperienceRate = 0.3
event_inherited()

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4.2*dashPower, 1.4)
slowstone_initiate(objSlowStone_SO)
earthmove_initiate()
shell_initiate()
shock_initiate(physicalPower*2)

init_droplist()
update_droplist(objCrossbow_004D_2, 1, -1, -1, 20*(1+10*global.debugMode))