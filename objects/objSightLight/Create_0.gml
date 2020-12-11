event_inherited()

SL_light_ini_begin()

sl_light_texture = sprEnemySee
sl_light_xscale = 10/4
sl_light_yscale = 10/4

sl_light_shadowsharpness = 1
sl_light_refresh = true
sl_light_refreshrate = 0.8+0.2*(global.performanceMode == 3)

sl_light_power = 1
sl_light_color = make_color_rgb(255, 0, 0)

SL_light_cast_obj(objCaster, -1)

SL_light_ini_end()