if (drawCircle) {
	draw_set_color(c_yellow) draw_set_alpha(0.11)
		draw_circle(objElise_npc.x, objElise_npc.y, 603, 0)
	draw_set_color(c_green) draw_set_alpha(0.21)
		draw_circle(objElise_npc.x, objElise_npc.y, danger/dangerLimit*603, 0)
	draw_set_alpha(0.4)
		draw_circle_width(objElise_npc.x, objElise_npc.y, 600, 606, circleQuality)
	draw_set_color(c_black) draw_set_alpha(1)
}