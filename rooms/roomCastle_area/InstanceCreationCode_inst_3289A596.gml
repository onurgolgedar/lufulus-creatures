priceRatio = ITEM_PRICE_RATIO

add_item_local(objSh_001, 1)
add_item_local(objSh_002, 1)
add_item_local(objSh_003, 1)
add_item_local(objSh_004, 1)
add_item_local(objSh_005, 1)
add_item_local(objSh_006, 1)
add_item_local(objSh_007, 1)

name = "Yulpas"
tag = eng() ? "Shield Shop" : "Kalkan Satıcısı"

hair = sprHair2_other
shoulders.sprite_index = sprClothes_npc
leftArm[0].sprite_index = sprClothesArm3
rightArm[0].sprite_index = sprClothesArm3

if (!IS_MOBILE) {
	var rightKey = eng() ? (global.gamepad_active ? ("[c="+string(c_white)+"](RT Button)[/c]") : ("[c="+string(c_white)+"](Right Click)[/c]"))
						 : (global.gamepad_active ? ("[c="+string(c_white)+"](RT Tuşu)[/c]") : ("[c="+string(c_white)+"](Sağ Tık)[/c]"))
	var tutorialBox = tutorial_box_owned("", eng() ? "Shields\nIf you lift a shield"+rightKey+", you\ngain extra resistance for ranged attacks." : "Kalkanlar\nKalkanını çekersen"+rightKey+" ek olarak\nmenzilli saldırılara dayanıklılığın artar.", id, 55, 0, 7)
	if (tutorialBox != pointer_null) {
		tutorialBox.owner_onGUI = false
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
	}
}