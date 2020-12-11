if (name != loc_hawmgrad and name != loc_belingfur) {
	description += "\n[c="+string(c_customred4)+"]"+(eng() ? "Level" : "Seviye")+": "+string(level)+"-"+string(level+4)+"[/c]"
}

draw_set_font(fontLocation_small) draw_set_alpha(0)
tbT_desc = "[c="+string(c_black)+"]"+description+"[/c]"
tbW_desc = string_width(draw_text_colortags(0, 0, tbT_desc))
tbH_desc = string_height(draw_text_colortags(0, 0, tbT_desc))
draw_set_default() draw_set_alpha(1)

isReady = roomIndex != pointer_null and name != global.locationName and global.level >= level and room != roomRoad and room != roomBeforeRoad
isDestroyed = ds_list_find_index(global.destroyedMaps, roomIndex) != -1