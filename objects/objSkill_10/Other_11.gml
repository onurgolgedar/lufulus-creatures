#region FIXED
draw_set_font(fontiteminfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg, type_physicaldamage)+skill_get_value(object_index, upg, type_magicaldamage)
var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)
var duration = skill_get_value(object_index, upg, type_value)

if (eng()) {
	description = "Throws an arrow that deals [c="+string(c_fuchsia)+"]"+string(damage)+"[/c] magical damage.\n"
	+"([c="+string(c_ltpink)+"]"+string(round(100*damageRatio2))+"% Magical Power[/c] + [c="+string(c_orange)+"]"+string(round(100*damageRatio1))+"% Physical Power[/c]).\n"
	+"The shot freezes the target and nearby targets by [c="+string(c_niceblue)+"]"+string(duration)+" sec.[/c]\n"
	+"Nearby enemies take half of the damage.\n\n"
	+"If a freezed enemy is stunned, takes full damage again."
}
else {
	description = "Hasar veren bir buzul ok atar.\n"
	+"Hasar hedefin etrafına yarı etki eder.\n"
	+"Etki alanındaki tüm hedefleri [c="+string(c_niceblue)+"]"+string(duration)+" sn.[/c]\ndondurur.\n\n"
	+"Dondurulmuş rakipler sersemletilirse,\n"
	+"buz kırılır ve tam hasarı tekrar alırlar.\n\n"
	+"Büyü Hasarı: [c="+string(c_fuchsia)+"]"+string(damage)+"[/c]\n([c="+string(c_ltpink)+"]%"+string(round(100*damageRatio2))+" Büyü Gücü[/c] + [c="+string(c_orange)+"]%"+string(round(100*damageRatio1))+" Fiziksel Güç[/c])"
}

event_inherited()