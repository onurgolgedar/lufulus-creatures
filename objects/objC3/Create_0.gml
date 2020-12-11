init_target_statistics()

name = creature_3
type = type_grom
subtype = stype_gronel

range = random_range(280, 320)
spd = 4.1
forceFactor = 8.77
dashPower = 2.8/forceFactor
combatExperience = 30

level = 7
money = 8*DROP_GOLD_RATIO

maxHp = 240
attackSpeed = 1.1
physicalPower = 19
armor = 0
resistance = 0

efColor1 = c_green
efColor2 = c_lime
efColor3 = c_yellow

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic

grouping_initiate()
poison_initiate(physicalPower*1.5, 2*sec, 0)

init_droplist()