#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var ratio = skill_get_value(object_index, upg, type_value)

if (eng()) {
	description = "Your next attack with a bow throws five arrows.\n"
	+"Each additional arrow damages [c="+string(c_red)+"]%"+string(round(ratio*100))+"[/c] [c="+string(c_red)+"]less.[/c]\n"
	+"\nOnly the original arrow can do critical strike."
	+"\nArrows that hit decrease the cooldown by 7%."
}
else {
	description = "Bir sonraki yaylı saldırın beşli ok fırlatır.\n"
	+"Ekstra okların her biri [c="+string(c_red)+"]%"+string(round(ratio*100))+"[/c] daha [c="+string(c_red)+"]düşük[/c] hasar verir.\n"
	+"\nSadece düz giden ok kritik hasara neden olabilir."
	+"\nHer saplanan ok bekleme süresini %7 doldurur."
}

event_inherited()