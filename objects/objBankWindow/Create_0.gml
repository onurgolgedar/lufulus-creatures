event_inherited()

page = 1
maxPage = global.bagMaxPage
beforePage = page
greenPage = false

horizontalBoxCount = global.bagBoxCount_horizontal
verticalBoxCount = global.bagBoxCount_vertical

offset_x = 10
offset_yTop = 61+IS_MOBILE*4
offset_yDown = 13+52+52
boxEdge = 50+IS_MOBILE*13
boxBetween = 4-IS_MOBILE

bankItems_totalActivatedRent = 0
bankItems_totalPotentialRent = 0

event_perform(ev_other, ev_user3)

mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseOnPageButton3 = false
mouseOnTakeButton = false
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
alarm[3] = 1
delta_alarm(6, sec/10)

ltext_bank = eng() ? "Bank" : "Banka"
ltext_add = eng() ? "" : ""
ltext_active = eng() ? "" : ""
ltext_potential = eng() ? "Potential Revenue: " : "    Potansiyel Kazanç: "
ltext_activated = eng() ? "Daily Revenue: " : "            Günlük Kazanç: "
ltext_collected = eng() ? "Total Rent: " : "Toplanan Kira: "
ltext_take = eng() ? "Take" : "Al"

var text
if (!IS_MOBILE)
	text = eng() ? "Renting\nItems in the bank produces gold as much as "+string(round(BANK_RENT_RATIO*100))+"% of their worth each day\nstarting their 2nd day. Valuable items (platinum, gold etc.) generate\ntwice of this value." : "Kiralama\nBankada tutulan eşyalar 2. günden sonra\ngün başına %"+string(round(BANK_RENT_RATIO*100))+" kira getirisi sağlar. Bu kazanç\ndeğerli eşyalar için (platin gibi) iki katına çıkar."
else
	text = eng() ? "Renting\nItems in the bank produces gold\nas much as "+string(round(BANK_RENT_RATIO*100))+"% of\ntheir worth each day starting\ntheir 2nd day. Valuable items\n(platinum etc.) generate twice\nof this value." : "Kiralama\nBankada tutulan eşyalar 2. günden\nsonra gün başına %"+string(round(BANK_RENT_RATIO*100))+" kira getirisi\nsağlar. Bu kazanç değerli eşyalar için\n(platin gibi) iki katına çıkar."

var title = eng() ? "" : ""
var tutorialBox = tutorial_box_owned(title, text, id, 94+!eng()*7+IS_MOBILE*8, 28, 22)
if (tutorialBox != pointer_null) {
	tutorialBox.offset_x += (468+5*!eng())*IS_MOBILE
	tutorialBox.offset_y -= 180*!IS_MOBILE
	//tutorialBox.offset_x += 0
	tutorialBox.image_xscale = 0.7+IS_MOBILE*0.07
	tutorialBox.image_yscale = 0.7+IS_MOBILE*0.07
}

if (!IS_MOBILE)
	text = eng() ? "Advanced Renting\nTotal gold in the bank is increased by "+string(round(100*BANK_INTEREST_RATIO))+"% every day.\nThis rate is "+string(round(100*BANK_INTEREST_RATIO_PERTITLE))+"% more for each title you have.\nEach empty page of the bank increases daily\nrevenue(activated revenue) from renting by "+string(round(100*BANK_EMPTYPAGEBONUS_RATIO))+"%." : "İleri Seviye Kiralama\nHer gün bankada bulunan toplam kira %"+string(round(100*BANK_INTEREST_RATIO))+" artar.\nBu oran sahip olduğun ünvan başına %"+string(round(100*BANK_INTEREST_RATIO_PERTITLE))+" daha artar.\nKullanılmayan her banka sayfası kiradan alınan\ngünlük geliri(aktif kazanç) %"+string(round(100*BANK_EMPTYPAGEBONUS_RATIO))+" arttırır."
else
	text = eng() ? "Advanced Renting\nTotal gold in the bank is increased\nby "+string(round(100*BANK_INTEREST_RATIO))+"% every day. This rate is "+string(round(100*BANK_INTEREST_RATIO_PERTITLE))+"%\nmore for each title you have.\nEach empty page of the bank\nincreases daily revenue from\nrenting by "+string(round(100*BANK_EMPTYPAGEBONUS_RATIO))+"%." : "İleri Seviye Kiralama\nHer gün bankada bulunan toplam kira\n%"+string(round(100*BANK_INTEREST_RATIO))+" artar. Bu oran sahip\nolduğun ünvan başına %"+string(round(100*BANK_INTEREST_RATIO_PERTITLE))+" daha artar.\nKullanılmayan her banka sayfası\nkiradan alınan günlük geliri %"+string(round(100*BANK_EMPTYPAGEBONUS_RATIO))+"\narttırır."

var title = eng() ? "" : ""
var tutorialBox = tutorial_box_owned(title, text, id, 132+!eng()*6+IS_MOBILE*21, 28, 24)
if (tutorialBox != pointer_null) {
	tutorialBox.offset_x += (426+4*!eng())*IS_MOBILE
	tutorialBox.offset_y -= 210*!IS_MOBILE
	//tutorialBox.offset_x += 0
	tutorialBox.image_xscale = 0.7+IS_MOBILE*0.07
	tutorialBox.image_yscale = 0.7+IS_MOBILE*0.07
}