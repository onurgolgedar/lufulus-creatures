if (object_index == objHealUp or object_index == objManaUp)
	value *= (1+0.5*extension_exists(ext_plus_upgrade))
else if (object_index == objBroccoli)
	value *= (1+extension_exists(ext_broccoli_recovery))

value = round(value)

base_scale = image_xscale
image_xscale = 0.3*base_scale
image_yscale = 0.3*base_scale

if (object_index == objHealUp) {
	text = eng() ? (string(ceil(value/global.maxHp*100))+"% HP") : ("%"+string(ceil(value/global.maxHp*100))+" can")
	textColor = c_lime
}
else if (object_index == objManaUp) {
	text = eng() ? (string(ceil(value/global.maxMana*100))+"% mana") : ("%"+string(ceil(value/global.maxMana*100))+" mana")
	textColor = c_blue
}