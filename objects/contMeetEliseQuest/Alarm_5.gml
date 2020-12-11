if (!is_outfight() or (danger > 0 and danger < dangerLimit)) {
	with (parCreature) {
		if (mode == md_calm and irandom(30-other.danger) == 0 and !boss) {
			other.danger++
			ai_reaction(choose(objPlayer.id, objElise_npc.id, objElise_npc.id))
			break
		}
	}
	
	if (danger >= dangerLimit) {
		fm_delete(11)
		fm_add(17, true)
		danger = dangerLimit
	}
}

if (followLight == pointer_null and danger < dangerLimit)
	delta_alarm(5, irandom_range(sec*2, sec*2.3))