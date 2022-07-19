#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg, type_physicaldamage)+skill_get_value(object_index, upg, type_magicaldamage)
//var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)
var healRatio = skill_get_value(object_index, upg, type_value, true)
var heal = healRatio*global.magicalPower

if (eng()) {
	description = "Performs a dark magical shot\n"
	+"that deals huge amount of damage.\n\n"
	+"Target spawns a soul piece. If the piece\n"
	+"is taken by an enemy, 2 new pieces are\n"
	+"spawned and the enemy takes the half\n"
	+"of the main damage. Pieces heal you.\n\n"
	+"Magical Damage: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(100*damageRatio2))+"% Magical Power)[/c]\n\n"
	+"Heal: [c="+string(c_niceblue)+"]"+string(heal)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(100*healRatio))+"% Magical Power)[/c]"
}
else {
	description = "Karanlık bir büyü atışı gerçekleştirir.\n"
	+"Vurulan hedef yüksek hasar alır.\n\n"
	+"Hedef iyileşme sağlayan bir ruh parçası bırakır.\n"
	+"Bu parça, rakip tarafından alınırsa yok olur,\n"
	+"yarı hasarı vererek 2 parça daha oluşturur.\n"
	+"Parçalar seni iyileştirir.\n\n"
	+"Büyü Hasarı: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"](%"+string(round(100*damageRatio2))+" Büyü Gücü)[/c]\n\n"
	+"İyileştirme: [c="+string(c_niceblue)+"]"+string(heal)+"[/c]\n"
	+"[c="+string(c_ltpink)+"](%"+string(round(100*healRatio))+" Büyü Gücü)[/c]"
}

description += eng() ? "\n[UNDER DEVELOPMENT]" : "\n[YAPIM AŞAMASINDA]"

event_inherited()