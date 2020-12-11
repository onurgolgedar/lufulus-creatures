/// @param id
/// @param time
function destroy_effect() {

	with (argument[0]) {
		stop = true
		part_emitter_destroy_all(ps)
		delta_alarm(11, argument[1])
	}


}
