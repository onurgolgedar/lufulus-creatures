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

/*global.virtual_str = 0
global.virtual_dex = 0
global.virtual_vit = 0
global.virtual_mp = 0
global.virtual_sta = 0
global.virtual_stat_points = global.statPoints*/