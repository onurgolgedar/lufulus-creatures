event_inherited()
name = eng() ? "They Are Right" : "Onlar Haklılar"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(17)/4)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("Take this gold and give it to Lord "+npc_lordred+"\nas compensation for the crime that is committed\nby rebellions of our clan.\n\n[c="+string(c_aqua)+"]Gives [c="+string(c_gold)+"]10.000 gold[c="+string(c_aqua)+"].[/c]") : ("Bu altınları al ve Lord "+npc_lordred+"'a ver.\nKlanımızdaki isyancıların işlediği suçun tazminatı\nolarak kabul edebilir.\n\n[c="+string(c_gold)+"]10.000 altın[c="+string(c_aqua)+"] verir.[/c]")

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objLordDamph_npc
givenBy_name = npc_lorddamph
givenLocation = loc_hawmgrad

targetLocation = loc_belingfur
targetObject = npc_lordred

teleport = get_location(targetLocation)

alarm[0] = 2