/// @param string
/// @param withoutİ
function string_upper_ext() {

	var newStr = ""
	var str_len = string_length(argument[0])
	var withoutI = argument_count > 1 ? argument[1] : false

	for (var i = 1; i <= str_len; i++) {
		var c = string_char_at(argument[0], i)
		switch (c) {
			case "i":
				if (!withoutI)
					newStr += "İ"
				else
					newStr += "I"
			break
		
			case "İ":
				if (withoutI)
					newStr += "I"
				else
					newStr += "İ"
			break
		
			case "ş":
				newStr += "Ş"
			break
		
			case "ı":
				newStr += "I"
			break
		
			case "ü":
				newStr += "Ü"
			break
		
			case "ç":
				newStr += "Ç"
			break
		
			case "ö":
				newStr += "Ö"
			break
		
			default:
				newStr += string_upper(c)
		}
	}
	
	return newStr


}
