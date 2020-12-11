/// @param level
function calculate_level_exp() {

	var unitExp = calculate_creature_exp(argument[0])
	var level = argument[0]
	var levelFactor = 1+clamp(level/(4.4+IS_MOBILE*0.2), 0, 6)

	var unitCount = 14-IS_MOBILE+level*levelFactor

	return floor(unitExp*unitCount)


}
