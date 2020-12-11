// Extra awards
	
if (!isFailure) {
}
	
event_inherited()

// Take back the item.
for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		// ? a little bug: may be the player does this quest very late and losts its own item.
        if (global.item[i, j] == objTheLetter) {
			delete_item(i, j)
			exit
		}
    }
}