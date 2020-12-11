/// @param extensionNo
function extension_exists() {

	return ds_list_find_index(global.activeExtensions, argument[0]) != -1


}
