/// @param saveKey*
function save_quests() {

	if (can_save()) {
		ds_list_clear(global.list_questScore)
		ds_list_clear(global.list_quest)

		for (var i = 0; i < 40; i++) {
			ds_list_add(global.list_quest, global.quest[i] == -1 ? -1 : object_get_name(global.quest[i]))
			ds_list_add(global.list_questScore, global.questScore[i])
		}
	
		var ds_size = ds_list_size(global.questsFinished)
		for (var i = 0; i < ds_size; i++)
			ds_list_replace(global.questsFinished, i, object_get_name(ds_list_find_value(global.questsFinished, i)))

		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_string("u4u4sch", "b3b5saju2", ds_list_write(global.questsFinished))
			ini_write_string("u4u4sch", "62adt34te", ds_list_write(global.list_questScore))
			ini_write_string("u4u4sch", "gfbn3an4e", ds_list_write(global.list_quest))
		if (argument_count == 1) ini_close()
	
		var ds_size = ds_list_size(global.questsFinished)
		for (var i = 0; i < ds_size; i++)
			ds_list_replace(global.questsFinished, i, asset_get_index(ds_list_find_value(global.questsFinished, i)))
	}


}
