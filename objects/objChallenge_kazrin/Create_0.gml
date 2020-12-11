event_inherited()
name = creature_7
type = type_quest

maxScore = 1

money = 0
experience = 0
statPoints = 1
skillPoints = 1

#region FIXED
rewardText = statPoints > 0 ? (eng() ? ("\nGives [c="+string(c_orange)+"]+"+string(statPoints)+" Stat Point(s)[/c]")
: ("\n[c="+string(c_orange)+"]+"+string(statPoints)+" Gelişim Puanı[/c] kazandırır.")) : ""
rewardText += skillPoints > 0 ? (eng() ? ("\nGives [c="+string(c_orange)+"]+"+string(statPoints)+" Skill Point(s)[/c]")
: ("\n[c="+string(c_orange)+"]+"+string(statPoints)+" Beceri Puanı[/c] kazandırır.")) : ""
#endregion
earlyDescription = ""

autoFinish = true
showWhenFinish = true
isDeletable = true
isChallenge = true

maxLevel_challenge = 16
minLevel_challenge = 14
conditionalQuest = pointer_null // Must be its challenge

// only if !autoFinish
finishText = ""

givenBy = objPlayer
givenBy_name = global.name
givenLocation = loc_hawmgrad

targetLocation = loc_spawn7
targetObject = creature_7

teleport = get_location(targetLocation)

alarm[0] = 2