if (!objPlayer.death) {	
	with (contPlayer)
		event_perform(ev_alarm, 10)

	if (contPlayer.canReleaseSkill12) {
		var xx, yy
		if (IS_MOBILE) {
			xx = device_mouse_x(contPlayer.deviceSkill12)
			yy = device_mouse_y(contPlayer.deviceSkill12)
		}
		else {
			xx = mouse_x
			yy = mouse_y
		}
		
		var explosion = instance_create_layer(xx, yy, "lyAir", objSkill12_SO)
		explosion.image_xscale = calculate_skill12_range()*1.3
		explosion.image_yscale = explosion.image_xscale
		explosion.bar = global.skillBar
		explosion.upgrade = level

		var light = burst_light(explosion, sec*4, 0.55+global.skillBar/100*0.35, 2.6+global.skillBar/100*1)
		light.noOwner = true

		if (global.gamepad_active)
			gamepad_set_vibration_ext(global.skillBar/100, global.skillBar/100, sec/4)
	}
	else {
		with (objPlayer)
			change_mana(global.selectedSkillMana[other.skillNo])
			
		global.selectedSkillRem[skillNo] = 0
	}
	
	contPlayer.deviceSkill12 = -1
}
	
instance_destroy()