ds_list_destroy(global.questTargetObjects)
ds_list_destroy(global.allQuests)

ds_list_destroy(global.normalDrops)
ds_list_destroy(global.normalDrops_levels)

ds_list_destroy(global.fixedMessages)
ds_list_destroy(global.fixedMessageActivations)
ds_list_destroy(global.fixedMessageNos)

ds_grid_destroy(global.grid_item)
ds_grid_destroy(global.grid_itemActive)
ds_grid_destroy(global.grid_itemUpgrade)
ds_grid_destroy(global.grid_itemExtension[0])
ds_grid_destroy(global.grid_itemExtension[1])
ds_grid_destroy(global.grid_itemCount)
ds_grid_destroy(global.grid_skillUpgrade)

ds_list_destroy(global.list_quest)
ds_list_destroy(global.list_questScore)

ds_list_destroy(global.list_selectedSkill)

if (screenSave != pointer_null) {
	free_surface(screenSave)
	screenSave = pointer_null
}