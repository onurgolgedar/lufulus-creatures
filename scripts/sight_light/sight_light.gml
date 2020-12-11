/// @param owner
function sight_light() {

	var light = instance_create_layer(x, y, "lyBelowGUI", objSightLight)
	light.owner = argument[0]

	return light


}
