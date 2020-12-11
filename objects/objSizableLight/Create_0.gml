event_inherited()

SL_light_ini_begin()

sl_light_texture = sprLight
sl_light_xscale = image_xscale*3
sl_light_yscale = sl_light_xscale

lightRange = sl_light_xscale

sl_light_power = 0.6
sl_light_shadowsharpness = 1
sl_light_refresh = false
sl_light_refreshrate = 0.8

// Casters
SL_light_cast_obj(parCaster,-1)

SL_light_ini_end()