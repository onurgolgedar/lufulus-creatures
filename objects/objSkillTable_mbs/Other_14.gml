if (global.itemSelected != -1 and global.itemSelected.from == window_skills) {
	global.itemSelected = -1
}

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1) {
            instance_destroy(item[i, j])
		}
	}
}
            
with (parSkill) {
    if (owner == other.id) {
        instance_destroy()
	}
}