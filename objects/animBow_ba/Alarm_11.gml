if (!extension_exists(ext_bowSlow))
	slowValue = WEAPON_BOW_SLOWFACTOR//max(WEAPON_BOW_SLOWFACTOR-global.dex/100*(WEAPON_BOW_SLOWFACTOR-1), 1)

owner.slowFactor *= slowValue