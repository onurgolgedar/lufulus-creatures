event_inherited()

page = 2
maxPage = 2

horizontalBoxCount = 10
verticalBoxCount = 3

offset_x = 10
offset_yTop = 82
offset_yDown = 57
boxEdge = 45
boxBetween = 6
boxBetween_additionalV = 30
upgradePart_offset_x = 100
upgradePart_length = 80
cut_right = boxEdge*5
greenForeground_alpha = 0

event_perform(ev_other, ev_user3)

mouseOnExit = false
mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnBox_forUpgrade = false
mouseLeft_justPressed_i = -1
mouseLeft_justPressed_j = -1
front = true
destroy = false
owner = objPlayer.id

tab_index = maxPage+1
tab_onSkill = -1

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
alarm[2] = 5
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_title = eng() ? ("Customize "+sk_0) : (sk_0+" Özelleştir")
ltext_upgrade = eng() ? "Upgrade" : "Geliştir"
ltext_unlock = eng() ? "Unlock" : "Öğren"
ltext_tier = eng() ? "Tier" : "Aşama"
ltext_availablepoints = eng() ? "Skill Points: " : "Beceri Puanların: "

temporaryWindow = false