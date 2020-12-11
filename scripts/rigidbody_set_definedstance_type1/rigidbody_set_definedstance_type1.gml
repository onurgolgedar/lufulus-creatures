function rigidbody_set_definedstance_type1() {
	if (stance != argument[0]) {
		stance = argument[0]
		animEnd = false

		if (stance != stPose and noArms) {		
			if (type == type_player) {
				with (objShieldControl) {
					if (owner.type == type_player and tLight != pointer_null and tFire != pointer_null) {
						var myID = id
					
						with (tLight)
							sl_light_active = true
						
						with (tFire) {
							stop = false
							target = myID.tLight
						}
					}
				}
			}
			else if (type == type_npc) {
				if (tLight != pointer_null and tFire != pointer_null) {
					with (tLight)
						sl_light_active = true
					
					with (tFire) {
						target = other.tLight
						stop = false
					}
				}
			}
		
		#region Reset Scales		
			if (leftArm[0] != pointer_null) {
				with (leftArm[0]) {
					image_xscale = 1
					image_yscale = 1
				}
			}
			if (leftArm[1] != pointer_null) {
				with (leftArm[1]) {
					image_xscale = 1
					image_yscale = 1
				}
			}
			if (rightArm[0] != pointer_null) {
				with (rightArm[0]) {
					image_xscale = 1
					image_yscale = -1
				}
			}
			if (rightArm[1] != pointer_null) {
				with (rightArm[1]) {
					image_xscale = 1
					image_yscale = -1
				}
			}
			if (shoulders != pointer_null) {
				with (shoulders) {
					image_xscale = 1
					image_yscale = 1
				}
			}
			if (leftHand != pointer_null) {
				with (leftHand) {
					image_xscale = 1
					image_yscale = 1
				}
			}
			if (rightHand != pointer_null) {
				with (rightHand) {
					image_xscale = 1
					image_yscale = -1
				}
			}
		#endregion
		
			alarm[0] = -1
			alarm[1] = 1
		}
		
		if (argument_count == 2) duration = argument[1] else duration = sec/4

		var shielMode = is_in_shieldmode(id)

	#region Shield Only
		if (argument[0] == stBasicAttackBase_shieldOnly)
			rigidbody_set_stance_type1(
			6, sec/8,
			15, duration,
			-55, duration,
			-15, duration,
			37, duration,
			-112, duration,
			-35, duration, 2)
	#endregion
	#region Shield Mode
		else if (argument[0] == stShieldMode)
			rigidbody_set_stance_type1(
			-7, sec/16,
			0, sec/16,
			-77, sec/16,
			-31, sec/16,
			109, sec/16,
			-97, sec/16,
			12, sec/16, 2)
	#endregion
	#region BA base Crossbow
		else if (argument[0] == stBasicAttackBase_crossbow)
			rigidbody_set_stance_type1(
			-20, sec/8,
			0, duration,
			-5, duration,
			0, duration,
			16, duration,
			-90, duration,	
			0, duration)
	#endregion
	#region BA Crossbow
		else if (argument[0] == stBasicAttack_crossbow)
			rigidbody_set_stance_type1(
			-20, sec/8,
			6, sec/8,
			-15, sec/8,
			0, sec/8,
			20, sec/8,
			-100, sec/8,
			0, sec/8)
	#endregion
	#region Serious
		else if (argument[0] == stSerious)
			rigidbody_set_stance_type1(
			0, sec/8,
			18, sec/2,
			-100, sec/2,
			-13, sec/2,
			18, sec/2,
			-100, sec/2,
			18, sec/2, 1)
	#endregion
	#region Pose
		else if (argument[0] == stPose) {
			rigidbody_set_stance_type1(
			0, sec/12,
			100, sec/6,
			-110, sec/6,
			0, sec/6,
			100, sec/6,
			-110, sec/6,
			0, sec/6, 0)
		}
	#endregion
	#region BA base Bow
		else if (argument[0] == stBasicAttackBase_bow)
			rigidbody_set_stance_type1(
			3, duration,
			8, duration,
			-30, duration,
			25, duration,
			6, duration,
			-61, duration,
			0, duration)
	#endregion
	#region BA Bow Ready
		else if (argument[0] == stBasicAttack_bow_ready)
			rigidbody_set_stance_type1(
			-40, duration,
			19, duration,
			2, duration,
			17, duration,
			0, duration,
			-78, duration,
			-31, duration)
	#endregion
	#region BA Bow Fire
		else if (argument[0] == stBasicAttack_bow_fire)
			rigidbody_set_stance_type1(
			-60, duration,
			52, duration,
			-5, duration,
			12, duration,
			-6, duration,
			-93, duration,
			-31, duration)
	#endregion
	#region BA base Ohsword calm
		else if (argument[0] == stBasicAttackBase_ohsword_calm)
			rigidbody_set_stance_type1(
			21, duration,
			40, duration,
			-71, duration,
			-3, duration,
			64, duration,
			-100, duration,
			-9, duration, 2)
	#endregion
	#region BA base Ohsword
		else if (argument[0] == stBasicAttackBase_ohsword)
			rigidbody_set_stance_type1(
			shielMode ? -7 : -42, duration,
			shielMode ? 0 : 75, duration,
			shielMode ? -77 : -92, duration,
			shielMode ? -31 : -31, duration,
			59, duration,
			-77, duration,
			30, duration, 2)
	#endregion
	#region Before BA Ohsword
		else if (argument[0] == stBeforeBasicAttack_ohsword)
			rigidbody_set_stance_type1(
			-70, duration,
			shielMode ? 0 : 64.5, duration,
			shielMode ? -77 : -109, duration,
			shielMode ? -31 : -21.4, duration,
			87, duration,
			-103, duration,
			22.2, duration)
	#endregion
	#region Before BA Ohsword 2
		else if (argument[0] == stBeforeBasicAttack_ohsword_2)
			rigidbody_set_stance_type1(
			-57, duration,
			shielMode ? 0 : 99, duration,	
			shielMode ? -77 : -97, duration,
			shielMode ? -31 : -22, duration,
			79, duration,
			-117, duration,
			-14, duration)
	#endregion
	#region Before BA Ohsword 3
		else if (argument[0] == stBeforeBasicAttack_ohsword_3)
			rigidbody_set_stance_type1(
			-27, duration,
			shielMode ? 0 : 124, duration,	
			shielMode ? -77 : -122, duration,
			shielMode ? -31 : -27, duration,
			79, duration,
			-87, duration,
			-36, duration)
	#endregion
	#region BA Ohsword
		else if (argument[0] == stBasicAttack_ohsword)
			rigidbody_set_stance_type1(
			-20, duration,
			shielMode ? 0 : 20.5, duration,
			shielMode ? -77 : -87, duration,
			shielMode ? -31 : -21.4, duration,
			18, duration,
			-52, duration,	
			41.6, duration)
	#endregion
	#region BA Ohsword 2
		else if (argument[0] == stBasicAttack_ohsword_2)
			rigidbody_set_stance_type1(
			-27, duration,
			shielMode ? 0 : 54, duration,
			shielMode ? -77 : -114, duration,
			shielMode ? -31 : -22, duration,
			9, duration,
			-42, duration,
			49, duration)
	#endregion
	#region BA Ohsword 3
		else if (argument[0] == stBasicAttack_ohsword_3)
			rigidbody_set_stance_type1(
			18, duration,
			shielMode ? 0 : 49, duration,
			shielMode ? -77 : -92, duration,
			shielMode ? -31 : -27, duration,
			59, duration,
			-27, duration,
			14, duration)
	#endregion
	#region Wounded
		else if (argument[0] == stWounded)
			rigidbody_set_stance_type1(
			-27, sec/8,
			-21, duration,
			-22, duration,
			-46, duration,
			-16, duration,
			-57, duration,
			-65, duration, 2)
	#endregion
	#region Skill1 
		else if (argument[0] == stSkill1)
			rigidbody_set_stance_type1(
			-42, duration,
			100, duration,
			-103, duration,
			-38, duration,
			95, duration,
			-116, duration,
			32, duration)
	#endregion
	#region Skill1 2
		else if (argument[0] == stSkill1_2)
			rigidbody_set_stance_type1(
			31, duration,
			90, duration,
			-91, duration,
			-26, duration,
			-7, duration,
			-11, duration,
			38, duration)
	#endregion
	#region Normal
		else if (argument[0] == stNormal)
			rigidbody_set_stance_type1(
			22, sec/8,
			40, sec/2,
			-77, sec/2,
			-17, sec/2,
			89, sec/2,
			-108, sec/2,
			-10, sec/2, 1)
	#endregion
	#region Normal2
		else if (argument[0] == stNormal2)
			rigidbody_set_stance_type1(
			0, duration,
			40, duration,
			-90, duration,
			-38, duration,
			25, duration,
			-103, duration,
			21, duration)
	#endregion
	#region Pull
		else if (argument[0] == stPull)
			rigidbody_set_stance_type1(
			-7, sec/8,
			111, duration,
			-109, duration,
			-7, duration,
			25, duration,
			-26, duration,
			-5, duration, 3)
	#endregion
	#region Pull 2
		else if (argument[0] == stPull2)
			rigidbody_set_stance_type1(
			-30, sec/8,
			46, duration,
			-104, duration,
			-7, duration,
			105, duration,
			-136, duration,
			-20, duration, 3)
	#endregion
	#region Brain Attack 1
		else if (argument[0] == stBrainAttack1)
			rigidbody_set_stance_type1(
			12, sec/8,
			145, duration,
			-130, duration,
			-26, duration,
			4, duration,
			-16, duration,
			25, duration)
	#endregion
	#region Brain Attack 2
		else if (argument[0] == stBrainAttack2)
			rigidbody_set_stance_type1(
			-2, sec/8,
			119, duration,
			-96, duration,
			-31, duration,
			59, duration,
			-100, duration,
			21, duration)
	#endregion
	#region Strike Mode
		else if (argument[0] == stStrikeMode)
			rigidbody_set_stance_type1(
			0, duration,
			150, duration,
			-150, duration,
			-15, duration,
			150, duration,	
			-150, duration,
			-15, duration, 3)
	#endregion
	#region Basic Heal
		else if (argument[0] == stBasicHeal)
			rigidbody_set_stance_type1(
			0, sec/8,
			62, duration,
			-107, duration,
			-35, duration,
			86, duration,
			-64, duration,
			-7, duration)
	#endregion
	#region Slow Stone move
		else if (argument[0] == stSlowStoneMove1)
			rigidbody_set_stance_type1(
			0, sec/8,
			52, duration,
			-63, duration,
			-7, duration,
			122, duration,
			-113, duration,
			25, duration, 2)
	#region
	#endregion Slow Stone move 2
		else if (argument[0] == stSlowStoneMove2)
			rigidbody_set_stance_type1(
			0, sec/8,
			68, duration,
			-63, duration,
			-7, duration,
			42, duration,
			-41, duration,
			0, duration, 2)
	#endregion
	#region Turtle Mode
		else if (argument[0] == stTurtleMode)
			rigidbody_set_stance_type1(
			0, sec/8,
			22, duration,
			-85, duration,
			-20, duration,
			22, duration,
			-85, duration,
			-20, duration, 2)
	#endregion
	#region Open Arms
		else if (argument[0] == stOpenArms)
			rigidbody_set_stance_type1(
			6, sec/8,
			85, duration,
			-21, duration,
			-3, duration,
			89, duration,
			-25, duration,
			-9, duration, 2)
	#endregion
	}
}
