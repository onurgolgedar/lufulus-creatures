effect = instance_create(x, y, efRofux)
effect.owner = id
effect.target = id
if (owner.object_index == objB2) {
	effect.isRed = true
	
	var light = follow_light(id, 0.3, 0.55)
	light.sl_light_color = c_red
}
else if (owner.object_index == objLufulus) {
	effect.isPurple = true
	effect.isBig = true
	
	var light = follow_light(id, 0.35, 0.6)
	light.sl_light_color = c_fuchsia
}
else {
	follow_light(id, 0.25, 0.5)
}