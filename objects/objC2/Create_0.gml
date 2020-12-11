init_target_statistics()

name = creature_2
type = type_kador
subtype = stype_crokador

range = 60
spd = 4.3
forceFactor = 10.91
dashPower = 3.7/forceFactor
combatExperience = 30

level = 4
money = 5*DROP_GOLD_RATIO

maxHp = 200
attackSpeed = 1.25
physicalPower = 20
armor = 0
resistance = 0

efColor1 = c_purple
efColor2 = c_fuchsia
efColor3 = c_blue

baseBonusExperienceRate = 0
event_inherited()

grouping_initiate()
turtle_initiate()
strike_initiate(4.2*dashPower, 0.6)
poison_initiate(physicalPower, 2*sec, 0)
shell_initiate()

init_droplist()