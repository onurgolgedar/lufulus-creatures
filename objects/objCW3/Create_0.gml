init_target_statistics()

name = creature_w3
type = type_grom
subtype = stype_gronel

range = random_range(280, 320)
spd = 4.5
forceFactor = 9.45
dashPower = 2.8/forceFactor
combatExperience = 75

level = 7
money = 8*DROP_GOLD_RATIO

maxHp = 2400
attackSpeed = 3
physicalPower = 45
armor = 10
resistance = 10

efColor1 = c_green
efColor2 = c_lime
efColor3 = c_yellow

baseBonusExperienceRate = 0
event_inherited()
basicMagicSprite = sprCreatureBasicMagic5

grouping_initiate()
poison_initiate(physicalPower*2, sec, 0)
shell_initiate()

init_droplist()
update_droplist(choose(objCrossbow_004D, objClot_004, objNeck_004D, objSw_005, objSh_004), 7, -1, -1, 1000, 1, true)
update_droplist(objGoldPiece, -1, -1, -1, 1000, 1, true)
update_droplist(objPlatinum, -1, -1, -1, 1000, 1, true)