function test_upperclick_arrow() {
	if (IS_MOBILE)
		return false

	with (contGUi) {
		if (mouseOnArrow != -1)
			return true
	}
		
	return false


}
