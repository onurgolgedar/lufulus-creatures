if (qPressTime == unique_number)
	exit

var swtch = -1

if (changeWeaponChoiceTo == -1) {
	if (global.lastWeaponChoice == 0) {
		if (global.weaponType != pointer_null)
			swtch = 1
		else if (global.sWeaponType != pointer_null)
			swtch = 2
		else
			swtch = 0
	}
	else if (global.lastWeaponChoice == 1) {
		if (objPlayer.noArms and global.weaponType != pointer_null)
			swtch = 1
		else if (global.sWeaponType != pointer_null)
			swtch = 2
		else {
			audio_play_sound(sndError, 10, false)
			slide_text(objPlayer.x, objPlayer.y, eng() ? "You've no sword." : "Kılıcın yok.", c_white, false, true)
		}
	}
	else if (global.lastWeaponChoice == 2) {
		if (objPlayer.noArms and global.sWeaponType != pointer_null)
			swtch = 2
		else if (global.weaponType != pointer_null and global.weaponType != wtype_shield)
			swtch = 1
		else {
			audio_play_sound(sndError, 10, false)
			slide_text(objPlayer.x, objPlayer.y, eng() ? "You've no bow." : "Yayın yok.", c_white, false, true)
		}
	}
}
else if (changeWeaponChoiceTo == 0)
	swtch = 3
else if (changeWeaponChoiceTo == 1)
	swtch = 1
else if (changeWeaponChoiceTo == 2)
	swtch = 2

var changeTime = sec/4-extension_exists(ext_med_archblue)*sec/8
if (swtch == 1) {
	with (objPlayer)
		if (anim_end() and !stunned) {
			destroy_of_owner(objCrossbowControl, id)
			destroy_of_owner(objMWeaponControl, id)
			destroy_of_owner(objBowControl, id)
			destroy_of_owner(objSWeaponControl, id)
			destroy_of_owner(objShieldControl, id)

			if (global.weaponType == wtype_crossbow) {	
				contPlayer.melee = false
				
				player_set_stance(stBasicAttackBase_crossbow, changeTime)
				var bowControl = instance_create(objPlayer.x, objPlayer.y, objCrossbowControl)
				bowControl.owner = objPlayer.id
				bowControl.weaponSprite = global.weaponSprite
				bowControl.alarm[1] = 1
				global.secondaryActive = false
				
				objAim.sprite_index = sprAim_archery
			
				var bow = instance_create(-50, -50, global.item[global.weaponI, global.weaponJ])
				bowControl.addRopeDis = bow.addRopeDis
			}
			else if (global.weaponType == wtype_bow) {
				contPlayer.melee = false
				
				player_set_stance(stBasicAttackBase_bow, changeTime)
				var bowControl = instance_create(objPlayer.x, objPlayer.y, objBowControl)
				bowControl.owner = objPlayer.id
				global.secondaryActive = false
				
				objAim.sprite_index = sprAim_archery
			}
			else if (global.weaponType == wtype_staff) {
				contPlayer.melee = false
				
				player_set_stance(stBasicAttackBase_staff, changeTime)
				instance_create(objPlayer.x, objPlayer.y, objMWeaponControl)
				global.secondaryActive = false
				
				objAim.sprite_index = sprAim
			}
			else if (global.weaponType == wtype_shield) {
				instance_create(objPlayer.x, objPlayer.y, objShieldControl)
				
				objAim.sprite_index = sprAim
				
				if (global.sWeaponType == pointer_null)
					player_set_stance(stBasicAttackBase_shieldOnly, changeTime)
				else if (global.sWeaponType == wtype_ohsword) {
					if (is_outfight())
						player_set_stance(stBasicAttackBase_ohsword_calm, changeTime)
					else
						player_set_stance(stBasicAttackBase_ohsword, changeTime)
						
					instance_create(objPlayer.x, objPlayer.y, objSWeaponControl)
					global.secondaryActive = true
				}
			}
		
			if (global.weaponType == pointer_null) {
				other.changeWeaponChoiceTo = 0
				with (other)
					event_perform(ev_keyrelease, ord("Q"))
			}
			else {
				global.lastWeaponChoice = 1
				save_lastweaponchoice(global.saveNo)
				other.changeWeaponChoiceTo = -1
			}
		
			update_character()
			with (objPlayer) {
				attackTimer = 0
				//attacktimer_set_max()
			}
		}
		else
			other.changeWeaponChoiceTo = 1
}
else if (swtch == 2)  {
	with (objPlayer)
		if (anim_end() and !stunned) {
			if (has_active_sweapon()) {
				contPlayer.melee = true
				
				destroy_of_owner(objCrossbowControl, id)
				destroy_of_owner(objMWeaponControl, id)
				destroy_of_owner(objSWeaponControl, id)
				destroy_of_owner(objBowControl, id)
				destroy_of_owner(objShieldControl, id)

				if (global.sWeaponType == wtype_ohsword) {
					if (is_outfight())
						player_set_stance(stBasicAttackBase_ohsword_calm, changeTime)
					else
						player_set_stance(stBasicAttackBase_ohsword, changeTime)
						
					objAim.sprite_index = sprAim
					
				    instance_create(objPlayer.x, objPlayer.y, objSWeaponControl)
					
					global.secondaryActive = true
					
					other.alarm[4] = sec
					
					if (global.weaponType == wtype_shield)
						instance_create(objPlayer.x, objPlayer.y, objShieldControl)
				}
				else
					rigidbody_noarms_type1()
		
				update_character()
				with (objPlayer) {
					attackTimer = 0
					//attacktimer_set_max()
				}
				
				global.lastWeaponChoice = 2
				save_lastweaponchoice(global.saveNo)
				other.changeWeaponChoiceTo = -1
			}
		}
		else
			other.changeWeaponChoiceTo = 2
		
	save_lastweaponchoice(global.saveNo)
}
else if (swtch == 3)  {
	with (objPlayer)
		if (anim_end() and !stunned) {
			contPlayer.melee = false
			
			rigidbody_noarms_type1()

			destroy_of_owner(objCrossbowControl, true)
			destroy_of_owner(objMWeaponControl, true)
			destroy_of_owner(objSWeaponControl, true)
			destroy_of_owner(objBowControl, true)
			destroy_of_owner(objShieldControl, true)
			
			objAim.sprite_index = sprAim
	
			update_character()
			
			global.secondaryActive = false
			
			global.lastWeaponChoice = 0
			save_lastweaponchoice(global.saveNo)
			other.changeWeaponChoiceTo = -1
		}
		else
			other.changeWeaponChoiceTo = 0
}

with (parBonus)
	pull = extension_exists(ext_pull_bonuses) 
	
with (contPlayer)
	event_user(4)