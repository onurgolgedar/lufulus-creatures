with (parEffectBox)
	if (!permanent)
		instance_destroy()
		
for (var i = 0; i < ds_list_size(global.fixedMessageNos); i++) {
	var fMNo = ds_list_find_value(global.fixedMessageNos, i)
	
	if (is_fm_temporary(fMNo)) {
		fm_delete(fMNo)
		i--
	}
}

for (var i = 0; i < 5; i++) {
	if (global.selectedSkill[i] != -1)
			global.selectedSkillRem[i] = 0
}

save_all(global.saveNo)

mp_grid_destroy(global.mainGrid)
mp_grid_destroy(global.calmGrid)

global.selectedTarget = pointer_null

free_all_surfaces()

global.consoleMode = false
	
alarm[3] = -1

if (global.gamepad_active)
	gamepad_set_vibration(global.gamepad, 0, 0)
	
if (!global.isCheated) {
	if (global.money >= 20000) {
		if (!steam_get_achievement("bag_of_gold"))
			steam_set_achievement("bag_of_gold")
		
		if (!steam_get_achievement("golden_bag"))
			steam_set_achievement("golden_bag")
		
		if (!steam_get_achievement("richest"))
			steam_set_achievement("richest")
	}
	else if (global.money >= 7500) {
		if (!steam_get_achievement("bag_of_gold"))
		steam_set_achievement("bag_of_gold")
		
		if (!steam_get_achievement("golden_bag"))
			steam_set_achievement("golden_bag")
	}
	else if (global.money >= 1000 and !steam_get_achievement("bag_of_gold"))
		steam_set_achievement("bag_of_gold")
}
	
if (global.levels_withoutDying > 2 and !steam_get_achievement("immortal"))
	steam_set_achievement("immortal")
	
if (ds_list_size(global.takenLootboxes) >= 5 and !steam_get_achievement("treasure_hunter"))
	steam_set_achievement("treasure_hunter")
	
if (!isRoomOut)
	update_steam_score()
	
if (room != roomBeforeRoad and room != roomRoad and !is_room_out())
	audio_stop_all()
else if (!is_room_out())
	audio_stop_sound(sndMusicMenu)