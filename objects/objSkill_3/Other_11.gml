#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

//var value = skill_get_value(object_index, upg, type_value)
var value2 = skill_get_value(object_index, upg, type_value)
var value3 = skill_get_value(object_index, upg, type_value2)

if (eng()) {
	description = "Physical attacks provide [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] healing."
	+"\nBasic attacks cause [c="+string(c_niceblue)+"]"+string(value3)+"%[/c] more powerful critical strike."
}
else {
	description = "Fiziksel saldırıların [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] iyileşme sağlar."
	+"\nBasit vuruşların [c="+string(c_niceblue)+"]"+string(value3)+"%[/c] daha yüksek kritik hasar verir."
}

event_inherited()