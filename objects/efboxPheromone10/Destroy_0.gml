event_inherited()

with (parCreature) {
	if (point_distance(other.owner.x, other.owner.y, x, y) < 1500 and mode == md_calm and !isLeader_hard and !boss and type != type_wisdom) {
		bonusExperienceRate += 0.1
		recalculate_creature_experience_values()
		
		ai_reaction(other.owner.id)
	}
}