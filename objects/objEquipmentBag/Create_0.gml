event_inherited()

page = 1
maxPage = 1

horizontalBoxCount = 3
verticalBoxCount = 3

offset_x = 10
offset_yTop = 55
offset_yDown = 10
boxEdge = 50+IS_MOBILE*13
boxBetween = 4-IS_MOBILE

event_perform(ev_other, ev_user3)

mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseLeft_justPressed_i = -1
mouseLeft_justPressed_j = -1
front = false
destroy = false
mouseOnExit = false
owner = objPlayer.id
imaginaryClick = false
multitouchClick = false

tab_index = maxPage+1

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
delta_alarm(6, sec/10)

ltext_equipment = eng() ? "Equipment" : "Ekipman"
ltext_equip = eng() ? "" : ""
ltext_cannotequip = eng() ? "" : ""

ltext_noneck = eng() ? "No Necklace" : "Kolye yok."
ltext_nosword = eng() ? "No Sword" : "Kılıç yok."
ltext_noclothes = eng() ? "No Clothes" : "Kıyafet yok."
ltext_noshield = eng() ? "No Shield/Bow" : "Kalkan/Yay yok."
ltext_norune = eng() ? ("No Rune\nRunes can be bougth\nfrom sellers. ([c="+string(c_aqua)+"]Level: 16[/c])") : ("Rün yok.\nRünler satıcılardan satın\nalınabilir. ([c="+string(c_aqua)+"]Seviye: 16[/c])")

if (!IS_MOBILE) {
	var qKey_text = global.gamepad_active ? "<Y>" : "<Q>"
	var text = eng() ? "Switch Weapons\n[c="+string(c_white)+"]Press "+qKey_text+"[/c] to switch between weapons." : "Silah Değiştir\n[c="+string(c_white)+"]"+qKey_text+"[/c] ile silahların arasında\ngeçiş yapabilirsin."
	var title = eng() ? "" : ""
	var tutorialBox = tutorial_box_owned(title, text, id, 150+IS_MOBILE*25, 80-IS_MOBILE*7, 13)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 43
		tutorialBox.offset_x += 169+eng()*45
		tutorialBox.image_xscale = 0.7
		tutorialBox.image_yscale = 0.7
	}
}