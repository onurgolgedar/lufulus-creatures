event_inherited()
name = sk_8

maxRem = 6*sec
mana = 70
passive = false

maxUpgrade = 4

condition = true
conditionText = ""
addDesc = ""

#region FIXED
addDesc += string_return(string_return("\n\n", addDesc != "")+conditionText, !condition)

type = type_skill
cMaxRem = maxRem
cMana = mana

event_perform(ev_other, ev_user0)
#endregion