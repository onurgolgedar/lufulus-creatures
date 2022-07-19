event_inherited()

page = 1
maxPage = global.tradeMaxPage

horizontalBoxCount = global.tradeBoxCount_horizontal
verticalBoxCount = global.tradeBoxCount_vertical

offset_x = 10
offset_yTop = 55+IS_MOBILE*10
offset_yDown = 13
offset_yDown_base = offset_yDown
boxEdge = 50+IS_MOBILE*13
boxBetween = 4-IS_MOBILE

mouseOnExit = false
mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseLeft_justPressed_i = -1
mouseLeft_justPressed_j = -1
front = false
destroy = false
owner = objPlayer.id
loot = false
directRun = false
imaginaryClick = false
multitouchClick = false

tab_index = maxPage+1

depth -= instance_number(parWindow)*2

image_alpha = 0

//objPlayer.viewLock = true

with (objMessageBox) {
	if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == paritem and owner.from == window_items)
		close_window()
}

alarm[0] = 1
alarm[2] = 1
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_loot = eng() ? "Loot" : "Ganimet"
ltext_trade = eng() ? "Trade" : "Ticaret"
ltext_sell = eng() ? "" : ""

discount = 0