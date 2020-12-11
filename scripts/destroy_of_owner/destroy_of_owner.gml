/// @param object
/// @param owner
function destroy_of_owner() {

	with (argument[0])
		if (owner == argument[1])
			instance_destroy()


}
