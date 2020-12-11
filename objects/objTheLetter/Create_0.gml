event_inherited()
name = eng() ? "The Secret Letter" : "Gizli Mektup"
description = eng() ? "Must be delivered to the Lord." : "Lord'a ulaştırılması gerekiyor."

worth = 0
itemLevel = 1

dropLevel = itemLevel

#region FOR QUEST
isForQuest = objQuestRoad_scout2
isForQuest_directMode = false
isDeletable = is_quest_finished(isForQuest)
#endregion

type = type_quest
isCollectable = false