function is_cinematic() {
	if (!instance_exists(contGUI))
		return false
	
	return !contGUI.visible


}
