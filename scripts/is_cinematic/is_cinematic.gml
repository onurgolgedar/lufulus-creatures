function is_cinematic() {
	if (!instance_exists(contGUi))
		return false
	
	return !contGUi.visible


}
