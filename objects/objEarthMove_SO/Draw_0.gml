// ?

if (instance_exists(owner)) {
	gpu_set_blendmode(bm_add)
		draw_sprite_ext(sprite_index, -1, owner.x, owner.y, 1, 1, owner.image_angle, c_white, 1-alarm[0]/maxTime*0.7)
	gpu_set_blendmode(bm_normal)
}