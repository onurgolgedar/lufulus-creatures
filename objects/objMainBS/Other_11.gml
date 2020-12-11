#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var dmg = skill_get_value(objMainBS, upg, type_physicaldamage)
var dmgRatio1 = skill_get_value(objMainBS, upg, type_physicaldamage, true)
var dmgRatio2 = skill_get_value(objMainBS, upg, type_magicaldamage, true)

if (eng()) {
	description = "While collecting explosion power,\nthe character gains [c="+string(c_niceblue)+"]20%[/c] damage reduction."
	+"\nThe damage increases as you focus more.[/c]"
	+"\n[c="+string(c_niceblue)+"]stuns[/c] enemies and pushes the all objects around."
	+"\n\nMin. Magical Damage: "+string(dmg)+"\n([c="+string(c_ltpink)+"]"+string(round(100*dmgRatio2))+"% Magical Power[/c] + [c="+string(c_orange)+"]"+string(round(100*dmgRatio1))+"% Physical Power[/c])"
	+"\n\nMax. Magical Damage: "+string(dmg*2)+"\n([c="+string(c_ltpink)+"]"+string(round(100*2*dmgRatio2))+"% Magical Power[/c] + [c="+string(c_orange)+"]"+string(round(100*2*dmgRatio1))+"% Physical Power[/c])"
}
else {
	description = "[c="+string(c_niceblue)+"]20%[/c] hasar azaltma sağlarken, patlayacak bir güç biriktirir."
	+"\nOdak süresi arttıkça patlama hasarı artar."
	+"\nRakipleri ve cisimleri etrafa savuşturur ve [c="+string(c_niceblue)+"]sersemletir.[/c]"
	+"\n\nMin. Büyü Hasarı: "+string(dmg)+"\n([c="+string(c_ltpink)+"]%"+string(round(100*dmgRatio2))+" Büyü Gücü[/c] + [c="+string(c_orange)+"]%"+string(round(100*dmgRatio1))+" Fiziksel Güç[/c])"
	+"\n\nMaks. Büyü Hasarı: "+string(dmg*2)+"\n([c="+string(c_ltpink)+"]%"+string(round(100*2*dmgRatio2))+" Büyü Gücü[/c] + [c="+string(c_orange)+"]%"+string(round(100*2*dmgRatio1))+" Fiziksel Güç[/c])"
}

event_inherited()