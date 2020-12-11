function can_save() {
	return !global.noSave_mode and !is_room_out() and
	(room != roomRoad and 
	room != roomBeforeRoad or contMain.targetRoom == roomCastle_area)


}
