if (isBreak and room != roomLufulus and wave_no != wave_maxNo and objPlayer.noArms and alarm[10] == -1 and contGUi.colorScreenAlpha == 0) {
	draw_set_color(c_black) draw_set_font(fontBeautiful)
		if (!eng())
			var text = string(wave_no+1)+". dalga için [c="+string(c_black)+"]"+(global.gamepad_active ? "<Y Tuşu>'na" : (IS_MOBILE ? "buraya" : "<Q>'ya"))+"[/c]\nbas, silahını çek."
		else
			var text = "Press "+(global.gamepad_active ? "<Button Y>," : (IS_MOBILE ? "this or" : "<Q>,"))+" draw your\nweapon to start "+string(wave_no+1)+". wave."
		
		draw_set_alpha(0)
			var pureText = draw_text_colortags(0, 0, text)
			tW = string_width(pureText)
			tH = string_height(pureText)
		draw_set_alpha(1)
			
		draw_set_alpha(0.5) draw_set_color(c_black)
			draw_roundrect_ext(-17, 240+IS_MOBILE*4, 22+tW, 240+tH+20+IS_MOBILE*4, 25, 25, 0)
		draw_set_alpha(0.4+mouseOn*0.2) draw_set_color(c_teal)
			draw_roundrect_ext(-15, 244+IS_MOBILE*4, 20+tW, 244+tH+13+IS_MOBILE*4, 25, 25, 0)
		draw_set_color(c_aqua)
			draw_roundrect_ext(-7, 248+IS_MOBILE*4, 16+tW, 248+tH+5+IS_MOBILE*4, 25, 25, 0)
		draw_set_alpha(1) draw_set_color(c_black)
			
		draw_text_colortags(8, 250+IS_MOBILE*2, text)
	draw_set_default()
}