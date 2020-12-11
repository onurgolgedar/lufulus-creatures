damage = (skill_get_value(objSkill_12, upgrade, type_physicaldamage)+skill_get_value(objSkill_12, upgrade, type_magicaldamage))*(1+bar/100)

var effect = instance_create(x, y, efExplosionHuge)
effect.size = 1+other.bar/100
effect.permanentFire = true
effect.permanentFireLife = sec*3
effect.upgrade = upgrade

var affecteds = get_affecteds(objPlayer.id, objPlayer.id, -1, id)
var ds_size = ds_list_size(affecteds)
for (var i = 0; i < ds_size; i++) {
	with (ds_list_find_value(affecteds, i)) {
		if (mode == md_attack or !global.defenseLock) {
			var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			var powr = phy_mass*(8+10*other.bar/100)
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
			
			attacked(other.damage, objPlayer.id, false)
				
			var efbox = add_effectbox(efboxFire, -1, 4*sec)
			efbox.creator = objPlayer.id
			efbox.damage = other.damage
		}
		else if (!death)
			slide_text(x, y, eng() ? "safety\nstate" : "güvenlik\ndurumu", c_yellow, 0)
	}
}
ds_list_destroy(affecteds)
	
audio_play_sound(sndFlameBurst, 10, false)