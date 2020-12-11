event_inherited()

SL_light_ini_begin()

sl_light_texture = sprLight_tiny
sl_light_xscale = 3
sl_light_yscale = 3

sl_light_shadowsharpness = 1
sl_light_refresh = true
sl_light_refreshrate = 0.5

sl_light_power = 0
sl_light_color = make_color_rgb(255, 255, 255)

// No shadow!
sl_light_castshadow = false
sl_light_shadowlength = 0
sl_light_shadowfactor = 0

SL_light_ini_end()

noOwner = false

// Default
maxDuration = sec/2
maxScale = 3
maxPower = 0.7

alarm[1] = 1