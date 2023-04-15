event_inherited()

/*if (IS_MOBILE) {
	if (device_mouse_check_button(contGUi.joystick_hold, mb_left))
		event_perform(ev_mouse, ev_left_button)
}*/

var spd
var rsFactor = 60/room_speed
if (!death) {
	if (!stunned and !viewLock and !contPlayer.onDialogue/* and !keyboard_check(vk_add)*/) {
		var isOutFight = is_outfight()
		if (contPlayer.doingAttack or !isOutFight or leftReleased != 0) {
			if (IS_MOBILE or !global.mouseControl and global.gamepad_active) {
				if (global.gamepad_active) {
					var ver = gamepad_axis_value(global.gamepad, gp_axisrv)
					var hor = gamepad_axis_value(global.gamepad, gp_axisrh)
					
					if (abs(ver) > 0.4 or abs(hor) > 0.4 or IS_MOBILE)
						lastRotation = point_direction(0, 0, hor, ver)
				}
				else {
					if (contGUi.joystick2_hold and contGUi.joystick2_dis > 27-(global.weaponType == wtype_crossbow)*5)
						lastRotation = contGUi.joystick2_dir
					else if (contGUi.joystick_hold and (global.weaponType != wtype_crossbow and global.weaponType != wtype_bow or isOutFight))
						lastRotation = contGUi.joystick_dir
				}
			}
			else
				lastRotation = point_direction(x, y, mouse_x, mouse_y)
		}
		else if (IS_MOBILE or !global.mouseControl and global.gamepad_active) {
			if (global.gamepad_active) {
				var ver = gamepad_axis_value(global.gamepad, gp_axisrv)
				var hor = gamepad_axis_value(global.gamepad, gp_axisrh)
				if (abs(ver) > 0.4 or abs(hor) > 0.4)
					lastRotation = point_direction(0, 0, hor, ver)
				else if (phy_speed > 2*rsFactor)
					lastRotation = point_direction(0, 0, phy_speed_x, phy_speed_y)
			}
			else {
				if (contGUi.joystick2_hold)
					lastRotation = contGUi.joystick2_dir
				else
					lastRotation = contGUi.joystick_dir
			}
		}
		else if (phy_speed > 2*rsFactor and attackTimer == 0)
			lastRotation = point_direction(0, 0, phy_speed_x, phy_speed_y)
		
		turn(lastRotation, 180/(1+0.5*(IS_MOBILE and contGUi.joystick2_hold and !contPlayer.melee)))
	}
	else
		turn(lastRotation, 18)
		
	if (leftReleased > 0) {
		leftReleased -= delta()
		if (leftReleased < 0)
			leftReleased = 0
	}
	
	if (global.gamepad_active) {
		if (gamepad_button_check(global.gamepad, gp_shoulderrb))
			event_perform(ev_mouse, ev_global_right_button)
	
		if (gamepad_button_check_released(global.gamepad, gp_shoulderrb))
			event_perform(ev_mouse, ev_global_right_release)
			
		if (gamepad_button_check_pressed(global.gamepad, gp_shoulderlb))
			event_perform(ev_keypress, vk_shift)
	}

	if ((keyboard_check(vk_shift) or mobileAutoShift or (global.gamepad_active and gamepad_button_check(global.gamepad, gp_shoulderlb))) and !shiftLock_window and (IS_MOBILE or phy_speed > 0.5*rsFactor) and global.skillBar == 0 and (energy == 100 or (!shiftLock and energy > 0))) {
		if (energy == 100) {
			audio_play_sound(sndSpeed, 5, false)
			
			if (extension_exists(ext_invisibility)) {
				var efbox = add_effectbox(efboxinvisibility, -1, 100/shiftDecrease+5)
				efbox.forShift = true
			}
			
			if (extension_exists(ext_shift_jump)) {
				var __dir = point_direction(0, 0, phy_speed_x, phy_speed_y)
				physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(10, __dir), lengthdir_y(10, __dir))
				change_energy(-8)
			}
		}
	
		shiftLock = false
		spd = global.movementSpeed*(1+!contPlayer.shiftHeal_extension*0.8/(1+contPlayer.galaxy_extension))
		
		if (!contPlayer.shiftHeal_extension)
			instance_create(x, y, objSpeedEffect)
		
		shiftMode = true
		
		change_energy(-shiftDecrease*delta())
		if (energy == 0) {
			shiftLock = true
			mobileAutoShift = false
		}
	}
	else {
		spd = global.movementSpeed
		shiftMode = false
	
		if (!shiftLock)
			shiftLock = true
	
		change_energy(0.5*(1+global.sta*0.01+contPlayer.galaxy_extension*0.5)*delta())
	}

	// ? can be optimized
	spd /= (slowFactor-(slowFactor-1)*min(global.dex*0.008, 1))*(1+!(contPlayer.shiftNoSlow_extension and shiftMode)*(0.5-IS_MOBILE*0.1)*(stance == stShieldMode and !efboxSkill2_exists))

	if (attackTimer > 0 and !stunned) {
		attackTimer -= delta()
		if (attackTimer <= 0)
			attackTimer = 0
	}

	var xDirection, yDirection
	if (IS_MOBILE or global.gamepad_active) {
		if (IS_MOBILE and contGUi.joystick_hold) {		
			//if (abs(gamepadH) > 0.4 or abs(gamepadV) > 0.4) {
				var _magnitude = min(contGUi.joystick_dis/JOYSTICK_R, 1)
				xDirection = lengthdir_x(_magnitude, contGUi.joystick_dir)
				yDirection = lengthdir_y(_magnitude, contGUi.joystick_dir)
			/*}
			else {
				xDirection = 0
				yDirection = 0
			}*/
		}
		else
		{
			var gamepadH = gamepad_axis_value(global.gamepad, gp_axislh)
			var gamepadV = gamepad_axis_value(global.gamepad, gp_axislv)
		
			var gamepadDir = point_direction(0, 0, gamepadH, gamepadV)
			if (abs(gamepadH) > 0.4 or abs(gamepadV) > 0.4) {
				xDirection = lengthdir_x(1, gamepadDir)
				yDirection = lengthdir_y(1, gamepadDir)
			}
			else {
				xDirection = 0
				yDirection = 0
			}
		}
	}
	else {
		xDirection = -keyboard_check(ord("A"))+keyboard_check(ord("D"))
		yDirection = -keyboard_check(ord("W"))+keyboard_check(ord("S"))
		if (abs(xDirection)+abs(yDirection) == 2)
			spd /= sqrt(2)
	}
	
	if ((xDirection != 0 or yDirection != 0) and !stunned and !stopMoving and !contPlayer.onDialogue and !global.consoleMode)
		physics_apply_force(x, y, 17.06*xDirection*spd, 17.06*yDirection*spd)
}

if (!IS_MOBILE and (mouse_check_button(mb_left) or gamepad_button_check(global.gamepad, gp_shoulderr)) or IS_MOBILE and (contGUi.joystick2_dis > 80 or contGUi.joystick2_hold and contPlayer.doingAttack and contPlayer.melee)) {
	var isOutfight = is_outfight()

	if (!IS_MOBILE and global.mouseControl) {
		with (parWindow)
			if (mouseOnBody)
			    exit
	}

	if (!contPlayer.doingAttack) {
		/*if (keyboard_check(vk_add))
			exit*/
		
		if (alarm[8] > -1)
			exit
		
		if (alarm[5] == -1 and isOutfight)
			alarm[5] = 2
	}

	if (attackTimer == 0 and clickattack_basic_conditions(false, false, isFirstAttack) and contPlayer.changeWeaponChoiceTo == -1 and (!IS_MOBILE or !contPlayer.fixedShieldMode)) {
		contPlayer.doingAttack = true
		isFirstAttack = false
		
		var crossbowWaitActive = false
		/*if (IS_MOBILE and global.weaponType == wtype_crossbow and is_mweapon_onhand()) {
			crossbowWaitActive = true
			if (crossbowWait-delta() > 0)
				crossbowWait -= delta()
			else
				crossbowWait = 0
		}
		else {
			crossbowWait = sec/2
			crossbowWaitActive = false
		}*/
	
		if ((!isOutfight or alarm[5] < 1) and (!crossbowWaitActive or crossbowWait == 0) and (abs(angle_difference(-phy_rotation, IS_MOBILE ? contGUi.joystick2_dir : point_direction(x, y, mouse_x, mouse_y))) < 3 or (!global.mouseControl and global.gamepad_active))) {
			attackSpeed = global.attackSpeed
	
			var animationStarted = true
			if (test_effectbox(efboxSkill1) and global.secondaryActive and global.sWeaponType == wtype_ohsword) {
				animationController = instance_create(0, 0, animSkill_1)
			
				var dir
				if (global.gamepad_active and !global.mouseControl)
					dir = image_angle
				else if (!IS_MOBILE)
					dir = point_direction(x, y, mouse_x, mouse_y)
				else
					dir = contGUi.joystick2_dir
			
				physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(10, dir), lengthdir_y(10, dir))
			}
		
		    else if (global.secondaryActive and stance == stBasicAttackBase_ohsword or stance == stBasicAttackBase_ohsword_calm
			or (stance == stShieldMode and test_effectbox(efboxSkill2)))
		        animationController = instance_create(0, 0, animOneHandedSword_ba)
		
		    else if (stance == stBasicAttackBase_crossbow) {
		        animationController = instance_create(0, 0, animCrossbow_ba)
			
				var weaponControl = -1
				with (objCrossbowControl)
					if (owner == other.id)
						weaponControl = id
		
				if (weaponControl != -1) {
			        weaponControl.springTension = 0
					weaponControl.alarm[0] = 1
		
					var arrowSound = audio_play_sound(choose(sndBow2, sndBow2, sndBow2, sndBow3), 1, false)
					audio_play_sound(sndArrow, 1, false)
					audio_sound_pitch(arrowSound, random_range(0.95, 1.25))
				
					arrow_shoot(45, weaponControl)
				}
		    }
	
		    else if (stance == stBasicAttackBase_bow) {
		        animationController = instance_create(0, 0, animBow_ba)
		
				with (objBowControl)
					alarm[0] = 1
		    }
		    else    
		        animationStarted = false
        
			if (animationStarted) {
			    animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
		
				attacktimer_set_max()
        
				with (objAim) {
					image_index = 1
					image_alpha = 0.7
					image_xscale = 1.15
					image_yscale = 1.15
				}
			}
		}
		else if (alarm[5] < 1 or !isOutfight)
			alarm[5] = 2
	}
}
else
	crossbowWait = sec/2