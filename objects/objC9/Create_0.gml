init_target_statistics()

name = creature_9
type = type_kador
subtype = stype_crokador

level = 22
money = 75*DROP_GOLD_RATIO

range = 70
spd = 5.7
forceFactor = 10.91
dashPower = 4/forceFactor
combatExperience = 50

maxHp = 6700
attackSpeed = 1.4
physicalPower = 170
armor = 28
resistance = 28

efColor1 = c_red
efColor2 = c_maroon
efColor3 = c_purple

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4*dashPower, 1)
earthmove_initiate()
shock_initiate(physicalPower*2)

init_droplist()