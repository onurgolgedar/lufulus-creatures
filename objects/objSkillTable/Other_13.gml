for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxEdge+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(offset_yTop+(j+1/2)*boxEdge+(boxBetween+boxBetween_additionalV)*j)
        
        if (i < horizontalBoxCount*(maxPage-1) and global.skillObject[i, j] != -1 and isActive and !(i == 15 and j < 3)) {
            item[i, j] = instance_create(x+box_x[i, j], y+box_y[i, j], global.skillObject[i, j])
            item[i, j].from = window_skills
            item[i, j].i = i
            item[i, j].j = j
            item[i, j].depth = depth-5
            item[i, j].upgrade = global.skillUpgrade[i, j]
            item[i, j].owner = id
        }
        else 
            item[i, j] = -1
    }
}