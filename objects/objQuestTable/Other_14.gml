if (global.itemSelected != -1 and global.itemSelected.from == window_quests) {
	global.itemSelected = -1
}

with (objMessageBox) {
	if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == parQuest and owner.from == window_quests)
		close_window()
}

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1) {
            instance_destroy(item[i, j])
		}
	}
}

with (parQuest) {
    if (owner == other.id) {
        instance_destroy()
	}
}

