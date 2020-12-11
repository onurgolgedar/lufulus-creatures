function physics_get_optimial_speed() {
	return max(clamp(room_speed*2.3, 70, 720), room_speed*1.25)


}
