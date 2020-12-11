event_inherited()
name = eng() ? "Face Your Fear" : "Korkunla Yüzleş"
type = type_quest

maxScore = 1

money = 400
experience = ceil(calculate_level_exp(10)/2)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("You have to go to "+loc_mineralcave+" to confront your\nfears. Bring me the Blood Mineral.") : ("Korkularınla yüzleşmek için "+loc_mineralcave+"\n"
+"bölgesine gitmelisin. Oradan bana Kan Minerali\n"
+"getir.")

autoFinish = false
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = true
challenge = objChallenge_bloodyRolf

// only if !autoFinish
finishText = "" 

givenBy = objSenior_npc
givenBy_name = npc_senior
givenLocation = loc_hawmgrad

targetLocation = loc_mineralcave
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2