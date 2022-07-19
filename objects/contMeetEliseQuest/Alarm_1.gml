if (!objPlayer.death and !objElise_npc.death and
(followLight != pointer_null or
(objElise_npc.hp < objElise_npc.maxHp/3.7 or objPlayer.hp < objPlayer.maxHp/3.7) and danger >= dangerLimit and point_distance(objPlayer.x, objPlayer.y, objElise_npc.x, objElise_npc.y) < 620)) {
	if (followLight != pointer_null) {
		if (global.sl_ambient_light > 0.12) {
			global.sl_ambient_light -= 0.025
		}
	
		if (contGUi.image_alpha > 0)
			contGUi.image_alpha -= 0.05
	}
	
	if (followLight == pointer_null and anim_end(objPlayer)) {
		alarm[5] = -1
		
		drawCircle = false
		
		beforeShowGUI = global.showGUI
		global.showGUI = false

		with (objBowControl)
			image_alpha = 0
					
		with (objCrossbowControl)
			image_alpha = 0
		
		with (objPlayer) {
			add_effectbox(efboxStun, -1, 100*sec)
			
			rigidbody_set_definedstance(stOpenArms, 5*sec)
				
			other.followLight = follow_light(id, 0.02, 1, true)
			
			with(other) {
				delta_alarm(2, sec/5)
				delta_alarm(3, 6*sec)
				delta_alarm(4, 17*sec)
			}
			
			instance_destroy(contCreatureSpawn)
			
			var soulctrl = instance_create(x, y, efSoulCTRL)
			soulctrl.target = id
			
			phy_linear_damping = 140
		}
		
		sound[0] = audio_play_sound(sndMusicClassic_calm, 10, false)
		sound[1] = audio_play_sound(sndBrain, 10, true)
		sound[2] = audio_play_sound(sndPulse, 10, false)
		
		global.add_expRatio = -100
		global.anticheat_adds = recalculate_sha_adds()
		
		with (parCreature) {
			if (mode == md_attack) {
				ai_target_destroy()
				ai_set_target(objPlayer.id)
				ai_reaction(objPlayer.id)
			}
		}
		
		beforeImmortality = global.immortality
		global.immortality = true
	
		with (objElise_npc) {
			stop_moving(100*sec)
			
			with (objPlayer)
				ai_protectors_remove(objElise_npc.id)
			ai_protectors_clear()
				
			ai_target_destroy()
			mode = md_calm
			
			rigidbody_set_definedstance(stShieldMode, 0.5*sec)
		}
	}

	with (objElise_npc) {
		targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)
		turn(targetAngle, 30)
		
		change_hp(maxHp/50)
		
		if (mode != md_calm) {
			ai_target_destroy()
			mode = md_calm
		}
		
		rigidbody_set_definedstance(stShieldMode, 0.5*sec)
	}
	
	with (parAi) {
		var angle = point_direction(objPlayer.x, objPlayer.y, phy_com_x, phy_com_y)
		var dis = point_distance(objPlayer.x, objPlayer.y, phy_com_x, phy_com_y)
		if (dis < 1500) {
			if (object_index != objElise_npc)
				physics_apply_force(phy_com_x, phy_com_y, 
				lengthdir_x(phy_mass*120/(dis/500), angle),
				lengthdir_y(phy_mass*120/(dis/500), angle))
			else
				physics_apply_force(phy_com_x, phy_com_y, 
				lengthdir_x(phy_mass*10/(dis/500), angle),
				lengthdir_y(phy_mass*10/(dis/500), angle))
		}
	}

	if (followLight != pointer_null) {
		if (followLight.sl_light_power < 1)
			followLight.sl_light_power *= 1.025
		
		if (followLight.sl_light_xscale < 4) {
			followLight.sl_light_xscale *= 1.025
			followLight.sl_light_yscale *= 1.025
		}
	}
}
	
delta_alarm(1, 0.05*sec)