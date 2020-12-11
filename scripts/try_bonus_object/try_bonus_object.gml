/// @param isReduced
function try_bonus_object() {

	var isReduced = false
	if (argument_count > 0)
		isReduced = argument[0]

	var bonusType = 29+clamp(global.level-level, -10, 7)-isLeader_hard*3-boss*5
	bonusType = irandom(clamp(bonusType, 5, 40))

	var bonusObject = pointer_null

	if (bonusType < 3)
		bonusObject = instance_create(x, y, objHealUp)
	else if (bonusType < 6)
		bonusObject = instance_create(x, y, objManaUp)
	else if (bonusType < 8+contRoomRuler.broccoliQuest*4 and !isReduced)
		bonusObject = instance_create(x, y, objBroccoli)

	if (bonusObject != pointer_null) {
		with (bonusObject) {
		    physics_apply_impulse(phy_com_x, phy_com_y, choose(-1, 1)*irandom_range(2, 5), choose(-1, 1)*irandom_range(2, 5))
		    physics_apply_torque(irandom_range(-3, 3))
		
			if (isReduced) {
				image_xscale *= 0.8
				image_yscale *= 0.8
				value *= 1/2
			}
		}
	}


}
