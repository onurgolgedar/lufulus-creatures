#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg)
//var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)
var lifesteal = skill_get_value(object_index, upg, type_value, true)

if (eng()) {
	description = "The character radiates from four sides\n"
	+"for 10 seconds and gains 10% movement\n"
	+"speed and [c="+string(c_niceblue)+"]"+string(lifesteal)+"% lifesteal[/c]. Beams deal\n"
	+"[c="+string(c_purple)+"]"+string(damage)+"[/c][c="+string(c_ltpink)+"](%"+string(round(100*damageRatio2))+" Magical Power)[/c] magical damage\neach second."
	
}
else {
	description = "Karakter 10 saniyeliğine 4 tarafından ışınlar\n"
	+"saçarak %10 hızlanır. Işınlar değdiği rakiplere\n"
	+"saniyede [c="+string(c_purple)+"]"+string(damage)+"[/c]"
	+"[c="+string(c_ltpink)+"](%"+string(round(100*damageRatio2))+" Büyü Gücü)[/c]"
	+" hasar verir.\n"
	+"Bu süre boyunca [c="+string(c_niceblue)+"]%"+string(lifesteal)+" can çalma[/c] kazanır."
}

description += eng() ? "\n[UNDER DEVELOPMENT]" : "\n[YAPIM AŞAMASINDA]"

event_inherited()