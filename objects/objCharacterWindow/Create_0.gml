event_inherited()

page = (global.statPoints > 0) ? 1 : 2
maxPage = 3

horizontalBoxCount = 0
verticalBoxCount = 0

extraWidth = 290
extraHeight = 509
offset_x = 12
offset_yTop = 13+IS_MOBILE*4
offset_yDown = 13
boxWidth = 0
boxHeight = 0
boxBetween = 0
boxBetween_additionalV = 0
greenForeground_alpha = 0

mouseOnExit = false
mouseOnBody = false
mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnPageButton1 = false
mouseOnPageButton2 = false
mouseOnPageButton3 = false
mouseOnSTR = false
mouseOnDEX = false
mouseOnMP = false
mouseOnVIT = false
mouseOnSTA = false
mouseOnSTR_text = false
mouseOnDEX_text = false
mouseOnMP_text = false
mouseOnVIT_text = false
mouseOnSTA_text = false
mouseOnSaveButton = false
mouseOnUndoButton = false

tab_index = -1

/*global.virtual_str = 0
global.virtual_dex = 0
global.virtual_vit = 0
global.virtual_mp = 0
global.virtual_sta = 0
global.virtual_stat_points = global.statPoints*/

front = true
destroy = false
owner = objPlayer.id
imaginaryClick = false
multitouchClick = false

statText_alpha = -0.3

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

image_alpha = 0

alarm[0] = 1
delta_alarm(6, sec/10)

ltext_str = eng() ? "STR: " : "STR: "
ltext_dex = eng() ? "DEX: " : "DEX: "
ltext_sta = eng() ? "STA: " : "STA: "
ltext_vit = eng() ? "VIT: " : "VIT: "
ltext_mp = eng() ? "MP: " : "MP: "
ltext_availablepoints = eng() ? "Stat Points: " : "Gelişim Puanları: "
ltext_save = eng() ? "Save" : "Kaydet"
ltext_undo = eng() ? "Undo" : "Geri Al"
ltext_info = eng() ? "Character Info" : "Karakter Bilgisi"
ltext_tags = eng() ? "Titles" : "Ünvanlar"
ltext_tags_short = eng() ? "Titles" : "Ünvan"
ltext_stats = eng() ? "Stats" : "Gelişim"
ltext_info2 = eng() ? "Info" : "Bilgi"
ltext_level = eng() ? "Level" : "Seviye"
ltext_mpsta = eng() ? "You can increase MP and STA\nby using stat points after skills\nare available(Y)." : "MP ve STA statları, karakter\nbecerilerini(Y) keşfettiğinde\narttırılabilir."

var text_pure

draw_set_font(fontiteminfo) draw_set_alpha(0)
	ltext_strinfo = eng() ? ("[c="+string(c_lime)+"]Increases Strength[/c]\n+1.6% Physical Damage\n+1% Bleeding Damage\n[c="+string(c_aqua)+"](for each)[/c]") : ("[c="+string(c_lime)+"]Kuvvet Arttır[/c]\n+%1.6 Fiziksel Hasar\n+%1 Daha Güçlü Kanama\n[c="+string(c_aqua)+"](adet başına)[/c]")
	text_pure = draw_text_colortags(0, 0, ltext_strinfo)
	ltext_strinfo_w = string_width(text_pure)
	ltext_strinfo_h = string_height(text_pure)

	ltext_dexinfo = eng() ? ("[c="+string(c_lime)+"]Increases Dexterity[/c]\n+0.8% Attack Speed\n+0.8% Slow Resistance (not for weights)\n+0.5% Movement Speed\n[c="+string(c_aqua)+"](for each)[/c]") : ("[c="+string(c_lime)+"]Çeviklik Arttır[/c]\n+%0.8 Saldırı Hızı\n+%0.8 Yavaşlama Direnci (ağırlıklar hariç)\n+%0.5 Hareket Hızı\n[c="+string(c_aqua)+"](adet başına)[/c]")
	text_pure = draw_text_colortags(0, 0, ltext_dexinfo)
	ltext_dexinfo_w = string_width(text_pure)
	ltext_dexinfo_h = string_height(text_pure)

	ltext_vitinfo = eng() ? ("[c="+string(c_lime)+"]Increases Vitality[/c]\n+2% Maximum Health\n+1% Stronger Healing\n[c="+string(c_aqua)+"](for each)[/c]") : ("[c="+string(c_lime)+"]Dayanılılık Arttır[/c]\n+%2 Maksimum Can\n+%1 İyileşme Güçlendirme\n[c="+string(c_aqua)+"](adet başına)[/c]")
	text_pure = draw_text_colortags(0, 0, ltext_vitinfo)
	ltext_vitinfo_w = string_width(text_pure)
	ltext_vitinfo_h = string_height(text_pure)

	ltext_mpinfo = eng() ? ("[c="+string(c_lime)+"]Increases Magical Power[/c]\n+2% Magical Power\n+0.5% Skill Damage\n[c="+string(c_aqua)+"](for each)[/c]") : ("[c="+string(c_lime)+"]Büyü Gücü Arttır[/c]\n+%2 Büyü Gücü\n+%0.5 Beceri Hasarı\n[c="+string(c_aqua)+"](adet başına)[/c]")
	text_pure = draw_text_colortags(0, 0, ltext_mpinfo)
	ltext_mpinfo_w = string_width(text_pure)
	ltext_mpinfo_h = string_height(text_pure)

	ltext_stainfo = eng() ? ("[c="+string(c_lime)+"]Increases Stamina[/c]\n+2% Maximum Mana\n+1% Faster Energy Load\n[c="+string(c_aqua)+"](for each)[/c]") : ("[c="+string(c_lime)+"]Enerji Arttır[/c]\n+%2 Maksimum Mana\n+%1 Hızlı Enerji Yenilemesi\n[c="+string(c_aqua)+"](adet başına)[/c]")
	text_pure = draw_text_colortags(0, 0, ltext_stainfo)
	ltext_stainfo_w = string_width(text_pure)
	ltext_stainfo_h = string_height(text_pure)
draw_set_default() draw_set_alpha(1)

var text = eng() ? "Reset Stats\nYou can reset stat points by\ntalking with "+npc_senior+"." : "Gelişim Puanlarını Sıfırla\nGelişim puanlarını "+npc_senior+" ile\nkonuşarak sıfırlayabilirsin."
var title = eng() ? "" : ""
var tutorialBox = tutorial_box_owned(title, text, id, 26, 26, 25)
if (tutorialBox != pointer_null) {
	/*tutorialBox.offset_y -= 150
	tutorialBox.offset_x += 100*/
	tutorialBox.offset_y -= 40
	tutorialBox.offset_x += 425
	tutorialBox.image_xscale = 0.7
	tutorialBox.image_yscale = 0.7
}

update_steam_score()