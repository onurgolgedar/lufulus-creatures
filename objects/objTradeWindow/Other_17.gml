for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (compare_item[i, j] != -1)
            instance_destroy(compare_item[i, j])
	}
}