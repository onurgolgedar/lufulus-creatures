/// @description Death

if (room == roomRoad) {
	delete_quest(get_quest_number(objQuestRoad_scout2))
	delete_quest(get_quest_number(objQuestRoad_scout))
	delete_quest_finished(objQuestRoad_scout)
}

death = true
add_effectbox(efboxDeath)

if (global.level < 12)
	fm_add(14)

var ds_size = ds_list_size(rigidbodyParts)
for (var rb = 0; rb < ds_size; rb++) {
	with (ds_list_find_value(rigidbodyParts, rb)) {
		if (joint != pointer_null) {
			physics_joint_set_value(joint, phy_joint_angle_limits, false)
			joint = pointer_null
		}
		
		active = false
		
		phy_linear_damping += 2
		phy_angular_damping += 3
	}
}

with (efboxSkill12)
	instance_destroy()

with (efboxMainBS)
	instance_destroy()
	
with (parAnimation)
	if (owner == other.id)
		instance_destroy()
		
if (global.gamepad_active)
	gamepad_set_vibration_ext(0.25, 0.25, sec)
	
#region RED SCREEN EFFECT
var redScreenValue = 10
if (contGUI.redScreenTarget < redScreenValue) {
	contGUI.redScreenIncrease = true
	contGUI.redScreenTarget = redScreenValue
	contGUI.alarm[1] = 1
}			
#endregion

delta_alarm(3, 1.6*sec)