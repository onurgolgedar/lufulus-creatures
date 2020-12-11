/// @param color
/// @param size
function blood_effect() {

	var blood = instance_create_layer(x, y, "lyFloor", objBlood)

	blood.image_xscale *= argument[1]
	blood.image_yscale *= argument[1]

	blood.image_blend = argument[0]

	return blood


}
