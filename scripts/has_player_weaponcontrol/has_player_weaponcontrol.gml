/// @param weaponControl
function has_player_weaponcontrol() {

	with (argument[0])
		if (owner == objPlayer.id)
			return true
		
	return false


}
