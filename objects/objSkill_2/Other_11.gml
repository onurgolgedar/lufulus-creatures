#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var dmg = skill_get_value(object_index, upg)
var dmgRatio = skill_get_value(object_index, upg, type_physicaldamage, true)

if (eng()) {
	description = "You can use your shield for [c="+string(c_niceblue)+"]"+string(skill_get_value(object_index, upg, type_duration)/sec)+" seconds[/c]"
	+"\nwhile you are attacking."
	+"\n\nIn addition, the first basic attack after"
	+"\nuse, stuns the opponent with an extra"
	+"\n[c="+string(c_red)+"]"+string(round(dmg))+"[c="+string(c_orange)+"]("+string(round(dmgRatio*100))+"% Physical Power)[/c] damage. During this"
	+"\ntime the shield will not slow you."
}
else {
	description = "[c="+string(c_niceblue)+"]"+string(skill_get_value(object_index, upg, type_duration)/sec)
	+" saniye[/c] boyunca kalkanını basit saldırı\nyaparken de kullanırsın."
	+"\n\nAyrıca kullanımdan sonraki ilk basit saldırı\n"
	+"fazladan [c="+string(c_red)+"]"+string(round(dmg))+"[c="+string(c_orange)+"](%"+string(round(dmgRatio*100))+" Fiziksel Güç)[/c] hasar vererek"
	+"\nrakibi sersemletir. Bu süre boyunca kalkan,"
	+"\nseni yavaşlatamaz."
}

event_inherited()