#region FIXED
draw_set_font(fontItemInfo)

var upg = upgrade+virtual
#endregion

var dmg = skill_get_value(object_index, upg)
var dmgRatio = skill_get_value(object_index, upg, type_physicaldamage, true)

if (eng()) {
	description = 
	"You make a big and powerful attack.\n"+
	"The attack pushs opponents by giving\n"+
	"[c="+string(c_red)+"]"+string(dmg)+"[c="+string(c_orange)+"]("+string(round(dmgRatio*100))+"% Physical Power)[/c] damage.\n\n"+
	"If it is critical, damage is doubled and\n"+
	"causes bleeding which gives [c="+string(c_white)+"]"+string(100*sv_sk1_bleedingRatio)+"%[/c]\n"+
	"additional true damage in 3 seconds."
}
else {
	description = "Geniş ve güçlü bir saldırı yaparsın."
	+"\nSaldırı [c="+string(c_red)+"]"+string(dmg)
	+"[c="+string(c_orange)+"](%"+string(round(dmgRatio*100))+" Fiziksel Güç)"
	+"[/c] hasar\nvererek rakipleri savuşturur."
	+"\n\nKritik olursa hasar katlanır ayrıca"
	+"\n3 saniyede ekstra [c="+string(c_white)+"]%"+string(100*sv_sk1_bleedingRatio)+"[/c] kesin hasar\nveren kanamaya neden olur."
}

event_inherited()