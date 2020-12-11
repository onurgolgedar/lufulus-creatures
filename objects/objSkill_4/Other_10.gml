cMana = mana
cMaxRem = maxRem
neededPoints = 3//upgrade == 0 ? 4 : 2

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