init_target_statistics()

name = creature_0
type = type_kador
subtype = stype_crokador

range = 50
spd = 3
forceFactor = 6.03
dashPower = 2.6/forceFactor
combatExperience = 10

level = 1
money = 2*DROP_GOLD_RATIO

maxHp = 70
attackSpeed = 1
physicalPower = 10
armor = 0
resistance = 0

efColor1 = c_red
efColor2 = c_orange
efColor3 = c_yellow

baseBonusExperienceRate = 0
event_inherited()

strike_initiate(2.7*dashPower, 0.6)

init_droplist()