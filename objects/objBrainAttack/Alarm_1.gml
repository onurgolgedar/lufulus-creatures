var inView = is_in_view(x, y)

with (parTarget) {
	if ((!inView or id.inView) and physics_test_overlap(x, y, phy_rotation, other)
	and (id == other.target or ai_protectors_exists(other.target))) {
		var damage = calculate_damagetaken(other.trueDamage, 1)
		attacked(damage, pointer_null, false, false)
			
		with (other) {
			attackCount--
				
			if (attackCount == 0)
				instance_destroy()
		}
	}
}

delta_alarm(1, 10)