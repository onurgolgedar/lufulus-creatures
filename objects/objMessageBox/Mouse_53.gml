if (IS_MOBILE and !global_tab)
	exit
global_tab = false

if (test_upperclick_window())
	exit

event_perform(ev_other, ev_user1)

if (mouseOnBody and image_alpha > 0.3) {
	leftPressedOnBody = true
	timeStopped = true
	delta_alarm(6, sec*4)
}
else {
	leftPressedOnBody = false

	if (specialDesign)
		close_window()
}