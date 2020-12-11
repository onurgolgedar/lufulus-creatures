if (!global_double_tap and IS_MOBILE)
	exit
global_double_tap = false

if (clickedBefore and mouseOn and isReady)
	event_perform(ev_other, ev_user1)
	
clickedBefore = false