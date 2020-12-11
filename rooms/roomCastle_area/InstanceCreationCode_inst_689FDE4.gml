var uniqueKey = 424777
var type = 1

if (set_lootbox(type, uniqueKey)) {
	if (global.level < 5) {
		instance_destroy()
		exit
	}

	update_droplist(objSh_003, 1, -1, -1, 1000)
	update_droplist(objClot_002, 2, -1, -1, 1000)
}