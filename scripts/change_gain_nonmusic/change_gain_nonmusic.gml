/// @param value
function change_gain_nonmusic() {

	global.audio_gain_nonmusic = argument[0]
	audio_group_set_gain(audiogroup_3, power(argument[0], 2.2), 0)
	audio_group_set_gain(audiogroup_default, power(argument[0], 2.2), 0)


}
