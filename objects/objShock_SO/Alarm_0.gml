image_xscale *= 1+owner.boss*0.15
image_yscale = image_xscale

var affecteds = get_affecteds(owner, owner, -1, id)
var ds_size = ds_list_size(affecteds)
for (var i = 0; i < ds_size; i++) {
	with (ds_list_find_value(affecteds, i)) {
		if (target == other.owner or id == other.owner.target) {
			var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			var powr = phy_mass*15
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
			
			attacked(other.damage, (other.owner.object_index != objLufulusWisdom) ? other.owner : pointer_null, false)
			
			add_effectbox(efboxStun, -1, sec*2/3)
		}
	}
}
ds_list_destroy(affecteds)
	
if (place_meeting(x, y, parShot)) {
	with (parShot) {
		if (!collision_line(x, y, other.x, other.y, parSolid, 1, 0)
		and place_meeting(x, y, other)) {
			var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)+choose(-30, 30)
			var powr = phy_mass*15
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
		}
	}
}
	
var snd = audio_play_sound(sndExplosion, 1, false)
audio_sound_pitch(snd, 1.19)

burst_light(owner, sec/3, 0.5, 2.5)