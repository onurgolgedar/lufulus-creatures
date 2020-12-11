event_inherited()
name = eng() ? "Power Potion" : "Kuvvet İksiri"
description = eng() ? "Increases Strength\nSee the Lord after drinking." : "Güç kazandırır.\nİçtikten sonra Lord'a görün."

efbox = efboxPowerQ

worth = 300
itemLevel = 1

dropLevel = itemLevel

#region FOR QUEST
isForQuest = objQuest_lordLoves
isForQuest_directMode = false
isDeletable = is_quest_finished(isForQuest)
#endregion

type = type_potion

isCollectable = true