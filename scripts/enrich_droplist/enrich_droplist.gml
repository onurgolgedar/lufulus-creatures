function enrich_droplist() {
	var isLootbox = object_index == objLootbox
	var chooseMax_mode = false
	if (argument_count > 0)
		chooseMax_mode = argument[0]

	if (isDropEnrichment_needed == -1)
		isDropEnrichment_needed = true

	if (!boss and !isLeader_hard and !instance_exists(contWaveSpawn) and leader != pointer_null and !isLootbox) {
		isDropEnrichment_needed = false
		exit
	}

	if ((!inView or !isDropEnrichment_needed) and !isLootbox)
		exit
	
	isDropEnrichment_needed = false

	var ds_size = ds_list_size(global.normalDrops)
	for (var i = 0; i < ds_size; i++) {
		var itemLevel = ds_list_find_value(global.normalDrops_levels, i)
		var item = ds_list_find_value(global.normalDrops, i)
	
		var diff_item_creature = itemLevel-level
	
		if (abs(diff_item_creature) <= 5) {
			var itemInstance = instance_create(0, 0, item)
		
			var goodLuck = (irandom(22+diff_item_creature*2-boss*2) == 0) and (diff_item_creature <= 3) and itemInstance.specialty < 50
		
		#region Extension 0
			var ext0 = -1
			if (itemInstance.upgrade != unique_number and itemInstance.upgrade != unique_number+1) {
				var chance_temp = irandom(10)
			
				if (chance_temp == 0) {
					if (itemInstance.type == type_mweapon or itemInstance.type == type_sweapon) {
						ext0 = extension_get_better(itemInstance.weaponType, itemInstance.extension[0])
						ext0 = extension_get_better(itemInstance.weaponType, ext0)
					}
				}
				else if (chance_temp < 4) {
					if (itemInstance.type == type_mweapon or itemInstance.type == type_sweapon) {
						ext0 = extension_get_better(itemInstance.weaponType, itemInstance.extension[0])
					}
				}
			}
		#endregion
		
		#region Extension 1
			var ext1 = -1
			if (ext0 == itemInstance.extension[1] and ext0 != -1)
				ext1 = 0
		#endregion
			
			/*var dropChance = 100
			itemInstance.specialty = 0*/
			if (diff_item_creature == 5)
				dropChance = 1
			else if (diff_item_creature == 4)
				dropChance = 2
			else if (diff_item_creature == 3)
				dropChance = 4
			else if (diff_item_creature == 2)
				dropChance = 5
			else if (diff_item_creature == 1)
				dropChance = 7
			else if (diff_item_creature == 0)
				dropChance = 9
			else if (diff_item_creature == -1)
				dropChance = 7
			else if (diff_item_creature == -2)
				dropChance = 5
			else if (diff_item_creature == -3)
				dropChance = 4
			else if (diff_item_creature == -4)
				dropChance = 2
			else if (diff_item_creature == -5)
				dropChance = 1
				
			dropChance *= 1-chance(itemInstance.specialty, 100)
			dropChance *= 1-0.33*abilityEqualTeam
			dropChance *= 1-0.25*isLootbox
			dropChance = round(dropChance*(1+0.4*(global.level < 5)))

			if (boss and itemInstance.specialty >= 50)
				dropChance *= 5
			else if (isLeader_hard or boss)
				dropChance *= 2
			
			if (itemInstance.specialty > ITEM_UNIQUE_SPECIALTY-5 and isLootbox)
				dropChance = 0
		
			var upg
			if (itemInstance.upgrade != unique_number and itemInstance.upgrade != unique_number+1) {
				var addUpg = (irandom(7+diff_item_creature) == 0)+(irandom(7+diff_item_creature) == 0)+(irandom(7+diff_item_creature) == 0)
				upg = goodLuck ? irandom(3) : irandom(2)
				upg += addUpg+goodLuck*2
				upg += (itemLevel < global.level-2) ? choose(0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4) : 0
				if (upg > 7) {
					if (irandom(4) != 0)
						upg = 7
					else
						upg = 8
				}
				
				// Upgrade Overwrite
				if (diff_item_creature == 5 or (diff_item_creature > 3 and itemInstance.specialty >= ITEM_UNIQUE_SPECIALTY))
					upg = 1
				
				if (irandom(4) <= 1 and upg < 6 and itemInstance.specialty < ITEM_UNIQUE_SPECIALTY) {
					if ((itemInstance.extension[0] == -1 and itemInstance.extension[1] == -1) or upg+1.2 >= 6)
						upg += 1.2 // Not upgradable
				}
			}
			else
				upg = itemInstance.upgrade
			
			// If the item is garbage, do not drop it.
			if (itemLevel < global.level-3-max(0, upg-3))
				dropChance = ceil(dropChance*1/2)
		
			if (dropChance > 0) {
				update_droplist(item,
				upg,
				ext0, ext1,
				ceil(dropChance), 1, chooseMax_mode)
			
				itemInstance.upgrade = upg
				if (irandom(1) and is_item_upgradable(itemInstance) and global.level > 3) {
					update_droplist(objUpgradeMaterial,
					item_get_upgradematerial_type(itemInstance.itemLevel, itemInstance.specialty),
					-1, -1, ceil(clamp(dropChance*1.1, 0, 1000)), upg+1, chooseMax_mode)
				}
			}
		
			instance_destroy(itemInstance)
		}
	}

#region Blood Mineral Quest // ? can be optimized
	if (is_quest_finished(objQuest_mineralCave) and !quest_exists(objQuest_bloodMineral) and !is_quest_finished(objQuest_bloodMineral) and !isLootbox)
		update_droplist(objBloodMineral_second, 0, -1, -1, 60+940*global.debugMode, 1)
#endregion

	if (level > 7 and level < 25) {
		var platinumChance = floor(3+7+isLootbox*10-abs(level-16)/2+isLeader_hard*20)
		var platinumCount = 1+(irandom(3) == 0)+(level > 12)*(irandom(3) == 0)+(level > 20)*(irandom(3) == 0)
	
		update_droplist(objPlatinum, 0, -1, -1, platinumChance, platinumCount, chooseMax_mode)
	
		update_droplist(objMedicalKit, -1, -1, -1, 10+isLootbox*300, 1+irandom(2))
		update_droplist(objMedicalKit2, -1, -1, -1, 3+isLootbox*300, 1+irandom(1))
	}

	if (level > 18) {
		var crystalChance = floor(5+isLootbox*10+(level-18)/6+isLeader_hard*20)
		var crystalCount = 1+(irandom(4) == 0)+(level > 18)*(irandom(4) == 0)+(level > 25)*(irandom(4) == 0)
	
		update_droplist(objGoldPiece, 0, -1, -1, crystalChance, crystalCount, chooseMax_mode)
	
		update_droplist(objMedicalKit, -1, -1, -1, 12+isLootbox*300, 1+irandom(1))
		update_droplist(objMedicalKit2, -1, -1, -1, 17+isLootbox*300, 1+irandom(2))
		update_droplist(objMedicalKit3, -1, -1, -1, 6+isLootbox*300, 1+irandom(1))
	}

	if (level > 24) {
		var crystalChance = floor(3+isLootbox*10+(level-24)/6+isLeader_hard*15)
		var crystalCount = 1+(irandom(4) == 0)+(level > 27)*(irandom(4) == 0)+(level > 34)*(irandom(4) == 0)
	
		update_droplist(objCrystal, 0, -1, -1, crystalChance, crystalCount, chooseMax_mode)
	
		update_droplist(objMedicalKit2, -1, -1, -1, 6+isLootbox*300, 1+irandom(1))
		update_droplist(objMedicalKit3, -1, -1, -1, 21+isLootbox*300, 1+irandom(2))
	}

	if (level > 29) {
		var crystalChance = floor(5+isLootbox*10+(level-29)/6+isLeader_hard*17)
		var crystalCount = 1+(irandom(4) == 0)+(level > 27)*(irandom(4) == 0)+(level > 34)*(irandom(4) == 0)
	
		update_droplist(objCrystal, 0, -1, -1, crystalChance, crystalCount, chooseMax_mode)
	
		update_droplist(objMedicalKit3, -1, -1, -1, 9+isLootbox*300, 1+irandom(1))
		update_droplist(objMedicalKit4, -1, -1, -1, 19+isLootbox*300, 1+irandom(2))
	}

	if (isLeader_hard or boss)
		update_droplist(objUpgradeMaterial, item_get_upgradematerial_type(level, 0), -1, -1, 70+isLootbox*130, 1+irandom(1)+boss*2)


}
