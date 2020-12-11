if (other.mode == md_attack) {
	stop_moving(sec)
}
else if (!pathFollower.pathEnd and !stopMoving) {
	spd = 4
	alarm[3] = sec/2
	
	with (other)
		stop_moving(sec)
}