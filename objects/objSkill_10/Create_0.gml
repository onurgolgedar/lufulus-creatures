event_inherited()
name = sk_10

maxRem = 13*sec
mana = 130
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