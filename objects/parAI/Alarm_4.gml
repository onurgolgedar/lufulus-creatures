recalculate_creature_experience_values()

if (experience < global.targetExperience*0.003 and level < global.level-2)
	experience = 0
	
if (is_castle(room) and object_get_parent(object_index) == parNPC)
	experience = 0

if (!death and hasDropList) {
	// ?
	if (room != roomRoad) {
		enrich_droplist(boss)
		drop_items()
	}
}

if (boss) {
	isRightHanded = true
	depth -= 3
}

if (level > global.level+5)
	levelColor = c_red
else if (level > global.level+3)
	levelColor = c_nicered
else if (level > global.level+1)
	levelColor = c_orange
else if (level > global.level-1)
	levelColor = c_yellow
else if (level > global.level-3)
	levelColor = c_green

ai_reset_passives()