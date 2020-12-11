/// @param isRight
/// @param isSkill12*
/// @param isFirst
function clickattack_basic_conditions() {

	var isSkill12 = false
	if (argument_count > 1)
		isSkill12 = argument[1]
	var isFirst = true
	if (argument_count > 2)
		isFirst = argument[2]

	var result = (anim_end() or (argument[0] and stance == stBasicAttackBase_ohsword)) and global.itemSelected == -1 and !objPlayer.noArms

	and
		(argument[0] or
					(gamepad_button_check(global.gamepad, gp_shoulderr) or !contPlayer.onDialogue and !stunned and !instance_exists(objMap) and
					(!isFirst or IS_MOBILE or (!test_upperclick_npc() and !test_upperclick_tutorial() and !test_upperclick_effectbox() and !test_upperclick_drop() and
					!test_upperclick_gui() and !test_upperclick_arrow() and (!instance_exists(contWaveSpawn) or !contWaveSpawn.mouseOn)))))

	and
		(argument[0] or
					((isSkill12 or !test_effectbox(efboxSkill12, objPlayer.id)) and
					(contPlayer.upgSk7 == 0 or contPlayer.upgSk7 == 4 or !test_effectbox(efboxMainBS, objPlayer.id) or test_effectbox(efboxSkill1, objPlayer.id))))
				
	if (result and !argument[0] and !IS_MOBILE) {
		with (parWindow) {
			if (drag) {
				result = false
				break
			}
		}
	}

	return result


}
