if (shieldMode and !owner.death) {
	with (owner)
		draw_sprite_ext(other.sprite_index, -1, x, y, 1, 1, image_angle, c_white, image_alpha)
}