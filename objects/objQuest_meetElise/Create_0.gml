event_inherited()
name = eng() ? "Meet Elise" : "Elise ile Tanış"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(15)/4)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("Why hunting? Join me tomorrow.\nLet me tell you.") : ("Neden mi avcılık? Yarın bana katıl.\nSana anlatayım.")

autoFinish = false
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objElise_npc
givenBy_name = npc_elise
givenLocation = loc_spawn3

targetLocation = loc_spawn4
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2