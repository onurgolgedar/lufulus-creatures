function stop_animations() {
	with (parAnimation) {
		if (owner == other.id) {
			event_perform(ev_other, ev_user5)
		
			instance_destroy()
		}
	}


}
