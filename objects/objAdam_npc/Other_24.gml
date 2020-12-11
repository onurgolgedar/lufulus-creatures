for (var i = 0; i < global.tradeBoxCount_horizontal*global.tradeMaxPage; i++) {
    for (var j = 0; j < global.tradeBoxCount_vertical; j++) {
        item[i, j] = -1
        itemUpgrade[i, j] = -1
        itemExtension0[i, j] = -1
        itemExtension1[i, j] = -1
        itemType[i, j] = pointer_null
        itemCount[i, j] = -1
    }
}

var questItem
var questItem_instance
challengeCount = 0

questItem = objChallengeItem_bloodyRolf
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_rebelWar
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_wave
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_firstFight
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_kazrin
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_wisdom
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_leaderVurac
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_rebelWar2
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

questItem = objChallengeItem_leaderPinkSrada
questItem_instance = instance_create(-50, -50, questItem)
if (!is_quest_finished(questItem_instance.challenge) and !quest_exists(questItem_instance.challenge) and global.level <= questItem_instance.maxLevel) {
	add_item_local(questItem, 0)
	
	if (global.level >= questItem_instance.minLevel and (questItem_instance.conditionalQuest == pointer_null or quest_exists(questItem_instance.conditionalQuest)))
		challengeCount++
}
else
	add_item_local(objNoItem, 0)
instance_destroy(questItem_instance)

var index = ds_list_find_index(contGUI.blueDirectionArrows, id)
if (challengeCount > 0 and index == -1)
	ds_list_add(contGUI.blueDirectionArrows, id)
else if (challengeCount == 0 and index != -1)
	ds_list_delete(contGUI.blueDirectionArrows, index)