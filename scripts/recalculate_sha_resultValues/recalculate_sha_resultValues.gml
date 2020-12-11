function recalculate_sha_resultValues() {
	return sha1_string_utf8(string(global.physicalPower)+" "+
							string(global.magicalPower)+" "+
							string(global.criticalChance)+" "+
							string(global.movementSpeed)+" "+
							string(global.attackSpeed)+" "+
							string(global.armor)+" "+
							string(global.resistance)+" "+
							string(global.maxMana)+" "+
							string(global.maxHp)+" "+
							string(global.str)+" "+
							string(global.dex)+" "+
							string(global.vit)+" "+
							string(global.mp)+" "+
							string(global.sta)+" "+
							string(global.criticalFactor)+" "+
						 	string(global.damageReduction))


}
