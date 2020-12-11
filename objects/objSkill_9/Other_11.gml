#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var damage = skill_get_value(object_index, upg, type_physicaldamage)+skill_get_value(object_index, upg, type_magicaldamage)
var damageRatio1 = skill_get_value(object_index, upg, type_physicaldamage, true)
var damageRatio2 = skill_get_value(object_index, upg, type_magicaldamage, true)

if (eng()) {
	description = "Throws an arrow that damages [c="+string(c_red)+"]"+string(damage)+"[/c].\n"
	+"([c="+string(c_ltpink)+"]"+string(round(100*damageRatio2))+"% Magical Power[/c] + [c="+string(c_orange)+"]"+string(round(100*damageRatio1))+"% Physical Power[/c]).\n"
	+"Nearby enemies will be pulled to the\n"
	+"center and dealt half damage.\n\n"
	+"If the attack is critical, the target will\n"
	+"be slowed and damage will be doubled."
}
else {
	description = "[c="+string(c_red)+"]"+string(damage)+"[/c] hasar veren bir ok saldırısı gerçekleştirir.\n"
	+"([c="+string(c_ltpink)+"]%"+string(round(100*damageRatio2))+" Büyü Gücü[/c] + [c="+string(c_orange)+"]%"+string(round(100*damageRatio1))+" Fiziksel Güç[/c]).\n"
	+"Hedefin etrafındakilere yarı hasar verir ve çeker.\n\n"
	+"Kritik olursa yavaşlatır ve hasar ikiye katlanır."
}

event_inherited()