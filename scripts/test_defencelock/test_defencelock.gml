/// @param id
function test_defencelock() {

	return !global.defenseLock or argument[0].target == objPlayer.id or argument[0].teamNo == team_enemy or argument[0].type != type_npc or argument[0].target != pointer_null and are_they_friends(objPlayer.id, argument[0].target)


}
