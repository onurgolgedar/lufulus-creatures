event_inherited()

name = eng() ? "Goore's Sword" : "Goore'un Kılıcı"
damage = 110
criticalChance = 15
magicalDamage = 0
attackSpeed = 1.42
mana = 0

extension[0] = ext_basicMagical30
extension[1] = ext_pull_bonuses

worth = 500
itemLevel = 15

dropLevel = itemLevel

#region FOR QUEST
isForQuest = objQuest_blacksmith
isForQuest_directMode = true
isDeletable = is_quest_finished(isForQuest) and is_quest_finished(objQuest_blacksmith2)
#endregion

// Max: 100
specialty = 0

#region FIXED
weaponType = wtype_ohsword

upgrade = 0
type = type_sweapon
#endregion