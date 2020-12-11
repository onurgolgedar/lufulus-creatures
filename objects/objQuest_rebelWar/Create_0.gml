event_inherited()
name = eng() ? "Rebel War" : "Asiler Savaşı"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(13)/4)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("Win a war against the Rebels by supporting our soldiers.") : ("Askerlerimize destek olarak\nAsiler'e karşı savaş kazan.")

autoFinish = false
showWhenFinish = false
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = true
challenge = objChallenge_rebelWar

// only if !autoFinish
finishText = "" 

givenBy = objLordDamph_npc
givenBy_name = npc_lorddamph
givenLocation = loc_hawmgrad

targetLocation = loc_warzone
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2