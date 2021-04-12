if (findPath_alpha != 0) {
	draw_set_alpha(findPath_alpha)
		draw_path_width(findPath, findPath_x, findPath_y)
	draw_set_alpha(1)
}

if (arrowPath_alpha != 0) {
	draw_set_alpha(arrowPath_alpha)
		draw_path_width(arrowPath, arrowPath_x, arrowPath_y, arrowPath_color, c_black)
	draw_set_alpha(1)
}

with (parTarget) {
	/*if (name != "") {
		var ds_size = ai_protectors_size()
		for (var i = 0; i < ds_size; i++) {
			var ally = ai_protectors_get(i)
		
			if (ally.name != "") {
				draw_set_alpha(0.4)
					draw_line_width(ally.x, ally.y, x, y, 2)
				draw_set_alpha(1)
			}
		}
	}*/
	
	if (!death) {
		if (abilityFury) {
			if (furious)
				draw_sprite_ext(sprFuryEffect, 0, x, y-40+contMain.period, 1+contMain.period/20, 1+contMain.period/20, 0, c_white, 1)
			else if (fury > 100-sv_fury_increase)
				draw_sprite_ext(sprFuryEffect, 1, x, y-40+contMain.period, 1+contMain.period/20, 1+contMain.period/20, 0, c_white, 1)
		}
		
		if (abilityStrike) {
			if (strikeMode and strikeCharge_alpha > 0) {
				var ssize = 0.5+strikeCharge_alpha
				draw_sprite_ext(sprStrikeEffect, 0, x, y+15-strikeCharge_alpha*40, ssize, ssize, 0, c_white, strikeCharge_alpha)
				
				strikeCharge_alpha -= 0.03
			}
		}
		
		if (abilityShock and shockLoad != -1) {
			var extraSize = min(shockLoad/80, 0.75)+boss*0.15
			gpu_set_blendmode(bm_add)
				draw_sprite_ext(sprShock_SO, -1, x, y, 0.33+extraSize, 0.33+extraSize, current_time/1.8 mod 360, efColor1, 0.5+0.5*extraSize)
			gpu_set_blendmode(bm_normal)
		}
	}
}

if (contPlayer.drawMainBS) {
	with (objPlayer) {
		var extraSize = (global.skillBar/100-min(power(global.skillBar, 1.2)/300, 0)*(0.8+0.1*contPlayer.maxUpgSk567))
		draw_sprite_ext(sprMainBS_SO, contPlayer.mainBSindex, x, y, 0.2+extraSize*1.3, 0.2+extraSize*1.3, global.skillBar*3, c_white, 0.2+0.7*extraSize)
		draw_sprite_ext(sprMainBS_SO, contPlayer.mainBSindex, x, y, 0.3+extraSize, 0.3+extraSize, global.skillBar*2, c_white, 0.5+0.3*extraSize)
	
		var sscale = calculate_baseskill_range()
		draw_sprite_ext(sprSkillArea, 0, x, y, sscale, sscale, global.skillBar*2.5, c_white, 0.03+0.001*(min(global.skillBar, 60)))
	}
}
else if (contPlayer.drawSkill12) {
	with (objPlayer) {
		var sk12alpha = 0.2+0.01*(min(global.skillBar, 50))
		
		var sscale = calculate_baseskill_range()*1.5
		draw_sprite_ext(sprSkillArea, 0, x, y, sscale, sscale, global.skillBar*(2.5+sk12alpha*2), c_white, sk12alpha)
		
		sscale = calculate_skill12_range()
		var xx, yy
		
		if (IS_MOBILE) {
			xx = device_mouse_x(contPlayer.deviceSkill12)
			yy = device_mouse_y(contPlayer.deviceSkill12)
		}
		else {
			xx = mouse_x
			yy = mouse_y
		}
		
		draw_sprite_ext(sprSkillArea, 1, xx, yy, sscale, sscale, global.skillBar*2.5, contPlayer.canReleaseSkill12 ? c_white : c_black, sk12alpha)
	}
}
	
with (parBonus) {
	//draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.1, image_yscale+0.1, image_angle, c_black, image_alpha)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, usable ? c_white : c_ltgray, image_alpha)
	
	draw_set_color(textColor) draw_set_font(fontLocation) draw_set_alpha(image_alpha) draw_set_halign(fa_center)
		draw_text(x, y-44, text)
	draw_set_font(fontMain) draw_set_halign(fa_left) draw_set_alpha(1) draw_set_color(c_black)
}

/*if (global.debugMode) {
	with (parAI) {
		if (target != pointer_null and targetLock > 0) {
			draw_set_alpha((targetLock/30)*(targetLock/30)) draw_set_color(c_red)
				draw_line_width(x, y, target.x, target.y, 3)
			draw_set_alpha(1) draw_set_color(c_black)
		}
	}
}*/