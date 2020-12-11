if (image_alpha == 1 and physics_test_overlap(x, y, phy_rotation, parTarget)) {
	with (parTarget) {
		if (physics_test_overlap(x, y, phy_rotation, other.id) and (id == other.target or ai_protectors_exists(other.target))) {
			var efbox = add_effectbox(efboxPoison, -1, other.duration)
			efbox.creator = other.owner
			efbox.damage = other.damage

			other.alarm[1] = 1
		}
	}
}

delta_alarm(3, sec/5)