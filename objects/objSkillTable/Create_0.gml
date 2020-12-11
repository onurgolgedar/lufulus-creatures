event_inherited()

page = 1
maxPage = 3

horizontalBoxCount = 10
verticalBoxCount = 6

isActive = global.selectedSkill[4] == objMainBS

offset_x = 10
offset_yTop = 82+IS_MOBILE*13
offset_yDown = 57*isActive
cut_right = 0
boxEdge = 45/*-!isActive*13*/
boxBetween = 6
boxBetween_additionalV = 30
upgradePart_offset_x = 100
upgradePart_length = 80
greenForeground_alpha = 0

event_perform(ev_other, ev_user3)

mouseOnExit = false
mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnBox_forUpgrade = false
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseOnPageButton3 = false
mouseLeft_justPressed_i = -1
mouseLeft_justPressed_j = -1
front = true
destroy = false
owner = objPlayer.id
imaginaryClick = false
multitouchClick = false

tab_index = maxPage+1
tab_onSkill = -1

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
alarm[2] = 5
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_actives = eng() ? "Active Skills" : "Aktif Yetenekler"
ltext_passives = eng() ? "Passive Skills" : "Pasif Yetenekler"
ltext_supershock = eng() ? sk_0 : sk_0
ltext_upgrade = eng() ? "Upgrade" : "Geliştir"
ltext_unlock = eng() ? "Unlock" : "Öğren"
ltext_tier = eng() ? "Tier" : "Aşama"
ltext_availablepoints = eng() ? "Skill Points: " : "Beceri Puanların: "
ltext_skillswill = eng() ? "Skills will be available when the character\ndiscovers himself. (Aproximation: Level 13)" : "Beceriler karakter kendini keşfettiğinde\nhazır olacak. (Yaklaşık: Seviye 13)"
ltext_supershock_upgrade = eng() ? sk_0+" is a skill that is\ncustomizable, powerful and all-purpose."
: sk_0+" çok etkili ve özelleştirilebilen\nbir yetenektir."