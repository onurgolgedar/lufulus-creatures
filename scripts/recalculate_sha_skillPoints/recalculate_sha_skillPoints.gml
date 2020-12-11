function recalculate_sha_skillPoints() {
	var text = string(global.givenSkillPoints) + " " + string(global.skillPoints)

	for (var i = 0; i < 30; i++) {
	    for (var j = 0; j < 6; j++) {
	        if (global.skillObject[i, j] != -1)
				text += string(global.skillUpgrade[i, j])+" "
	    }
	}

	string_delete(text, string_length(text), 1)

	return sha1_string_utf8(text)


}
