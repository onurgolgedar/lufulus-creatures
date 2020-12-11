with (objPlayer.rightHand) {
	other.sWeapon = instance_create(x+lengthdir_x(10, image_angle), y+lengthdir_y(10, image_angle), objSWeapon)
    other.sWeapon.phy_rotation = target*side+owner.phy_rotation-70
	other.sWeapon.sprite_index = global.sWeaponSprite
}

upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.sWeaponI, global.sWeaponJ] : 0
shiningPower = (upgrade > 5)+(upgrade > 7)

with (sWeapon) {
	joint = physics_joint_revolute_create(objPlayer.rightHand, id, x, y, 0, 0, 1, 0, 0, 0, 0)
	upgrade = other.upgrade
	shiningPower = other.shiningPower
}