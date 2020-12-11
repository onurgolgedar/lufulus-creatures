function recalculate_sha_adds() {
	return sha1_string_utf8(string(global.add_physicalPower)+" "+
							string(global.add_magicalPower)+" "+
							string(global.add_speed)+" "+
							string(global.add_attackSpeed)+" "+
							string(global.add_criticalChance)+" "+
							string(global.add_maxHp)+" "+
							string(global.add_maxMana)+" "+
						 	string(global.add_expRatio))


}
