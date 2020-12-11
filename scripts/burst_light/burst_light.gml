/// @param owner
/// @param duration
/// @param power
/// @param scale
function burst_light() {

	var light = instance_create_layer(x, y, "lyBelowGUI", objBurstLight)
	with (light) {
		owner = argument[0]
		delta_alarm(0, argument[1])
		maxDuration = alarm[0]
		maxPower = argument[2]
		maxScale = argument[3]
		if (owner != -1 and instance_exists(owner)) {
			x = owner.x
			y = owner.y
		}
	}

	return light


}
