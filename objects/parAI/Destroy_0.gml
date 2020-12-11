event_inherited()

instance_destroy(pathFollower)
ds_list_destroy(moves)
ds_list_destroy(bars)

if (forTest)
	rigidbody_destroy()
	
with (parArrow) {
	if (stuckTarget == other.id) {
		stuckTarget = pointer_null
		alarm[0] = irandom_range(sec, 2*sec)
		
		phy_angular_velocity = 0
		phy_speed_x = 0
		phy_speed_y = 0
		phy_active = true
	}
}
		
// Extra
if (type == type_wisdom) {
	with (parAI) {
		if (target == other.id)
			ai_target_destroy()
	}
}