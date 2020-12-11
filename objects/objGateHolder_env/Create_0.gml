image_speed = 0

depth -= 4

if (room == roomCastle2_area)
	image_index = 1

var gate = instance_create_layer(x, y, "lyAbovePlayer", objGate_env)

gate.image_index = image_index
gate.image_speed = 0

if (image_xscale < 0) {
	gate.image_angle = 180
	gate.phy_rotation = -gate.image_angle
	gate.targetAngle = 180
}

physics_joint_revolute_create(id, gate, gate.x, gate.y, 0, 0, false, 0, 0, false, false)