/// @param value
function change_gain_music() {

	global.audio_gain_music = argument[0]
	audio_group_set_gain(audiogroup_2, power(argument[0], 2.2), 0)


}
