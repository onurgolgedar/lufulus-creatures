event_inherited()

challenge = objChallenge_wave

qInstance = instance_create(0, 0, challenge)
qInstance.pureReading_mode = true
with (qInstance)
	event_perform(ev_other, ev_user1)
	
minLevel = qInstance.minLevel_challenge
maxLevel = qInstance.maxLevel_challenge
conditionalQuest = qInstance.conditionalQuest

name = qInstance.name
name += "[c="+string(c_challenge)+"]"+(eng() ? " (CHALLENGE)" : " (SÖZLEŞME)")+"[/c]"
description = qInstance.description+"\n"+qInstance.rewardText

worth = 150
itemLevel = minLevel

dropLevel = itemLevel

type = type_challengeItem
autoUse = false

instance_destroy(qInstance)