if (inView) {
	if (usable and physics_test_overlap(x, y, phy_rotation, objPlayer)) {
		audio_play_sound(sndHeal, 1, 0)
	
		with (parTarget) {
			if (inView and mode == md_attack and !death and type != type_player) {
				var dis = point_distance(x, y, objPlayer.x, objPlayer.y)
				if (dis < 200) {
					var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)
					var powr = phy_mass*(19+8*(1-dis/200))
					physics_apply_impulse(phy_com_x, phy_com_y, 
					lengthdir_x(powr, angle),
					lengthdir_y(powr, angle))
				}
			}
		}
		
		quest_progress(objQuest_broccoli, 1)
	
		var burst = burst_light(objPlayer.id, sec*1/3, 0.7, 2.5)
		burst.sl_light_color = c_lime
		instance_create_layer(x, y, "lyBelowGUI", objBroccoliPush)
	
		with (objPlayer) {
			change_hp(other.value)
			add_effectbox(efboxBroccoli)
		}
	
		instance_destroy()
	}
}

delta_alarm(4, sec/6)