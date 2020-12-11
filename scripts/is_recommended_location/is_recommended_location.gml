function is_recommended_location() {
	return global.level > level+1 and global.level < level+4 or global.level < 3 and level == 1 and !is_castle(roomIndex)


}
