event_inherited()

minDepth = 999

with (parWindow) {
    if (depth < other.depth)
        depth += 2
        
    if (id != other.id and depth < other.minDepth)
        other.minDepth = depth
}

with (parWindow) {
    if (depth == other.minDepth)
        front = true
}

if (global.itemSelected != -1 and global.itemSelected.from == window_bank)
    global.itemSelected = -1
	
event_perform(ev_other, ev_user5)
event_perform(ev_other, ev_user4)

objPlayer.viewLock = false