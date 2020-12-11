event_inherited()

SL_light_ini_begin()

sl_light_texture = sprLight2
sl_light_xscale = 18
sl_light_yscale = 18

lightRange = sl_light_xscale

sl_light_power = global.sl_ambient_light/1.5
sl_light_shadowsharpness = 1
sl_light_refresh = false
sl_light_refreshrate = 0.8

if (room == roomCreature8)
	sl_light_color = make_color_rgb(255, 200, 220)
else if (room == roomCreature9)
	sl_light_color = make_color_rgb(220, 255, 200)

// Casters
SL_light_cast_obj(parCaster,-1)

SL_light_ini_end()

sprite_index = noone