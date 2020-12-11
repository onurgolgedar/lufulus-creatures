var affecteds = get_affecteds(objPlayer.id, objPlayer.id, -1, id)
var ds_size = ds_list_size(affecteds)
for (var i = 0; i < ds_size; i++) {
	with (ds_list_find_value(affecteds, i)) {
		if (mode == md_attack or !global.defenseLock) {
			var efbox = add_effectbox(efboxFire, -1, 4*sec)
			efbox.creator = objPlayer.id
			efbox.damage = other.damage
		}
		else if (!death)
			slide_text(x, y, eng() ? "safety\nstate" : "güvenlik\ndurumu", c_yellow, 0)
	}
}
ds_list_destroy(affecteds)


delta_alarm(2, sec)