ai_protectors_add(inst_50943B63)
ai_protectors_add(inst_5E135158)
ai_protectors_add(inst_47D0305D)

name = eng() ? "Master Warrior" : "Usta Savaşçı"

shoulders.sprite_index = sprClothes6_npc
hair = sprHair10
weapon = sprSw_010D_2

attackSpeed += 0.15
attacktimer_set_max()
maxHp = round(1.1*maxHp)
hp = maxHp
armor += 10
resistance += 10
spd += 1
physicalPower += 70

/*var tutorialBox = tutorial_box_owned("", eng() ? "Guardian of the Lord\nLords always have a skillful\nguard." : "Lord'un Gardiyanı\nLord'ların yanında her zaman\nyetenekli bir savaşçı bulunur.", id, -85, 0, 4)
if (tutorialBox != pointer_null) {
	tutorialBox.owner_onGUI = false
	tutorialBox.image_xscale = 0.85
	tutorialBox.image_yscale = tutorialBox.image_xscale
}*/