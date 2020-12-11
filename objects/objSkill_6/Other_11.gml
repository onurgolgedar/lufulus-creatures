#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var value = skill_get_value(object_index, upg, type_value)
var value2 = skill_get_value(object_index, upg, type_value2)


if (eng()) {
	description = "Preparation is [c="+string(c_niceblue)+"]"+string(value)+"%[/c] faster."
	+"\nDamages [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] more in 2 seconds."
	+"\n\n[c="+string(c_negativered)+"]Disadvantage: -15% less range[/c]"
	+"\nDisadvantage disappears when upgrade level is [c="+string(c_customgreen2)+"]"+string(maxUpgrade)+".[/c]"
}
else {
	description = "[c="+string(c_niceblue)+"]"+string(value)+"%[/c] daha hızlı güç toplar."
	+"\nFazladan [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] hasarı 2 saniyede verir."
	+"\n\n[c="+string(c_negativered)+"]Dezavantaj: Etki alanı 15% daralır.[/c]"
	+"\n[c="+string(c_customgreen2)+"]"+string(maxUpgrade)+". gelişimde olumsuz etkisi kaybolur.[/c]"
}

event_inherited()