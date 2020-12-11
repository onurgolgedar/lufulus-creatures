event_inherited()

SL_light_ini_begin()

sl_light_texture = sprLight
sl_light_xscale = 3.5
sl_light_yscale = 3.5

sl_light_shadowsharpness = 1
sl_light_refresh = true
sl_light_refreshrate = 1

sl_light_power = 0.5+(global.sl_ambient_light < 0.2)*0.5
sl_light_color = make_color_rgb(255, 255, 255)

owner = -1

// Casters
SL_light_cast_obj(parCaster,-1)

SL_light_ini_end()