function recalculate_sha_ownings() {
	var text = string(global.money)+" "+string(global.rentGold)+" "

	for (var i = 0; i < global.bagBoxCount_horizontal; i++)
	    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
			text += string(global.itemUpgrade[i, j])+" "
			text += string(global.itemUpgrade_bank[i, j])+" "
		}
		

	string_delete(text, string_length(text), 1)

	return sha1_string_utf8(text)


}
