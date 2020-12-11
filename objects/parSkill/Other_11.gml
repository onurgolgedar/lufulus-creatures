description += "\n\n"+skillCostText
if (from == window_skills)
	description += string_return("\n[c="+string(c_white)+"]"+addDesc+"[/c]", addDesc != "")

tbT = "[c="+string(c_white)+"]"
+string_return("[c="+string(c_yellow)+"]"+(eng() ? "Next Upgrade" : "Sonraki Seviye")+": [/c][c="+string(c_gray)+"]", virtual)
+"[c="+string(c_ltorange)+"]"+name+"[/c]"+string_return(" ("+string(upgrade+virtual)+"/"+string(maxUpgrade)+")", maxUpgrade != -1)+"[/c]\n"+description

draw_set_alpha(0)
tbW = string_width(draw_text_colortags(-900, 0, tbT))
tbH = string_height(draw_text_colortags(-900, 0, tbT))
draw_set_font(global.mainFont) draw_set_alpha(1)