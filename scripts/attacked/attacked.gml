/// @param damage
/// @param from
/// @param isCritical
/// @param isSoundOn*
function attacked() {

	if (!death) {
		var at_from_before = at_from
	
		if (argument[1] != pointer_null and instance_exists(argument[1]) and !argument[1].death)
			at_from = argument[1]
		else
			at_from = pointer_null
	
		var fromPlayer = at_from != pointer_null and at_from.type == type_player
	
		var soundOn = true
		if (argument_count == 4)
			soundOn = argument[3]
		
	#region AI Passives	
		if (abilityTurtle and !turtleMode)
			turtle_change(argument[0]/maxHp*100*2.5)
	#endregion
	
	#region Break Mutual Protections
		if (at_from != pointer_null and at_from != at_from_before) {
			ai_protectors_remove(at_from)
			with (at_from)
				ai_protectors_remove(other.id)
		
			var ds_size = ai_protectors_size()
			for (var i = 0; i < ds_size; i++) {
				with (ai_protectors_get(i)) {
					var ally = id
					ai_protectors_remove(other.at_from)
					
					with (other.at_from)
						ai_protectors_remove(ally)
				}
			}
		}
	#endregion
	
		if (rigidbodyType == 0)
			scale_factor = (0.7+scale_factor)/2
	
		if (soundOn and (type == type_npc or object_index == objPlayer)) {
			var sound = sound_play_at(sndUh, x, y, false)
			audio_sound_pitch(sound, random_range(0.9, 1.05))
		}
	
		if (type == type_player) {
			if (argument[1] != pointer_null and !argument[1].death and argument[1].object_index != objLufulusWisdom)
				ai_protectors_call(argument[1])
		
			if (soundOn) {
				var cam_ang = clamp(irandom_range(-5*argument[0]/maxHp, 5*argument[0]/maxHp), -5, 5)
				cam_ang += 1.25*sign(cam_ang)
				if (abs(camera_get_view_angle(global.camera)) < abs(cam_ang))
					camera_set_view_angle(global.camera, cam_ang)
			}
		
			if (soundOn) {
				if (global.gamepad_active and argument[0] > global.maxHp/10) {
					var vibration = clamp(argument[0]/global.maxHp, 0, 1)
					gamepad_set_vibration_ext(vibration, vibration, sec/5)
				}
			
				with (objTradeWindow)
					close_table()
			}
		}
		else {
			var targetSet = false
		
			if (at_from != pointer_null) {
				var attackerIndex_targetsPotential = ds_list_find_index(targetsPotential, at_from)
				if (attackerIndex_targetsPotential != -1) {
					var oldPoint = ds_list_find_value(targetsPotential_points, attackerIndex_targetsPotential)
					ds_list_set(targetsPotential_points, attackerIndex_targetsPotential, oldPoint+argument[0]/hp*1.5)
				
					if (argument[0]/hp > 0.15-fromPlayer*0.05 and (irandom(2) or fromPlayer))
						ai_set_target_auto()
				} else {
					ds_list_add(targetsPotential, at_from)
					ds_list_add(targetsPotential_points, argument[0]/hp)
				}
		
				if (target == pointer_null)
					targetSet = ai_reaction(at_from)
				else
					ai_protectors_call(argument[1])
		
				if (targetSet and argument[0] > maxHp/15)
					targetLock = max(targetLock, 12)
			}
		}
	
		if (fromPlayer or type == type_player) {
			var color = (type == type_player) ? c_red : c_yellow
		
			if (argument[0] != 0)
				slide_text(x, y, ceil(argument[0]), color, argument[2])
			
			broke_outfight()
		}
	
		if (hp-argument[0] <= 0) {
			if (type != type_player and
			(at_from != pointer_null and at_from.type == type_player or
			target != pointer_null and target.type == type_player or
			at_from != pointer_null and at_from.isProtector and at_from.protection_owner == objPlayer.id))
				playerKilledMe = true
	
			if (at_from != pointer_null) {
				var dir = point_direction(at_from.x, at_from.y, x, y)
			
				if (!global.immortality or object_index != objPlayer) {
					var pow = ((irandom(2) == 0)*irandom_range(4, 8)+4)*totalMass
					physics_apply_impulse(x+irandom_range(-8, 8), y+irandom_range(-8, 8), lengthdir_x(pow, dir), lengthdir_y(pow, dir))
					physics_apply_torque(pow*2)
				}
			}
		}
	
		change_hp(-argument[0])
	}


}
