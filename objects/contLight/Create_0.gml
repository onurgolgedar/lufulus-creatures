SL_engine_ini_begin()

sl_tod_active = false
sl_ambientshadows_active = false

if (global.performanceMode == 0)
	sl_buffer_texturesize = 0.09-IS_MOBILE*0.01
else if (global.performanceMode == 1)
	sl_buffer_texturesize = 0.15-IS_MOBILE*0.03
else if (global.performanceMode == 2)
	sl_buffer_texturesize = 0.22-IS_MOBILE*0.05
else if (global.performanceMode == 3)
	sl_buffer_texturesize = 0.31-IS_MOBILE*0.08
else
	sl_buffer_texturesize = 0.22-IS_MOBILE*0.05
	
sl_buffer_xmargin = 100
sl_buffer_ymargin = 100

global.sl_ambient_light = 1

SL_add_light(parNormalLight)
SL_add_light(objTorchLight)
SL_add_light(objFollowLight)
SL_add_light(objGeneralLight)

SL_ToD_empty()
SL_set_time(0)

SL_engine_ini_end()