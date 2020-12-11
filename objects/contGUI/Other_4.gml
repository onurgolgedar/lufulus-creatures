visible = true

ltext_level = eng() ? " lv." : " sv."
ltext_level2 = eng() ? "Level " : "Seviye "
ltext_boss = eng() ? " lv. Superior Creature" : " sv. Üstün Yaratık"
ltext_wisdom = eng() ? " lv." : " sv."
ltext_aggressive = eng() ? "Aggressive" : "Agresif"
ltext_armed = eng() ? "Mode: Armed" : "Mod: Silahlı"
ltext_unarmed = eng() ? "Mode: Unarmed" : "Mod: Silahsız"
ltext_mode = ""
ltext_daytime = ""
ltext_barexperience = eng() ? "Experience" : "Tecrübe"
ltext_combo = eng() ? "Combo" : "Kombo"
challengeText = eng() ? " challenge(s)" : " sözleşme"
event_user(9)

colorScreenAlpha = 1
colorScreenColor = c_black

expBarAlpha = 0
hideSummaryInfo_alpha = false

redScreenAlpha = 0
redScreenTarget = 0
redScreenIncrease = 0

delta_alarm(1, 30)
alarm[5] = 3

event_perform(ev_other, ev_user0)
event_perform(ev_other, ev_user1)
draw_set_default()

if (!contMain.isRoomOut) {	
	roomNameAlpha = 1
	delta_alarm(3, sec)
}

findButton_exists = is_castle(room)

deathEffect = instance_exists(efboxDeath)