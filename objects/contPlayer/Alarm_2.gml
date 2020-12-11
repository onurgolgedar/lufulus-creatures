with (objPlayer) {
	if (hp < maxHp)
		change_hp(maxHp/25)
		
	if (mana < maxMana)
		change_mana(maxMana/25/3)
}
		
delta_alarm(2, round(7*sec/25))