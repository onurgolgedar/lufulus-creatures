#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var value = skill_get_value(object_index, upg, type_value)
var value2 = skill_get_value(object_index, upg, type_value2)
var value3 = skill_get_value(object_index, upg, type_value3)

if (eng()) {
	description = "Regenerates [c="+string(c_niceblue)+"]"+string(value)+"%[/c] of max health each second."
	+"\nGives [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] magical resistance."
	+"\nGives [c="+string(c_niceblue)+"]"+string(value3)+"%[/c] damage reduction."
} else {
	description = "Her saniye toplam canının [c="+string(c_niceblue)+"]"+string(value)+"%[/c] kadarı dolar."
	+"\n[c="+string(c_niceblue)+"]"+string(value2)+"%[/c] büyü direnci kazanırsın."
	+"\n[c="+string(c_niceblue)+"]"+string(value3)+"%[/c] hasar azaltma kazanırsın."
}

event_inherited()