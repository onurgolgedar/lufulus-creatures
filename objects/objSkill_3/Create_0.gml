event_inherited()
name = sk_3

maxRem = 0
mana = 0
passive = true

maxUpgrade = 5

condition = true//skill_get_upgrade(objSkill_1)+skill_get_upgrade(objSkill_2) > 0
conditionText = ""//"[c="+string(c_white)+"]Need: "+sk_1+" or "+sk_2+"[/c]"
addDesc = ""

#region FIXED
addDesc += string_return(string_return("\n\n", addDesc != "")+conditionText, !condition)

type = type_skill
cMaxRem = maxRem
cMana = mana

event_perform(ev_other, ev_user0)
#endregion