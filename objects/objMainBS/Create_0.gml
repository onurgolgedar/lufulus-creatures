event_inherited()
name = sk_0

maxRem = 8.5*sec
mana = 40
passive = false

neededPoints = 1
maxUpgrade = -1

condition = true
conditionText = "\n\n"+""
addDesc = ""

#region FIXED
addDesc += string_return(string_return("\n\n", addDesc != "")+conditionText, !condition)

type = type_skill
cMaxRem = maxRem
cMana = mana

event_perform(ev_other, ev_user0)
#endregion