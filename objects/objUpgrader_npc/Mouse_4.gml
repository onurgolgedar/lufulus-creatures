#region Click Test
if (test_upperclick_window() or test_upperclick_gui())
	exit

if (death or mode == md_attack)
	exit

if (point_distance(x, y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE
or collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
	instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
	show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
	exit
}
#endregion

targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)

/*#region // ? (it is old, it is here to show the rule) QUEST BLACKSMITH DIALOGUE
if (is_quest_incomplete(objQuest_blacksmith2)) {
	dialogue_progress(1, 1, id)
	
	exit
}
#endregion*/

var text
var isEnglish = eng()
text[0] = isEnglish ? "I can make your weapons and\narmor better." : "Silahlarını ve zırhlarını çok daha\niyi yapabilirim."
text[1] = isEnglish ? "How can I upgrade?" : "Nasıl eşya geliştirebilirim?"
text[2] = isEnglish ? "What if you fail?" : "Ya hata yaparsan?"
text[4] = isEnglish ? npc_goore+" sent me." : "Beni "+npc_goore+" gönderdi."

ask_npc(text[0], 1, eng() ? "Buy Materials" : "Materyal Satın Al", text[1], text[2]
, string_return(text[4], is_quest_incomplete(objQuest_blacksmith2) and room == roomCastle_area), "Cancel")