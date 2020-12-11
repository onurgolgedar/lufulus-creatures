/// @param quest
/// @param repeatable
function handle_quest() {

	var v_quest = argument[0]
	ds_list_add(quests, v_quest)

	if (is_quest_available(v_quest, argument[1])) {
		ds_list_add(availableQuests, v_quest)
		v_quest = instance_create(-50, -50, v_quest)
	
		with (v_quest) {
			event_perform(ev_other, ev_user1)
			ds_list_add(other.availableQuests_desc, earlyDescription+"\n\n[c="+string(c_yellow)+"]"+description+"[/c]")
		}
		
		instance_destroy(v_quest)
	}


}
