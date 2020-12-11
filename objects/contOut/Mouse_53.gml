if (IS_MOBILE and !global_tab)
	exit
global_tab = false

if (mouseOnNext)
	event_perform(ev_other, ev_user1)
	
if (mouseOnBack)
	event_perform(ev_other, ev_user2)