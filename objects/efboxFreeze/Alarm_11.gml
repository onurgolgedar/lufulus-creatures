with (owner) {
	freezed = false
	add_effectbox(efboxStun, -1, other.maxTime)
	
	other.iceSize *= sprite_width/40
	freezed = true
}