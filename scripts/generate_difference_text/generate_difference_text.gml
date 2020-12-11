function generate_difference_text() {
	var diff = argument[0]-argument[1]
	var diff_txt = ""

	var inverse = argument[2]
	
	if (diff != 0) {
		if (!argument[3])
			diff_txt = "[c="+string((diff < 0 xor inverse) ? c_customred_compare : c_customgreen_compare)+"]  ("+((diff > 0) ? "▲" : "▼")
			+string(abs(diff))+")[/c]"
		else
			diff_txt = "[c="+string(c_customgreen_compare)+"] ⬆"
			+string(abs(diff))+"[/c]"
	}

	return diff_txt


}
