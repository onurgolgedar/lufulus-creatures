#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg, type_physicaldamage)+skill_get_value(object_index, upg, type_magicaldamage)
//var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)
var time = skill_get_value(object_index, upg, type_value)

if (eng()) {
	description = "Your flying pet strikes using lightning bolts.\n"
	+"It strikes per sec(s). Strikes stun enemies for\n"
	+"0.25 sec. Strikes spread between targets.\n\n"
	+"Lightning Damage: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"]("+string(round(100*damageRatio2))+"% Magical Power)[/c]\n\n"
	+"Strike Freq.: [c="+string(c_niceblue)+"]"+string(time)+" second(s)[/c]\n"
	+"Duration: [c="+string(c_niceblue)+"]10 seconds[/c]"
}
else {
	description = "Uçan petiniz yıldırım saldırıları gerçekleştirir.\n"
	+"Yıldırımdan hasar gören rakipler yıldırımı\n"
	+"diğer hedeflere yayar.\n\n"
	+"Yıldırım Hasarı: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n"
	+"[c="+string(c_ltpink)+"](%"+string(round(100*damageRatio2))+" Büyü Gücü)[/c]\n\n"
	+"Yıldırım Sıklığı: "+"[c="+string(c_niceblue)+"]"+string(time)+" saniye[/c]\n"
	+"Etki Süresi: [c="+string(c_niceblue)+"]10 saniye[/c]"
}

description += eng() ? "\n[UNDER DEVELOPMENT]" : "\n[YAPIM AŞAMASINDA]"

event_inherited()