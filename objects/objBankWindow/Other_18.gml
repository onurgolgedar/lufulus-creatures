bankItems_totalActivatedRent = 0
bankItems_totalPotentialRent = 0
for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
	for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		if (item[i, j] != -1) {
			with (item[i, j]) {
				var revenue = floor(cWorth*BANK_RENT_RATIO*(1+(type == type_valuable)))
				
				if (get_day()-global.itemRentTime_bank[i, j] >= 2) {
					other.bankItems_totalActivatedRent += revenue
					other.bankItems_totalPotentialRent += revenue
				}
				else
					other.bankItems_totalPotentialRent += revenue
			}
		}
	}
}

var baseActivated = bankItems_totalActivatedRent
var basePotential = bankItems_totalPotentialRent
for (var i = 1; i <= global.bagMaxPage; i++) {
	var isEmptyPage = is_page_empty_bank(i)
	bankItems_totalActivatedRent += isEmptyPage*(baseActivated*BANK_EMPTYPAGEBONUS_RATIO)
	bankItems_totalPotentialRent += isEmptyPage*(basePotential*BANK_EMPTYPAGEBONUS_RATIO)
}

bankItems_totalActivatedRent = floor(bankItems_totalActivatedRent)
bankItems_totalPotentialRent = floor(bankItems_totalPotentialRent)