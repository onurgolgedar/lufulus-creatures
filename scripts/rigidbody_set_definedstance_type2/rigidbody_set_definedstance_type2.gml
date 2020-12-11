function rigidbody_set_definedstance_type2() {
	if (stance != argument[0]) {
		stance = argument[0]
		animEnd = false

		if (argument_count == 2) duration = argument[1] else duration = sec/10
 
	#region Base
		if (argument[0] == stBase)
			rigidbody_set_stance_type2(
			0, sec/8,
			70, duration,
			-85, duration,	
			-25, duration,
			70, duration,
			-85, duration,
			-25, duration, 4)
	#endregion
	#region Base 2
		else if (argument[0] == stBase2)
			rigidbody_set_stance_type2(
			-7, sec/8,
			62, duration,
			-77, duration,
			-35, duration,
			86, duration,
			-89, duration,
			-7, duration, 4)
	#endregion
	#region Base 3
		else if (argument[0] == stBase3)
			rigidbody_set_stance_type2(
			-7, sec/8,
			86, duration,	
			-89, duration,	
			-7, duration,
			65, duration,
			-81, duration,
			-15, duration, 4)
	#endregion
	#region BA Melee
		else if (argument[0] == stBaNormal)
			rigidbody_set_stance_type2(
			0, sec/8,
			118, duration,	
			-95, duration,	
			0, duration,	
			118, duration,
			-95, duration,
			0, duration)
	#endregion
	#region BA 2 Melee
		else if (argument[0] == stBaNormal2)
			rigidbody_set_stance_type2(
			0, sec/8,
			7, duration,
			-26, duration,
			-10, duration,
			7, duration,
			-26, duration,
			-10, duration)
	#endregion
	#region Turtle Mode
		else if (argument[0] == stTurtleMode)
			rigidbody_set_stance_type2(
			0, sec/8,
			22, duration,
			-85, duration,
			-20, duration,
			22, duration,
			-85, duration,
			-20, duration, 2)
	#endregion
	#region Strike Mode
		else if (argument[0] == stStrikeMode)
			rigidbody_set_stance_type2(
			0, duration,
			150, duration,
			-150, duration,
			-15, duration,
			150, duration,	
			-150, duration,
			-15, duration, 3)
	#endregion
	#region Slow Stone move
		else if (argument[0] == stSlowStoneMove1)
			rigidbody_set_stance_type2(
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
			rigidbody_set_stance_type2(
			0, sec/8,
			68, duration,
			-63, duration,
			-7, duration,
			42, duration,
			-41, duration,
			0, duration, 2)
	#endregion
	#region BA Ranged Right
		else if (argument[0] == stBaRanged_right)
			rigidbody_set_stance_type2(
			0, sec/8,
			52, duration,
			-63, duration,
			-7, duration,
			122, duration,
			-113, duration,
			25, duration, 2)
	#region
	#endregion Slow Stone move 2
		else if (argument[0] == stBaRanged2_right)
			rigidbody_set_stance_type2(
			0, sec/8,
			68, duration,
			-63, duration,
			-7, duration,
			42, duration,
			-41, duration,
			0, duration, 2)
	#endregion
	#region BA Ranged Left
		else if (argument[0] == stBaRanged_left)
			rigidbody_set_stance_type2(
			0, sec/8,
			122, duration,
			-113, duration,
			25, duration,
			52, duration,
			-63, duration,
			-7, duration, 2)
	#region
	#endregion Slow Stone move 2
		else if (argument[0] == stBaRanged2_left)
			rigidbody_set_stance_type2(
			0, sec/8,
			42, duration,
			-41, duration,
			0, duration,
			68, duration,
			-63, duration,
			-7, duration, 2)
	#endregion
	#region Earth move
		else if (argument[0] == stEarthMove1)
			rigidbody_set_stance_type2(
			0, sec/8,
			160, duration,
			-141, duration,
			0, duration,
			70, duration,
			-100, duration,
			0, duration, 3)
	#endregion
	#region Earth move 2
		else if (argument[0] == stEarthMove2)
			rigidbody_set_stance_type2(
			0, sec/8,
			20, duration,
			-47, duration,
			0, duration,
			20, duration,
			-40, duration,
			0, duration)
	#endregion
	#region Pull
		else if (argument[0] == stPull)
			rigidbody_set_stance_type2(
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
			rigidbody_set_stance_type2(
			-30, sec/8,
			46, duration,
			-104, duration,
			-7, duration,
			105, duration,
			-136, duration,
			-20, duration, 3)
	#endregion
	#region Basic Heal
		else if (argument[0] == stBasicHeal)
			rigidbody_set_stance_type2(
			0, sec/8,
			62, duration,
			-107, duration,
			-35, duration,
			86, duration,
			-64, duration,
			-7, duration)
	#endregion
	#region Brain Attack 1
		else if (argument[0] == stBrainAttack1)
			rigidbody_set_stance_type2(
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
			rigidbody_set_stance_type2(
			-2, sec/8,
			119, duration,
			-96, duration,
			-31, duration,
			59, duration,
			-100, duration,
			21, duration)
	#endregion
	}


}
