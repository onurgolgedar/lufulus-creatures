event_inherited()
name = eng() ? "Wounded Man" : "Yaralı Adam"
type = type_quest

maxScore = 2

money = 0
experience = ceil(calculate_level_exp(1)/10)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? "Please help me, they are coming!"
: "Yaratıklar peşimde! Ağır yaralıyım\nlütfen yardım et."

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = ""

givenBy = pointer_null
givenBy_name = ""
givenLocation = pointer_null

targetLocation = loc_road
targetObject = creature_0

teleport = -1