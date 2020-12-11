event_inherited()
name = eng() ? "First Assault" : "İlk Saldırı"
type = type_quest

maxScore = 20

money = 700
experience = ceil(calculate_level_exp(13)/2)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp, [c="+string(c_orange)+"] a sword[/c]")
: ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe,[c="+string(c_orange)+"] bir kılıç[/c]")

earlyDescription = eng() ? "Are you ready for this?" : "Bu görevi üstlenmeye hazır mısın?"

autoFinish = false
showWhenFinish = true
isDeletable = true
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = eng() ? "You deserved this sword!" : "Bu kılıcı hak ettin!"

givenBy = objGoore_npc
givenBy_name = npc_goore
givenLocation = loc_hawmgrad

targetLocation = loc_spawn5
targetObject = creature_5

teleport = get_location(targetLocation)

alarm[0] = 2