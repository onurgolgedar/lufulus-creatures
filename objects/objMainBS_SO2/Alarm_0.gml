var totalUpg = upgSk5+upgSk6+upgSk7
alpha5ratio = (4.5-upgSk5/4*3.5)*(1+totalUpg/11)
alpha6ratio = (4.5-upgSk6/4*3.5)*(1+totalUpg/11)
alpha7ratio = (4.5-upgSk7/4*3.5)*(1+totalUpg/11)
alphaBaseRatio = 2+totalUpg/2

if (upgSk7 > 0) {
	global.selectedSkillRem[4] -= round(global.selectedSkillMaxRem[4]*skill_get_value(objSkill_7, upgSk7, type_value)/100*(1+bar/100))
	
	with (objPlayer)
		change_hp(global.maxHp*skill_get_value(objSkill_7, other.upgSk7, type_value2)/100*(1+other.bar/100))
}

var affecteds = get_affecteds(objPlayer.id, objPlayer.id, -1, id)
var ds_size = ds_list_size(affecteds)
var damage, rangedkill_exists
if (ds_size > 0) {
	rangedkill_exists = extension_exists(ext_ctrl_rangedkill)
	damage = (skill_get_value(objMainBS, upgrade, type_physicaldamage)+skill_get_value(objMainBS, upgrade, type_magicaldamage))*(1+bar/100)
	*(1+0.25*test_effectbox(efboxCriticalBoost)+0.24*extension_exists(ext_ctrl_dmg24)
	+0.12*extension_exists(ext_ctrl_dmg12)+contPlayer.masterMage_extension*0.1+global.mp*0.005)+addDamage
}
for (var i = 0; i < ds_size; i++) {
	with (ds_list_find_value(affecteds, i)) {
		if (mode == md_attack or !global.defenseLock) {
			var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			var powr = phy_mass*(10+15*other.bar/100)
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
			
			damage *= 1+(0.25*isRanged*rangedkill_exists)
			attacked(damage, objPlayer.id, false)
				
			var extraDuration = (other.upgSk5 > 0) ? skill_get_value(objSkill_5, other.upgSk5, type_value)*sec : 0
			add_effectbox(efboxStun, -1, (1/2+3/5*other.bar/100)*sec+extraDuration)
				
			if (extension_exists(ext_ctrl_wound))
				add_effectbox(efboxWound)
				
			if (other.upgSk6 > 0) {
				var efbox = add_effectbox(efboxFire, -1, 2*sec)
				efbox.creator = objPlayer.id
				efbox.damage = round(damage*skill_get_value(objSkill_6, other.upgSk6, type_value2)/100)
			}
		}
		else if (!death)
			slide_text(x, y, eng() ? "safety\nstate" : "güvenlik\ndurumu", c_yellow, 0)
	}
}
ds_list_destroy(affecteds)
	
if (place_meeting(x, y, parShot)) {
	with (parShot) {
		if (!collision_line(x, y, other.x, other.y, parSolid, 1, 0)
		and place_meeting(x, y, other)) {
			angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			powr = phy_mass*(10+15*other.bar/100)
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
		}
	}
}
	
if (place_meeting(x, y, parSuperShot)) {
	with (parSuperShot) {
		if (!collision_line(x, y, other.x, other.y, parSolid, 1, 0)
		and place_meeting(x, y, other)) {
			angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			powr = phy_mass*(10+15*other.bar/100)
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
		}
	}
}
	
audio_play_sound(sndExplosion, 1, false)

burst_light(objPlayer.id, sec/12*5, 0.25+other.bar/100*0.55, 2+other.bar/100*2)