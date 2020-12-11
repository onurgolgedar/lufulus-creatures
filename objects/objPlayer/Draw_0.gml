var invisibilityRatio = 1+2*invisibility
var aalpha = image_alpha/invisibilityRatio

var image_xscale_new = image_xscale*scale_factor*bodyWeight
var image_yscale_new = image_yscale*scale_factor*bodyWeight

if (stance == stBasicAttackBase_ohsword_calm and global.secondaryActive) {
	var xx = x+lengthdir_x(28, image_angle+57)
	var yy = y+lengthdir_y(28, image_angle+57)
	draw_outline(global.sWeaponSprite, -1, xx, yy, 0.83, 0.9, image_angle+195, sWeaponAlpha_calm)
	draw_sprite_ext(global.sWeaponSprite, -1, xx, yy, 0.83, 0.9, image_angle+195, c_white, sWeaponAlpha_calm)
	
	if (objSWeapon.shiningPower) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.18+contMain.period/(30-objSWeapon.shiningPower*10))*aalpha)

		draw_sprite_ext(global.sWeaponSprite, -1, xx, yy, 0.83, 0.9, image_angle+195, c_white, sWeaponAlpha_calm)
		shader_reset()
	}
}

if (invisibility)
	var dir = current_time/4 mod 360
else {
	var ds_size = ds_list_size(rigidbodyParts)
	for (var rb = 0; rb < ds_size; rb++) {
		var rb_part = ds_list_find_value(rigidbodyParts, rb)
		if ((rb_part != shoulders) and rb_part != leftHand and rb_part != rightHand)
			with (rb_part)
				draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale*other.armWeight, image_angle, image_alpha)
	}
}

shader_set(shHueChange) gpu_set_tex_filter(0)
var sh_alpha = contMain.uni_hueChange_alpha
var sh_active = contMain.uni_hueChange_active
var ds_size = ds_list_size(rigidbodyParts)
for (var rb = 0; rb < ds_size; rb++) {
	var rb_part = ds_list_find_value(rigidbodyParts, rb)
		
	if (rb_part != shoulders and rb_part != leftHand and rb_part != rightHand) {			
		with (rb_part) {
			if (sprite_index == sprArm or sprite_index == sprFrontArm)
				shader_set_uniform_f(sh_active, 0.0)
			else
				shader_set_uniform_f(sh_active, global.clothesStyle)
			shader_set_uniform_f(sh_alpha, image_alpha*aalpha)
				
			draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale*other.armWeight, image_angle, other.image_blend, image_alpha*aalpha)
		}
			
		if (invisibility) {
			var dis = contMain.period/1.5+3
			var size = other.image_xscale+0.12+contMain.period/120
			with (rb_part)
				draw_sprite_ext(sprite_index, -1, x+lengthdir_x(dis, dir), y+lengthdir_y(dis, dir), image_xscale*size, image_yscale*size, image_angle, c_white, image_alpha/3)
		}
	}
}
shader_reset() gpu_set_tex_filter(1)

with (leftHand) {
	draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha*aalpha)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, other.image_blend, image_alpha*aalpha)
}

with (rightHand) {
	draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha*aalpha)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, other.image_blend, image_alpha*aalpha)
}
		
var breathScale = 0.96+contMain.period/240
with (shoulders) {
	draw_outline_low(sprite_index, -1, x, y, breathScale*image_xscale_new, breathScale*image_yscale_new, image_angle, aalpha)
	
	shader_set(shHueChange)
	var sh_alpha = contMain.uni_hueChange_alpha
	var sh_active = contMain.uni_hueChange_active
	shader_set_uniform_f(sh_alpha, aalpha)
	shader_set_uniform_f(sh_active, global.clothesStyle)
	draw_sprite_ext(sprite_index, -1, x, y, breathScale*image_xscale_new, breathScale*image_yscale_new, image_angle, other.image_blend, aalpha)
	shader_reset()
	
	if (other.shiningPower) {
		shader_set(shHueChange_plusBright)
		var sh_alpha = contMain.uni_hueChange_plusBright_alpha
		var sh_active = contMain.uni_hueChange_plusBright_active
		shader_set_uniform_f(sh_alpha, contMain.period/(17-other.shiningPower*6)*aalpha)
		shader_set_uniform_f(sh_active, global.clothesStyle)
		draw_sprite_ext(sprite_index, -1, x, y, breathScale*image_xscale_new, breathScale*image_yscale_new, image_angle, other.image_blend, 0)
		shader_reset()
	}
}

draw_outline_low(sprite_index, -1, x, y, image_xscale_new, image_yscale_new, image_angle, aalpha)
draw_sprite_ext(sprite_index, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_blend, aalpha)

draw_outline_low(global.hair, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_alpha, aalpha)
draw_sprite_ext(global.hair, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_blend, aalpha)

if (invisibility) {	
	var dis = contMain.period/1.5+3
	var size = image_xscale+0.12+contMain.period/120
	
	draw_sprite_ext(sprite_index, -1, x+lengthdir_x(dis, dir), y+lengthdir_y(dis, dir), size, size, image_angle, c_white, image_alpha/4)
	draw_sprite_ext(global.hair, -1, x+lengthdir_x(dis, dir), y+lengthdir_y(dis, dir), size, size, image_angle, c_white, image_alpha/3)
}

if (global.itemSelected != -1
and (global.itemSelected.type == type_clothes or global.itemSelected.type == type_mweapon or global.itemSelected.type == type_sweapon or global.itemSelected.type == type_necklace
or global.itemSelected.type == type_medallion or global.itemSelected.type == type_potion or global.itemSelected.type == type_pet or global.itemSelected.type == type_challengeItem)
and (global.itemSelected.from == window_items and global.itemSelected.itemLevel/*-2*/ <= global.level and (global.itemSelected.isDeletable or global.itemSelected.isForQuest == false or global.itemSelected.type == type_potion)))
	draw_highlight()