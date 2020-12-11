/// @param skill
/// @param skillIndex
function skill_use() {

	var i = argument[1]
	var skill = argument[0]
	var skillUsed = false
	var skillUpgrade = skill_get_upgrade(skill)

	if (global.selectedSkillRem[i] == 0 and global.selectedSkillMana[i] <= objPlayer.mana) {
	#region Duelist BS
		if (skill == objMainBS) {
			with (objPlayer)
				add_effectbox(efboxMainBS, skillUpgrade)
			
			skillUsed = true
		}
	#endregion
	#region Skill 1
		else if (skill == objSkill_1
		and global.secondaryActive and global.sWeaponType == wtype_ohsword) {
			with (objPlayer)
				add_effectbox(efboxSkill1, skillUpgrade)
			
			skillUsed = true
		}
	#endregion
	#region Skill 2
		else if (skill == objSkill_2
		 and global.weaponType == wtype_shield and is_mweapon_onhand()) {
			with (objPlayer)
				add_effectbox(efboxSkill2, skillUpgrade, skill_get_value(objSkill_2, -1, type_duration))
			
			skillUsed = true
		}
	#endregion
	#region Skill 8
		else if (skill == objSkill_8
		 and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow) and is_mweapon_onhand()) {
			with (objPlayer)
				add_effectbox(efboxSkill8, skillUpgrade)
			
			skillUsed = true
		}
	#endregion
	#region Skill 9
		else if (skill == objSkill_9
		 and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow) and is_mweapon_onhand()) {		
			with (objPlayer)
				add_effectbox(efboxSkill9, skillUpgrade)
			
			skillUsed = true
		}
	#endregion
	#region Skill 10
		else if (skill == objSkill_10
		 and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow) and is_mweapon_onhand()) {		
			with (objPlayer)
				add_effectbox(efboxSkill10, skillUpgrade)
			
			skillUsed = true
		}
	#endregion
	#region Skill 12
		else if (skill == objSkill_12) {		
			with (objPlayer)
				add_effectbox(efboxSkill12, skillUpgrade)
			
			with (efboxSkill12)
				skillNo = i
		
			with (animBow_ba)
				if (owner == objPlayer.id)
					event_user(1)
			
			skillUsed = true
		}
	#endregion
		
	#region If the skill has been successfully used.
		if (skillUsed) {
			audio_play_sound(sndSkill_used, 5, false)
		
			global.selectedSkillRem[i] = global.selectedSkillMaxRem[i]
	
			with (objPlayer)
				change_mana(-global.selectedSkillMana[i])
		}
		else
			audio_play_sound(sndError, 5, false)
	#endregion
	}
	else if (objPlayer.mana < global.selectedSkillMana[i]) {
		slide_text(objPlayer.x, objPlayer.y, eng() ? "no mana" : "mana az", c_blue, false, true)
		audio_play_sound(sndWindowTick, 10, false)
	}


}
