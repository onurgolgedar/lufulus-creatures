#region FIXED
var upgsub1 = upgrade+virtual-1
#endregion

cMana = mana+upgsub1*60
cMaxRem = maxRem-upgsub1*2*sec
neededPoints = 99//4

#region FIXED
if (!passive) {
	skillCostText =
	"[c="+string(c_aqua)+"]"
	+string_return("Mana: "+string(cMana)+"\n", cMana > 0)
	+(eng() ? "Cooldown: " : "Hazırlanma Süresi: ")+string(cMaxRem/sec)+" s[/c]"
}
else {
	skillCostText =
	"[c="+string(c_aqua)+"]"+(eng() ? "This affects constantly" : "Bu etki sürekli devam eder.")+"[/c]"
}

event_perform(ev_other, ev_user1)
#endregion