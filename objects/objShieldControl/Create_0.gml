tLight = pointer_null
tFire = pointer_null

if (global.weaponSprite == sprTorch) {
	tLight = instance_create_layer(x, y, "lyAir", objTorchLight)
	tLight.owner = id
	
	tFire = instance_create(x, y, efFireTiny)
	tFire.target = tLight
}
	
depth -= 5

ssdestroyer = instance_create(objPlayer.x, objPlayer.y, objShield_sdest)
ssdestroyer.owner = objPlayer.id

owner = objPlayer.id

upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
shiningPower = (upgrade > 5)+(upgrade > 7)