image_xscale -= 0.01
image_yscale -= image_xscale

if (image_xscale <= 0)
	instance_destroy()
	
with (effect) {
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	part_type_color3(pt_Effect1, other.brainColor, other.brainColor, other.brainColor);
	part_type_size(pt_Effect1, other.brainSize, other.brainSize+0.15, 0, 0.4);
}
	
delta_alarm(0, 6)

audio_emitter_position(soundEmitter, x, y, 0)