event_inherited()
name = eng() ? "First Fight" : "İlk Mücadele"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(12)/2)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("We need to recapture "+loc_camp1+". Could you\nlead my soldiers?") : (+loc_camp1+" bölgesini geri almamız lazım.\nAskerlerime öncülük edebilir misin?")

autoFinish = false
showWhenFinish = true
isDeletable = true
isSimpleQuest = false
isPrepQuest = false
hasChallenge = true
challenge = objChallenge_firstFight

// only if !autoFinish
finishText = "" 

givenBy = objLordDamph_npc
givenBy_name = npc_goore
givenLocation = loc_hawmgrad

targetLocation = loc_camp1
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2