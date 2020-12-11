with (objPlayer.rightHand) {
	other.mWeapon = instance_create(x+lengthdir_x(10, image_angle), y+lengthdir_y(10, image_angle), objMWeapon)
    other.mWeapon.phy_rotation = target*side+owner.phy_rotation-70+7
	other.mWeapon.sprite_index = global.weaponSprite
}

upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
shiningPower = (upgrade > 5)+(upgrade > 7)

with (mWeapon) {
	joint = physics_joint_revolute_create(objPlayer.rightHand, id, x, y, 0, 0, 1, 0, 0, 0, 0)
	upgrade = other.upgrade
	shiningPower = other.shiningPower
}