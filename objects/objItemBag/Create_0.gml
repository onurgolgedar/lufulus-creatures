event_inherited()

page = global.newLoot ? 3 : 1
maxPage = global.bagMaxPage
beforePage = page

horizontalBoxCount = global.bagBoxCount_horizontal
verticalBoxCount = global.bagBoxCount_vertical

offset_x = 10
offset_yTop = 61+IS_MOBILE*6
offset_yDown = 57+IS_MOBILE*6
boxEdge = 50+IS_MOBILE*13
boxBetween = 4-IS_MOBILE

event_perform(ev_other, ev_user3)

mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseOnPageButton3 = false
mouseOnEquipmentButton = false
mouseLeft_justPressed_i = -1
mouseLeft_justPressed_j = -1
front = false
destroy = false
mouseOnExit = false
owner = objPlayer.id
imaginaryClick = false
multitouchClick = false
multitouchClick = false

tab_index = maxPage+1

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_items = eng() ? "Items" : "Eşyalar"
ltext_equipment = eng() ? "Equipment" : "Ekipman"
ltext_buy = eng() ? "" : ""
ltext_putout = eng() ? "" : ""
ltext_take = eng() ? "" : ""
ltext_new = eng() ? "Loot" : "Ganimet"

var text = eng() ? "Equipped Items\nBy using Equipments button, you\ncan see your equipments." : "Kullanılan Eşyalar\nEkipman butonunu kullanarak\nekipmanlarına erişebilirsin."
var title = eng() ? "" : ""
var tutorialBox = tutorial_box_owned(title, text, id, 199+IS_MOBILE*60, 359+IS_MOBILE*69, 2)
if (tutorialBox != pointer_null) {
	tutorialBox.offset_y += 7
	tutorialBox.image_xscale = 0.7
	tutorialBox.image_yscale = 0.7
}