if (text == "Continue" or text == "Devam Et")
	usable = contOut.conti != "0"
else if (text == "Load" or text == "Yükle")
	usable = contOut.save1exists or contOut.save2exists or contOut.save3exists or contOut.save4exists