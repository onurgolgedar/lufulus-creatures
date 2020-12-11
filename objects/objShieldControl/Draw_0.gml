if (owner.noArms and global.weaponSprite != sprTorch)
	exit

var dis
var addAngle
var originObj

if (global.weaponSprite != sprTorch) {
	dis = 25
	addAngle = 86
	originObj = objPlayer.leftArm[1]
}
else {
	dis = 11
	addAngle = 0
	originObj = objPlayer.leftHand
}

with (originObj) {
	var xx = x+lengthdir_x(dis, image_angle)
	var yy = y+lengthdir_y(dis, image_angle)
	var aangle = -target*side-owner.phy_rotation+addAngle
	var aalpha = image_alpha/(1+2*objPlayer.invisibility)

	draw_outline(global.weaponSprite, -1, xx, yy,  image_xscale, image_yscale, aangle, aalpha)
	
	draw_sprite_ext(global.weaponSprite, -1, xx, yy,  image_xscale, image_yscale, aangle, image_blend, aalpha)
	
	if (other.shiningPower) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.18+contMain.period/(30-other.shiningPower*10))*aalpha)

		draw_sprite_ext(global.weaponSprite, -1, xx, yy, image_xscale, image_yscale, aangle, c_white, 0)
		shader_reset()
	}
}