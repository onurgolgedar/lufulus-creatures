event_inherited()
name = eng() ? "Find "+npc_goore+"'s Sword" : npc_goore+"'un Kılıcını Bul"
type = type_quest

maxScore = 1

money = 100
experience = ceil(calculate_level_exp(5)/4)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? "Can you handle this?" : "Bunu halledebilir misin?"

autoFinish = false
showWhenFinish = true
isDeletable = true
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objGoore_npc
givenBy_name = npc_goore
givenLocation = loc_hawmgrad

targetLocation = loc_wave1
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2