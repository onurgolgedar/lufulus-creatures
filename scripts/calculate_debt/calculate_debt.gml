/// @param debtCount_taken
function calculate_debt() {

	var debtCount = global.debtCount
	if (argument_count > 0)
		debtCount = argument[0]

	var debt = floor((90+global.level*5+debtCount*35)*(100+power(debtCount, 1.6)*(7.5+global.level/20))/100)

	for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
		for (var j = 0; j < global.bagBoxCount_vertical; j++) {
			if (global.item_bank[i, j] != -1) {
				var itemInstance = instance_create(-50, -50, global.item_bank[i, j])
				
				with (itemInstance) {
					item_self_calculate()
					debt += floor(cWorth/2)
				}
				
				instance_destroy(itemInstance)
			}
		}
	}

	return debt


}
