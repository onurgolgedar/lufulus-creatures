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

if (name == "Hunter (Ally)" or name == "Avcı (Dost)" and protection_owner != objPlayer.id)
	ask_npc(eng() ? "What?" : "Ne var?", 1, eng() ? "Join me." : "Bana katıl.", eng() ? "Do you know anything\nabout this area?" : "Bu bölgeyle ilgili bir\nşey biliyor musun?", "Cancel")