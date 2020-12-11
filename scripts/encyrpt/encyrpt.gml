function encyrpt() {
	if (!global.antiCheat_forSaveFiles)
		return argument[0]
	
	return round((round(argument[0]*100)/100+121)*100*4517*9629)



}
