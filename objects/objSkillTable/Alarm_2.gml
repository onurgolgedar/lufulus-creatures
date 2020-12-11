for (i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1) {
			with (item[i, j])
				event_perform(ev_other, ev_user2)
		}
	}
}

alarm[2] = 5