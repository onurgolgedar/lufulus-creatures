/*if (!global.showGUI)
	draw_circle_width(mouse_x, mouse_y, 7, 9, 15)*/

if (drawPaths)
	with (objPath_env)
		draw_self()

with (parAI) {
	if (inView) {
		if (mode == md_calm and (leader != pointer_null or isLeader) and !death) {
			draw_set_alpha(0.57)
				draw_set_color(leadColor)
					draw_circle(x, y, 27+contMain.period/1.5, 0)
			draw_set_color(c_black) draw_set_alpha(1)
		}
		else if (teamNo != -1 and teamNo == team_enemy and !death) {
			draw_set_alpha(0.45) draw_set_color(c_red)
				draw_circle(x, y, 35+contMain.period/0.95, 0)
			draw_set_alpha(1) draw_set_color(c_black)
		}
	}
}

with (objLootbox)
	if (inView)
		draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.10, image_yscale+0.10, image_angle, c_black, 0.6)

with (parPlant)
	if (inView)
		draw_outline_low(sprite_index, -1, x, y, image_xscale+0.035, image_yscale+0.035, image_angle)
	
if (global.performanceMode > IS_MOBILE) {
	with (parTarget) {
		if (inView) {
			var sizeshadow = (sprite_width+sprite_height)/60
			draw_sprite_ext(sprShadow, -1, x, y, sizeshadow, sizeshadow, 0, c_white, image_alpha)
		}
	}
}

if (global.performanceMode > IS_MOBILE or global.performanceMode == 0 and !IS_MOBILE) {
	with (objRock_nonSolid_env) 
		if (inView)
			draw_sprite_ext(sprite_index, -1, x+8, y+4, image_xscale+0.11, image_yscale+0.11, image_angle, c_dkgray, 1)
	
	with (parRock)
		if (!noOutline and inView)
			draw_sprite_ext(sprite_index, -1, x+8, y+4, image_xscale+0.11, image_yscale+0.11, angle, c_dkgray, 1)
}

if (surface_exists(global.shadowSurface_wall))
	draw_surface(global.shadowSurface_wall, 0, 0)
else
	global.shadowSurface_wall = create_surface(room_width, room_height)

with (parPlant)
	if (inView)
		draw_self()
		
with (parDrawnExternally)
	if (inView)
		draw_self()

gpu_set_tex_filter(false)		
	with (parRock)
		if (inView)
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
		
	with (objRock_nonSolid_env)
		if (inView)
			draw_self()
gpu_set_tex_filter(true)

with (objLootbox)
	if (inView)
		draw_self()