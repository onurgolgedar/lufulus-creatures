/// @param finishedChallenges_count
function recalculate_game_score() {

	var finishedChallenges_count = argument[0]

	global.game_score = global.level*20+global.levels_withoutDying_rewardCount*10
	global.game_score += global.givenSkillPoints*3
	global.game_score += ds_list_size(global.takenLootboxes)*3
	global.game_score += global.givenStr+global.givenDex+global.givenMp+global.givenVit+global.givenSta
	
	var weaponScore = 0
	if (global.sWeaponI != -1) {
		var item = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
		var extension0 = global.itemExtension0[global.sWeaponI, global.sWeaponJ]
		var extension1 = global.itemExtension1[global.sWeaponI, global.sWeaponJ]
		var upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
		
		weaponScore = floor((1+item_get_upgradematerial_type(item.itemLevel, item.specialty)*1.5+item.itemLevel/3)
					   *(upgrade == unique_number ? 5 : (upgrade == unique_number+1 ? 3 : (0.5+upgrade+(upgrade >= 6)*3+(upgrade >= 8)*5))))
		global.game_score += weaponScore
		instance_destroy(item)
	}
	
	if (global.weaponI != -1) {
		var item = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
		var extension0 = global.itemExtension0[global.weaponI, global.weaponJ]
		var extension1 = global.itemExtension1[global.weaponI, global.weaponJ]
		var upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
		
		weaponScore = floor((1+item_get_upgradematerial_type(item.itemLevel, item.specialty)*1.5+item.itemLevel/3)
					   *(upgrade == unique_number ? 5 : (upgrade == unique_number+1 ? 3 : (0.5+upgrade+(upgrade >= 6)*3+(upgrade >= 8)*5))))
		global.game_score += weaponScore
		instance_destroy(item)
	}
	
	if (global.sWeaponI == -1 or global.weaponI == -1)
		global.game_score += floor(weaponScore*1/2)
		
	if (global.clothesI != -1) {
		var item = instance_create(0, 0, global.item[global.clothesI, global.clothesJ])
		var extension0 = global.itemExtension0[global.clothesI, global.clothesJ]
		var extension1 = global.itemExtension1[global.clothesI, global.clothesJ]
		var upgrade = global.itemUpgrade[global.clothesI, global.clothesJ]
		
		global.game_score += floor((1+item_get_upgradematerial_type(item.itemLevel, item.specialty)*1.5+item.itemLevel/3)
							  *(upgrade == unique_number ? 5 : (upgrade == unique_number+1 ? 3 : (0.5+upgrade+(upgrade >= 6)*3+(upgrade >= 8)*5))))
		instance_destroy(item)
	}
	
	if (global.medallionI != -1)
		global.game_score += 100
		
	if (global.necklaceI != -1) {
		var item = instance_create(0, 0, global.item[global.necklaceI, global.necklaceJ])
		var extension0 = global.itemExtension0[global.necklaceI, global.necklaceJ]
		var extension1 = global.itemExtension1[global.necklaceI, global.necklaceJ]
		var upgrade = global.itemUpgrade[global.necklaceI, global.necklaceJ]
		
		global.game_score += floor((1+item_get_upgradematerial_type(item.itemLevel, item.specialty)*1.5+item.itemLevel/3)
							  *(upgrade == unique_number ? 5 : (upgrade == unique_number+1 ? 3 : (0.5+upgrade+(upgrade >= 6)*3+(upgrade >= 8)*5))))
		instance_destroy(item)
	}
	
	global.game_score += global.maxCreatureScore
	global.game_score += instance_number(efboxRecruitedLowWarrior1)*50
						 +instance_number(efboxRecruitedLowWarrior2)*100
						 +instance_number(efboxRecruitedWarrior1)*250
						 +instance_number(efboxRecruitedWarrior2)*350
						 +instance_number(efboxRecruitedWarrior3)*500
						 +instance_number(efboxRecruitedWarrior4)*750

	global.game_score *= 1+ds_list_size(global.destroyedMaps)*0.05+finishedChallenges_count*0.03
	global.game_score *= (1-2*global.isCheated)

	global.game_score = floor(global.game_score)

	with (contMain)
		steam_leaderboard_download_id = steam_download_scores_around_user(steam_leaderboard_name, 0, 0)

	global.anticheat_game_score = recalculate_sha_game_score()


}
