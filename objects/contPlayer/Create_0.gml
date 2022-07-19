global.name = "Gawain"
global.level = 1
global.experience = 0
global.money = 0

global.previousExperience = 0
global.targetExperience = calculate_level_exp(1)
global.comboExperience = 0
global.comboBaseExperience = 0
global.comboCount = 0
global.collectedExperience = 0
global.levels_withoutDying = 0
global.lastHp = 100
global.hair = sprHair
global.locationName = loc_road
global.classicItem_count = 0
global.mode = md_calm

global.questsFinished = ds_list_create()
global.titles = ds_list_create()
global.permanentEfboxes = ds_list_create()
global.permanentEfboxes_time = ds_list_create()
global.activeExtensions = ds_list_create()

#region Box Initializations
for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
        global.item[i, j] = -1
		global.itemActive[i, j] = false
        global.itemUpgrade[i, j] = -1
        global.itemExtension0[i, j] = -1
        global.itemExtension1[i, j] = -1
        global.itemType[i, j] = pointer_null
        global.itemCount[i, j] = -1
    }
}

for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
        global.item_bank[i, j] = -1
        global.itemUpgrade_bank[i, j] = -1
        global.itemExtension0_bank[i, j] = -1
        global.itemExtension1_bank[i, j] = -1
        global.itemType_bank[i, j] = pointer_null
        global.itemCount_bank[i, j] = -1
		global.itemRentTime_bank[i, j] = -1
    }
}

var lastBox = global.bagBoxCount_vertical
for (var j = lastBox; j < lastBox+5; j++) {
    global.item[0, j] = -1
	global.itemActive[0, j] = false
    global.itemUpgrade[0, j] = -1
    global.itemExtension0[0, j] = -1
    global.itemExtension1[0, j] = -1
    global.itemType[0, j] = pointer_null
    global.itemCount[0, j] = -1
}

global.activeQuestCount = 0
for (var i = 0; i < 40; i++) {
	global.quest[i] = -1
	global.questScore[i] = -1
	global.questMaxScore[i] = -1
}
#endregion
#region Skills Initializations
for (var i = 0; i < 30; i++) {
    for (var j = 0; j < 6; j++) {
        global.skillObject[i, j] = -1
        global.skillUpgrade[i, j] = 0
    }
}

global.skillObject[0, 0] = objSkill_1
global.skillUpgrade[0, 0] = 0

global.skillObject[0, 1] = objSkill_2
global.skillUpgrade[0, 1] = 0

global.skillObject[5, 0] = -1//objSkill_11
global.skillUpgrade[5, 0] = 0

global.skillObject[5, 1] = objSkill_12
global.skillUpgrade[5, 1] = 0

global.skillObject[10, 0] = objSkill_3
global.skillUpgrade[10, 0] = 0

global.skillObject[10, 1] = objSkill_4
global.skillUpgrade[10, 1] = 0

global.skillObject[5, 3] = -1//objSkill_13
global.skillUpgrade[5, 3] = 0

global.skillObject[5, 4] = -1//objSkill_14
global.skillUpgrade[5, 4] = 0

global.skillObject[0, 3] = objSkill_10
global.skillUpgrade[0, 3] = 0

global.skillObject[0, 4] = objSkill_8
global.skillUpgrade[0, 4] = 0

global.skillObject[0, 5] = objSkill_9
global.skillUpgrade[0, 5] = 0

global.skillObject[15, 0] = objSkill_5
global.skillUpgrade[15, 0] = 0

global.skillObject[15, 1] = objSkill_6
global.skillUpgrade[15, 1] = 0

global.skillObject[15, 2] = objSkill_7
global.skillUpgrade[15, 2] = 0

for (var i = 0; i < 5; i++) {
	global.selectedSkill[i] = -1
	global.selectedSkillRem[i] = -1
	global.selectedSkillMaxRem[i] = -1
	global.selectedSkillMana[i] = -1
}
#endregion
#region Active Item Initializations
global.medallionI = -1
global.medallionJ = -1

global.weaponI = -1
global.weaponJ = -1
global.weaponSprite = sprNothingness
global.weaponType = pointer_null
global.weaponSlow = 0

global.sWeaponI = -1
global.sWeaponJ = -1
global.sWeaponSprite = sprNothingness
global.sWeaponType = pointer_null
global.secondaryActive = false

global.necklaceI = -1
global.necklaceJ = -1

global.clothesI = -1
global.clothesJ = -1
global.clothesSlow = 0
global.clothesArm = sprArm
global.clothesFrontArm = sprFrontArm
global.clothesStyle = 0.0
#endregion
#region Result Values
global.maxMana = 100
global.maxHp = 100

global.physicalPower = -1
global.magicalPower = -1
global.criticalChance = -1
global.movementSpeed = 5
global.attackSpeed = 1
global.armor = 0
global.resistance = 0
global.damageReduction = 0
global.criticalFactor = 1.5

global.str = -1
global.dex = -1
global.vit = -1
global.mp = -1
global.sta = -1
#endregion

global.add_physicalPower = 0
global.add_magicalPower = 0
global.add_speed = 0
global.add_attackSpeed = 0
global.add_criticalChance = 0
global.add_maxHp = 0
global.add_maxMana = 0
global.add_expRatio = 0
global.givenStr = 0
global.givenDex = 0
global.givenVit = 0
global.givenMp = 0
global.givenSta = 0
global.virtual_str = 0
global.virtual_dex = 0
global.virtual_vit = 0
global.virtual_mp = 0
global.virtual_sta = 0
global.virtual_stat_points = 0
global.statPoints = 0
global.skillBar = 0
global.skillPoints = 0
global.givenSkillPoints = 0

drawMainBS = false
drawSkill12 = false
canReleaseSkill12 = false
deviceSkill12 = -1
mainBSindex = 0
broccoliMode = false
changeWeaponChoiceTo = -1
saveLevel_needed = true
doingAttack = false
qPressTime = 0
onDialogue = false
global_tab = false
melee = true
fixedShieldMode = false

masterMage_extension = false
shiftNoSlow_extension = false
shiftCooldown_extension = false
shiftHeal_extension = false
galaxy_extension = false

with (contGUi)
	event_perform(ev_other, ev_user0)
event_perform(ev_other, ev_user1)