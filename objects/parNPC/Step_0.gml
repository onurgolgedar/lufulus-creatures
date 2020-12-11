event_inherited()

if (inView and point_distance(x, y, pathFollower.x, pathFollower.y) <= 10) {
	if (lastPathNo == -1)
		turn(targetAngle, 25)
	else if (pathFollower.conditionalTarget != -1)
		turn(point_direction(x, y, pathFollower.conditionalTarget.x, pathFollower.conditionalTarget.y), 25)
}