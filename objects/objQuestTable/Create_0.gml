event_inherited()

page = 1
maxPage = 5

for (var i = 1; i <= maxPage; i++) {
	blueBack_start[i] = -1
	orangeBack_start[i] = -1
	yellowBack_start[i] = -1
	
	blueBack_end[i] = -1
	orangeBack_end[i] = -1
	yellowBack_end[i] = -1
}

horizontalBoxCount = 1
verticalBoxCount = 8

offset_x = 10
offset_yTop = 130+IS_MOBILE*4//112
offset_yDown = 32
boxWidth = 320
boxHeight = 32+IS_MOBILE*13
boxBetween = 7
boxBetween_additionalV = 0

tab_index = maxPage+1

event_perform(ev_other, ev_user3)

fm_activate(5)

mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnExit = false
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseOnPageButton3 = false
mouseOnPageButton4 = false
mouseOnPageButton5 = false
front = true
destroy = false
owner = objPlayer.id
imaginaryClick = false
multitouchClick = false

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_quests = eng() ? "Active Quests" : "Aktif Görevler"
ltext_info = eng() ? "Info Message" : "Bilgi Mesajı"

var text = eng() ? "Auto Quests\nQuests grouped at the bottom are\nsimpler quests activated automatically." : "Hızlı Görevler\nEn altta gruplanan görevler otomatik\nolarak gelen daha basit görevlerdir."
var title = eng() ? "" : ""
var tutorialBox = tutorial_box_owned(title, text, id, 310, 104, 17)
if (tutorialBox != pointer_null) {
	tutorialBox.offset_y -= 43
	tutorialBox.offset_x += 214
	tutorialBox.image_xscale = 0.7
	tutorialBox.image_yscale = 0.7
}