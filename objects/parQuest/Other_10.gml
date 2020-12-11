draw_set_font(fontQuestInfo) draw_set_alpha(0)
    
//var questNo = get_quest_number(object_index)

var simpleText = ""//string_return("[c="+string(c_dkgray)+"]⚫ [/c]", isSimpleQuest)
var simpleText_pure = ""//draw_text_colortags(0, 0, simpleText)

var prepText = ""//string_return("[c="+string(c_ltblue)+"]"+(eng() ? "Info" : "Bilgi")+" [/c]", isPrepQuest)
var prepText_pure = ""//draw_text_colortags(0, 0, prepText)

var travelText = ""//string_return("[c="+string(c_black)+"]⚫ [/c]", teleport != -1)
var travelText_pure = ""//draw_text_colortags(0, 0, travelText)

var mainQuestText = ""//string_return("[c="+string(c_orange)+"]●[/c] ", !isSimpleQuest and !isPrepQuest)
var mainQuestText_pure = ""//draw_text_colortags(0, 0, mainQuestText)

//var isVisible_questName = !isSimpleQuest and !isPrepQuest
	
if (isSimpleQuest)
	name_upper = eng() ? "AUTO QUEST" : "HIZLI GÖREV"
else if (isPrepQuest)
	name_upper = eng() ? (string_upper(name)+" (INFO)") : (string_upper_ext(name, true)+" (BILGI)")
else if (isChallenge)
	name_upper = eng() ? ("CHALLENGE FOR "+string(minLevel_challenge)+"-"+string(maxLevel_challenge)+" LVs") : (string(minLevel_challenge)+"-"+string(maxLevel_challenge)+". SEVIYE IÇIN SÖZLEŞME")
else
	name_upper = eng() ? string_upper(name) : string_upper_ext(name, true)
	
tbT = mainQuestText+simpleText+prepText+travelText+name+string_return("\n[c="+string(c_challenge)+"]"+(eng() ? "(CHALLENGE)" : "(SÖZLEŞME)")+"[/c]", isChallenge)+"\n\n"+description+"\n"+string_return(rewardText, !isPrepQuest)
/*if (teleport != -1 and questNo != -1 and global.questScore[questNo] != global.questMaxScore[questNo])
	tbT += "\n\n[c="+string(c_aqua)+"]"+(eng() ? "+(IS_MOBILE ? "Tap" : "Click")+" to go the location" : "Gitmek için tıkla")+"[/c]"*/

tbW = string_width(draw_text_colortags(0, 0, tbT))
tbH = string_height(draw_text_colortags(0, 0, tbT))
var description_pure = draw_text_colortags(0, 0, description)

//var pos = string_pos("]", tbT)
if (teleport != -1)
	tbT_r = tbT//string_copy(tbT, pos+2, string_length(tbT)-pos-1)

draw_set_font(fontQuestInfo)

for (var i = 1; i <= string_length(description_pure); i++) {
	var lineSkip = string_count("\n", string_copy(description_pure, 0, i))
    if (string_width(string_copy(description_pure, 0, i))/*+string_width(name+" ")*isVisible_questName*/+string_width(simpleText_pure)+string_width(prepText_pure)+string_width(travelText_pure)+string_width(mainQuestText_pure) > 300-IS_MOBILE*20 or lineSkip) { //# 
        shortDesc = /*string_return("[c="+string(c_purple)+"]"+name+" [/c] ", isVisible_questName)+*/mainQuestText+simpleText+prepText+travelText+string_copy(description_pure, 0, i-3+lineSkip*2/*normally: i-4+lineSkip*3*/)+string_return("...", !lineSkip and !IS_MOBILE)
        break
    }
    else shortDesc = /*string_return("[c="+string(c_purple)+"]"+name+" [/c]" , isVisible_questName)+*/mainQuestText+simpleText+prepText+travelText+string_copy(description_pure, 0, i)
}

draw_set_font(global.mainFont) draw_set_alpha(1)