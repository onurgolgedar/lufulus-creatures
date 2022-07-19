#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg, type_physicaldamage)+skill_get_value(object_index, upg, type_magicaldamage)
//var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)

if (eng()) {
	description = "Performs a flame attack on an area.\n"
	+"Deals both sudden and permanent damage.\n"
	+"As the character focuses, it can be cast\n"
	+"further and larger areas.\n\n"
	+"Min. Areal Damage: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(100*damageRatio2))+"% Magical Power)[/c]\n\n"
	+"Max. Areal Damage: [c="+string(c_fuchsia)+"]"+string(2*damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(2*100*damageRatio2))+"% Magical Power)[/c]\n\n"
	+"Fire Damage: Deals the same damage\nin 4 seconds."
}
else {
	description = "Bir alana alev saldırısı gerçekleştirir.\n"
	+"Hem ani hem de sürekli hasar verir.\n"
	+"Karakter odaklandıkça daha uzak ve\n"
	+"büyük bir alana hasar verebilir.\n\n"
	+"Min. Alan Hasarı: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(100*damageRatio2))+"% Büyü Gücü)[/c]\n\n"
	+"Maks. Alan Hasarı: [c="+string(c_fuchsia)+"]"+string(2*damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(2*100*damageRatio2))+"% Büyü Gücü)[/c]\n\n"
	+"Yanma Hasarı: Aynı hasarı 4 saniye\niçerisinde tekrar verir."
}

event_inherited()