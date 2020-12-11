priceRatio = ITEM_PRICE_RATIO

add_item_local(objSw_000, unique_number+1)
add_item_local(objSw_001, 1)
add_item_local(objSw_002, 1)
add_item_local(objSw_003, 1)
add_item_local(objSw_004, 1)
add_item_local(objSw_005, 1)
add_item_local(objSw_006, 1)
add_item_local(objSw_007, 1)
add_item_local(objSw_008, 1)
add_item_local(objSw_009, 1)
add_item_local(objSw_010, 1)
add_item_local(objNoItem)
add_item_local(objNoItem)

name = "Adam"
tag = eng() ? "Sword Shop" : "Kılıç Satıcısı"

hair = sprHair14
shoulders.sprite_index = sprClothes_npc
leftArm[0].sprite_index = sprClothesArm3
rightArm[0].sprite_index = sprClothesArm3

var tutorialBox = tutorial_box_owned("", eng() ? "Buy Items\nYou will need better items\nto kill stronger creatures." : "Eşya Al\nDaha güçlü yaratıkları öldürmek için\ndaha etkili eşyalara ihtiyaç\nduyacaksın.", id, 55, 0, 6)
if (tutorialBox != pointer_null) {
	tutorialBox.owner_onGUI = false
	tutorialBox.image_xscale = 0.85
	tutorialBox.image_yscale = tutorialBox.image_xscale
}