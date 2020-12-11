event_inherited()
name = eng() ? "Another Blood Mineral" : "Başka bir Kan Minerali"
description = eng() ? "It's so weird that it was\nfound outside the cave." : "Bunun mağara dışında bulunmaması\ngerekiyordu."

worth = 780
itemLevel = 1

dropLevel = itemLevel

#region FOR QUEST
isForQuest = objQuest_bloodMineral
isForQuest_directMode = false
isDeletable = is_quest_finished(isForQuest)
#endregion

type = type_quest
isCollectable = true