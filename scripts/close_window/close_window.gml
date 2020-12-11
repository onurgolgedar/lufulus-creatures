function close_window() {
	if (object_index == objMessageBox) {
		if (!destroy) {
			destroy = true
			alarm[1] = -1
			alarm[2] = 1
		}
	}
	else
		close_table()


}
