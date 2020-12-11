if (!global_tap and IS_MOBILE)
	exit
global_tap = false

if (mouseOn) {
	clickedBefore = true
	with (objMap) {
		location_lastSelected = other.id
		travelButton_alpha = 0
	}
}