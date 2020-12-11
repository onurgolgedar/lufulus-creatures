event_inherited()

SL_light_ini_begin()

sl_light_texture = sprLight
sl_light_xscale = 3
sl_light_yscale = 3

sl_light_shadowsharpness = 1
sl_light_refresh = false
sl_light_refreshrate = 0.8

sl_light_power = 0.6
sl_light_color = make_color_rgb(255, 255, 255)

// Casters
SL_light_cast_obj(parCaster,-1)

SL_light_ini_end()