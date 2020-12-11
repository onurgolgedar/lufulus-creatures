init_target_statistics()

name = creature_10
type = type_kador
subtype = stype_crokador

level = 23
money = 75*DROP_GOLD_RATIO

range = 70
spd = 5.1
forceFactor = 11.38
dashPower = 4/forceFactor
combatExperience = 50

maxHp = 8000
attackSpeed = 1.52
physicalPower = 170
armor = 42
resistance = 42

efColor1 = c_orange
efColor2 = c_yellow
efColor3 = c_orange

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
fury_initiate()
turtle_initiate()
strike_initiate(4*dashPower, 1)
earthmove_initiate()
shell_initiate()

init_droplist()