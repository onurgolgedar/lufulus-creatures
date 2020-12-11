event_inherited()
name = eng() ? "Lufulus' Wisdom" : "Lufulus'un Bilinci"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(10)/5)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = ""

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = true
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objPlayer
givenBy_name = global.name
givenLocation = loc_hawmgrad

targetLocation = ds_list_find_index(global.destroyedMaps, roomCreature0) == -1 ? loc_spawn0 : pointer_null
targetObject = pointer_null

teleport = -1

alarm[0] = 2