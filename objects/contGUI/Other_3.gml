ds_list_destroy(fixedMessageW)
ds_list_destroy(fixedMessageH)
ds_list_destroy(redDirectionArrows)
ds_list_destroy(blueDirectionArrows)
ds_list_destroy(greenDirectionArrows)
ds_list_destroy(yellowDirectionArrows)

if (findPath != pointer_null) {
	path_delete(findPath)
	findPath = pointer_null
	findPath_alpha = 0
	findPath_x = 0
	findPath_y = 0
}

if (arrowPath != pointer_null) {
	path_delete(arrowPath)
	arrowPath = pointer_null
	arrowPath_alpha = 0
	arrowPath_x = 0
	arrowPath_y = 0
	arrowPath_color = c_red
}