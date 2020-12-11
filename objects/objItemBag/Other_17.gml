for (i = 0; i < horizontalBoxCount; i++) {
    for (j = 0; j < verticalBoxCount+5*(i == 0); j++) {
        if (compare_item[i, j] != -1)
            instance_destroy(compare_item[i, j])
	}
}