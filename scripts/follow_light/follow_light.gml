/// @param owner
/// @param power
/// @param scale
/// @param isBig*
function follow_light() {

	var light = instance_create_layer(x, y, "lyBelowGUI", objFollowLight)
	with (light) {
		owner = argument[0]
		basePower = argument[1]
		baseScale = argument[2]

		sl_light_xscale = baseScale
		sl_light_yscale = baseScale
		sl_light_power = basePower

		if (argument_count == 4 and argument[3])
			sl_light_texture = sprLight
		else
			sl_light_texture = sprLight_tiny

		SL_light_ini_end()
	}

	return light


}
