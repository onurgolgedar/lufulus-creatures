if (!pathEnd)
	path_speed = (point_distance(x, y, owner.x, owner.y) < 100)
	*(owner.phy_speed+1)
	*(conditionalTarget == -1 or point_distance(owner.x, owner.y, conditionalTarget.x, conditionalTarget.y) < 400)

if (no != -1 and pathEnd) {
	with (owner) {
		event_perform(ev_other, ev_user2)
		lastPathNo = -1
	}
		
	no = -1
	conditionalTarget = -1
}