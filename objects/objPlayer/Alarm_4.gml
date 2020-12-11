/// @description Rigidbody Creation

item_shining_refresh()
update_weight()

#region Rigidbody
var shoulders_obj = objShoulders_rbt1

var arm_obj = objArm_rbt1
var arm_dis = 26

var frontArm_obj = objFrontArm_rbt1
var frontArm_dis = 22

var hand_obj = objHand_rbt1
var hand_dis = 40

rigidbody_set_type1(shoulders_obj,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis)
rigidbody_noarms_type1()
#endregion

if (global.clothesI != -1) {
	var clothes = instance_create(-50, -50, global.item[global.clothesI, global.clothesJ])
	shoulders.sprite_index = clothes.sprite_index
	leftArm[0].sprite_index = clothes.clothesArm
	rightArm[0].sprite_index = clothes.clothesArm
	leftArm[1].sprite_index = clothes.clothesFrontArm
	rightArm[1].sprite_index = clothes.clothesFrontArm
	instance_destroy(clothes)
}

#region Protectors
if (global.petMode) {
	var protectors = ds_list_create()
	var protector = pointer_null

	protector = target_spawn_protectors(objWarrior_melee, 400)
	if (protector != pointer_null) {
		protector.shoulders.sprite_index = sprClot_004
		protector.leftArm[0].sprite_index = sprArm
		protector.rightArm[0].sprite_index = sprArm
		protector.leftArm[1].sprite_index = sprFrontArm
		protector.rightArm[1].sprite_index = sprFrontArm
		protector.teamNo = team_player
		ds_list_add(protectors, protector)
	}

	protector = target_spawn_protectors(objWarrior_melee, 400)
	if (protector != pointer_null) {
		protector.shoulders.sprite_index = sprClot_004
		protector.leftArm[0].sprite_index = sprArm
		protector.rightArm[0].sprite_index = sprArm
		protector.leftArm[1].sprite_index = sprFrontArm
		protector.rightArm[1].sprite_index = sprFrontArm
		protector.teamNo = team_player
		ds_list_add(protectors, protector)
	}

	protector = target_spawn_protectors(objWarrior_melee, 400)
	if (protector != pointer_null) {
		protector.shoulders.sprite_index = sprClot_004
		protector.leftArm[0].sprite_index = sprArm
		protector.rightArm[0].sprite_index = sprArm
		protector.leftArm[1].sprite_index = sprFrontArm
		protector.rightArm[1].sprite_index = sprFrontArm
		protector.teamNo = team_player
		ds_list_add(protectors, protector)
	}
	
	#region Allies Construction
	var ds_size = ds_list_size(protectors)
	for (var i = 0; i < ds_size; i++)
		with (ds_list_find_value(protectors, i)) {
			ds_list_copy(allies, protectors)
			ai_protectors_remove(id)
		}
	#endregion
	
	ds_list_destroy(protectors)
}
#endregion