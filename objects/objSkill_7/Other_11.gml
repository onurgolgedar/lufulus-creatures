#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var value = skill_get_value(object_index, upg, type_value)
var value2 = skill_get_value(object_index, upg, type_value2)

if (eng()) {
	description = "Compared to the collected power,"
	+"\nCooldown decreases by [c="+string(c_niceblue)+"]"+string(value)+"% - "+string(value*2)+"%[/c]."
	+"\nHeals [c="+string(c_niceblue)+"]"+string(value2)+"% - "+string(value2*2)+"%[/c] health."
	+"\n\n[c="+string(c_negativered)+"]Disadvantage: Prevents doing basic attacks\nwhile "+sk_0+" is being used.[/c]"
	+"\nDisadvantage disappears when upgrade level is [c="+string(c_customgreen2)+"]"+string(maxUpgrade)+".[/c]"
} else {
	description = "Biriktilen güce göre,"
	+"\n[c="+string(c_niceblue)+"]"+string(value)+"% - "+string(value*2)+"%[/c] bekleme süresi azalır."
	+"\n[c="+string(c_niceblue)+"]"+string(value2)+"% - "+string(value2*2)+"%[/c] iyileştirir."
	+"\n\n[c="+string(c_negativered)+"]Dezavantaj: "+sk_0+" kullanımdayken\nbasit saldırı yapabilmenizi engeller.[/c]"
	+"\n[c="+string(c_customgreen2)+"]"+string(maxUpgrade)+". gelişimde olumsuz etkisi kaybolur.[/c]"
}

event_inherited()