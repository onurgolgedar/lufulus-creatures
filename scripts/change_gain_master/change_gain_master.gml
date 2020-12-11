/// @param value
function change_gain_master() {

	audio_set_master_gain(0, power(argument[0], 2.2))


}
