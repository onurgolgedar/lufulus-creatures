event_inherited()
name = eng() ? "Blood Mineral" : "Kan Minerali"

worth = 780
itemLevel = 1

dropLevel = itemLevel

#region FOR QUEST
isForQuest = objQuest_mineralCave
isForQuest_directMode = true
isDeletable = is_quest_finished(isForQuest)
#endregion

type = type_quest
isCollectable = true