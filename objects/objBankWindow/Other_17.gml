for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (var j = 0; j < verticalBoxCount; j++) {
        if (compare_item[i, j] != -1)
            instance_destroy(compare_item[i, j])
	}
}