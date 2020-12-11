/// @description Damage Trigger

with (owner) {
	if (target != pointer_null) {
		var stone = instance_create_layer(rightHand.x, rightHand.y, "lyAir", slowStoneObject)
		stone.trueDamage = physicalPower
		stone.owner = id
		stone.target = target
		with (stone) {
			phy_speed_x += other.phy_speed_x
			phy_speed_y += other.phy_speed_y
			var angle = irandom_range(-5, 5)
			var pw = random_range(2.5, 3.5)
			physics_apply_impulse(phy_com_x, phy_com_y,
			lengthdir_x(pw, owner.image_angle+angle),
			lengthdir_y(pw, owner.image_angle+angle))
			phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y)
			phy_angular_velocity = choose(8, -8)
		}
	}
}