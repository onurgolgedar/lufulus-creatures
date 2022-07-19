#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var value = skill_get_value(object_index, upg, type_value)
var value2 = skill_get_value(object_index, upg, type_value2)

if (eng()) {
	description = "Stuns [c="+string(c_niceblue)+"]"+string(value)+"[/c] seconds more."
	+"\nGives [c="+string(c_niceblue)+"]"+string(value2)+"%[/c] more damage reduction."
	+"\n\n[c="+string(c_negativered)+"]Disadvantage: Causes 40% more slow effect.[/c]"
	+"\nDisadvantage disappears when upgrade level is [c="+string(c_customgreen2)+"]"+string(maxUpgrade)+".[/c]"
}
else {
	description = "[c="+string(c_niceblue)+"]"+string(value)+"[/c] saniye fazladan sersemletir."
	+"\n[c="+string(c_niceblue)+"]"+string(value2)+"%[/c] fazladan hasar azaltma kazandırır."
	+"\n\n[c="+string(c_negativered)+"]Dezavantaj: 40% daha fazla\nyavaşlamana sebep olur.[/c]"
	+"\n[c="+string(c_customgreen2)+"]"+string(maxUpgrade)+". gelişimde olumsuz etkisi kaybolur.[/c]"
}

event_inherited()