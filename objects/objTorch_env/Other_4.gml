image_speed = 0

if (global.sl_ambient_light < 0.8 or is_room_shadowy()) {
	instance_create_layer(x, y, "lyBelowGUI", objStaticLight)
	instance_create(x, y, efFireTiny)
	depth += 5
	image_index = 1
}