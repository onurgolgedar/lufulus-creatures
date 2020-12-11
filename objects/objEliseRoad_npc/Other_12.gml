if (lastPathNo == 1) {	
	show_messagebox(600, 300, eng() ? ("We have come, you should\ngo ahead to the castle.")
	: ("Geldik. Buradan devam etmeli ve\nkaleye uğramalısın."), name+":", 3*sec)
	targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)
}