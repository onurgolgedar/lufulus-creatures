if (os_type == os_windows)
	ExecuteShell("RefreshRateLogger.exe", false)
	
if (IS_MOBILE)
	gesture_drag_time(2)

global.mainFont = fontMain
draw_set_font(global.mainFont)

global.showGUI = true
global.selectTarget_mode = false
global.mouseControl = true

global.steamID = steam_initialised() ? steam_get_user_steam_id() : "Local Saves (Non-Steam)"
global.steamScore = "???"
global.steamRank = "?"
steam_leaderboard_upload_id = -1
steam_leaderboard_download_id = -1

global.newLoot = false
global.bagBoxCount_horizontal = 6
global.bagBoxCount_vertical = 5
global.bagMaxPage = 3
global.tradeBoxCount_horizontal = 6
global.tradeBoxCount_vertical = 4
global.tradeMaxPage = 2

global.questTargetObjects = ds_list_create()
global.fixedMessages = ds_list_create()
global.fixedMessageNos = ds_list_create()
global.fixedMessageActivations = ds_list_create()
global.takenTutorials = ds_list_create()
global.takenLootboxes = ds_list_create()
global.takenBosses = ds_list_create()
global.destroyedMaps = ds_list_create()
global.goldTaken_creature = ds_map_create()

global.gameChoices = ds_list_create()
repeat (20)
	ds_list_add(global.gameChoices, -1)

global.maxCreatureScore = 0
global.debt = 0
global.debtCount = 0
global.debtPayingTime = -1
global.levels_withoutDying_rewardCount = 0
global.bankRentMessage_value = 0
global.recruitText = ""
global.selectedTarget = pointer_null
global.rentGold = 0
global.defenseLock = true
global.gameTime = 0
global.totalHours = 1
global.gamepad = -1
global.gamepad_active = false//IS_MOBILE
global.cinematicIndex = 0
global.isCheated = false
global.useHardwareCursor = false
global.cursorSprite = sprCursor
global.cursorIndex = 0
global.drawCursor = false

global.camera = view_get_camera(0)
audio_listener_orientation(0, 0, 1, 0, -1, 0)
audio_falloff_set_model(audio_falloff_exponent_distance_clamped)

global.performanceMode = 2
global.language = steam_initialised() ? (string_lower(steam_current_game_language()) == "turkish" ? lang_turkish : lang_english) : lang_english
global.graphicsCard = "Unknown"
global.canChangeVsync = true
global.averageFPS = IS_MOBILE ? 30 : 60
global.spawnFreq = 0
global.availableQuestsCount = 0
global.lastWeaponChoice = 0
global.performanceOutFidelty = 6-IS_MOBILE*2
global.audio_gain_music = 0.75
global.audio_gain_nonmusic = 1
global.musicStopped = false
global.lightActive = false
global.verticalSync = false
global.halfFPS_warning = false
global.manualRefreshRate_mode = false
global.fastPhysicsSync_mode = false
global.physics_world_speed = 0
global.antiCheat_forSaveFiles = true
global.gpuControlProblem = false

#region SAVING
global.grid_item = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemActive = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemUpgrade = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemExtension[0] = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemExtension[1] = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemCount = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_skillUpgrade = ds_grid_create(30, 3)
global.grid_item_bank = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemUpgrade_bank = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemExtension_bank[0] = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemExtension_bank[1] = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemCount_bank = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)
global.grid_itemRentTime_bank = ds_grid_create(global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical)

global.list_quest = ds_list_create()
global.list_questScore = ds_list_create()
global.list_selectedSkill = ds_list_create()

global.saveNo = "0"
global.noSave_mode = false
#endregion
#region ALL REAL QUESTS [ADD HERE]
global.allQuests = ds_list_create()
ds_list_add(global.allQuests, objQuestRoad_scout)
ds_list_add(global.allQuests, objQuestRoad_scout2)
ds_list_add(global.allQuests, objQuest_meetSenior)
ds_list_add(global.allQuests, objQuest_mineralCave)
ds_list_add(global.allQuests, objQuest_cunning)
ds_list_add(global.allQuests, objQuest_blacksmith)
ds_list_add(global.allQuests, objQuest_blacksmith2)
ds_list_add(global.allQuests, objQuest_lordLoves)
ds_list_add(global.allQuests, objQuest_firstFight)
ds_list_add(global.allQuests, objQuest_bloodMineral)
ds_list_add(global.allQuests, objQuest_bloodMineral_2)
ds_list_add(global.allQuests, objQuest_trustProblems)
ds_list_add(global.allQuests, objQuest_meetElise)
ds_list_add(global.allQuests, objQuest_rebelWar)
ds_list_add(global.allQuests, objQuest_broccoli)
ds_list_add(global.allQuests, objQuest_runes_prep)
ds_list_add(global.allQuests, objQuest_rebelWar2)
ds_list_add(global.allQuests, objQuest_theyAreRight)

ds_list_add(global.allQuests, objQuest_rival)
ds_list_add(global.allQuests, objQuest_item)
ds_list_add(global.allQuests, objQuest_rival2)
ds_list_add(global.allQuests, objQuest_rival3)
ds_list_add(global.allQuests, objQuest_rival4)
ds_list_add(global.allQuests, objQuest_wave)
ds_list_add(global.allQuests, objQuest_rival5)
ds_list_add(global.allQuests, objQuest_wisdom)
ds_list_add(global.allQuests, objQuest_rival6)
ds_list_add(global.allQuests, objQuest_rival7)
ds_list_add(global.allQuests, objQuest_rival8)
ds_list_add(global.allQuests, objQuest_rival9)
#endregion
#region NORMAL DROPS [ADD HERE]
global.normalDrops = ds_list_create()
global.normalDrops_levels = ds_list_create()

define_normal_drop(objSw_001)
define_normal_drop(objSw_002)
define_normal_drop(objSw_003)
define_normal_drop(objSw_004)
define_normal_drop(objSw_005)
define_normal_drop(objSw_006)
define_normal_drop(objSw_007)
define_normal_drop(objSw_008)
define_normal_drop(objSw_009)
define_normal_drop(objSw_010)
define_normal_drop(objSw_011)
define_normal_drop(objSw_012)
define_normal_drop(objSw_013)
define_normal_drop(objSw_014)
define_normal_drop(objSw_015)
define_normal_drop(objSw_016)

define_normal_drop(objSw_001C)
define_normal_drop(objSw_002C)

define_normal_drop(objSw_001D)
define_normal_drop(objSw_002D)
define_normal_drop(objSw_003D)
define_normal_drop(objSw_004D)
define_normal_drop(objSw_004D_2)
define_normal_drop(objSw_005D)
define_normal_drop(objSw_006D)
define_normal_drop(objSw_006D_2)
define_normal_drop(objSw_006D_3)
define_normal_drop(objSw_007D)
define_normal_drop(objSw_007D_2)
define_normal_drop(objSw_008D)
define_normal_drop(objSw_008D_2)
define_normal_drop(objSw_008D_3)
define_normal_drop(objSw_009D)
define_normal_drop(objSw_009D_2)
define_normal_drop(objSw_010D)
define_normal_drop(objSw_010D_2)
define_normal_drop(objSw_011D)
define_normal_drop(objSw_011D_2)
define_normal_drop(objSw_012D)
define_normal_drop(objSw_014D)

define_normal_drop(objSw_001S)
define_normal_drop(objSw_002S)
define_normal_drop(objSw_003S)
define_normal_drop(objSw_004S)
define_normal_drop(objSw_005S)
define_normal_drop(objSw_006S)

define_normal_drop(objSw_003N)
define_normal_drop(objSw_005N)
define_normal_drop(objSw_007N)
define_normal_drop(objSw_008N)
define_normal_drop(objSw_009N)

define_normal_drop(objClot_002)
define_normal_drop(objClot_003)
define_normal_drop(objClot_004)
define_normal_drop(objClot_005)
define_normal_drop(objClot_006)
define_normal_drop(objClot_007)
define_normal_drop(objClot_008)
define_normal_drop(objClot_009)
define_normal_drop(objClot_010)
define_normal_drop(objClot_011)
define_normal_drop(objClot_012)
define_normal_drop(objClot_013)
define_normal_drop(objClot_014)
define_normal_drop(objClot_015)
define_normal_drop(objClot_016)
define_normal_drop(objClot_017)
define_normal_drop(objClot_018)
define_normal_drop(objClot_019)
define_normal_drop(objClot_020)

define_normal_drop(objCrossbow_001)
define_normal_drop(objCrossbow_002)
define_normal_drop(objCrossbow_003)
define_normal_drop(objCrossbow_004)
define_normal_drop(objCrossbow_005)
define_normal_drop(objCrossbow_006)
define_normal_drop(objCrossbow_007)
define_normal_drop(objCrossbow_008)
define_normal_drop(objCrossbow_009)
define_normal_drop(objCrossbow_010)
define_normal_drop(objCrossbow_011)
define_normal_drop(objCrossbow_012)

define_normal_drop(objCrossbow_001C)
define_normal_drop(objCrossbow_002C)

define_normal_drop(objCrossbow_001D)
define_normal_drop(objCrossbow_002D)
define_normal_drop(objCrossbow_003D)
define_normal_drop(objCrossbow_004D)
define_normal_drop(objCrossbow_005D)
define_normal_drop(objCrossbow_006D)
define_normal_drop(objCrossbow_010D)
define_normal_drop(objCrossbow_011D)
define_normal_drop(objCrossbow_012D)

define_normal_drop(objCrossbow_002N)
define_normal_drop(objCrossbow_003N)
define_normal_drop(objCrossbow_004N)

define_normal_drop(objCrossbow_001S)

define_normal_drop(objNeck_001)
define_normal_drop(objNeck_002)
define_normal_drop(objNeck_003)
define_normal_drop(objNeck_004)
define_normal_drop(objNeck_005)
define_normal_drop(objNeck_006)
define_normal_drop(objNeck_007)
define_normal_drop(objNeck_008)
define_normal_drop(objNeck_009)
define_normal_drop(objNeck_010)
define_normal_drop(objNeck_011)
define_normal_drop(objNeck_012)

define_normal_drop(objNeck_001D)
define_normal_drop(objNeck_002D)
define_normal_drop(objNeck_003D)
define_normal_drop(objNeck_003D_2)
define_normal_drop(objNeck_004D)
define_normal_drop(objNeck_004D_2)
define_normal_drop(objNeck_005D)
define_normal_drop(objNeck_005D_2)
define_normal_drop(objNeck_006D)
define_normal_drop(objNeck_006D_2)
define_normal_drop(objNeck_009D)
define_normal_drop(objNeck_009D_2)
define_normal_drop(objNeck_010D)

define_normal_drop(objNeck_001S)
define_normal_drop(objNeck_002S)
define_normal_drop(objNeck_003S)
define_normal_drop(objNeck_004S)

define_normal_drop(objSh_001)
define_normal_drop(objSh_002)
define_normal_drop(objSh_003)
define_normal_drop(objSh_004)
define_normal_drop(objSh_005)
define_normal_drop(objSh_006)
define_normal_drop(objSh_007)
define_normal_drop(objSh_008)
define_normal_drop(objSh_009)
define_normal_drop(objSh_010)
define_normal_drop(objSh_011)
define_normal_drop(objSh_012)

define_normal_drop(objSh_010D)
define_normal_drop(objSh_012D)

define_normal_drop(objSh_001C)
define_normal_drop(objSh_002C)

define_normal_drop(objSh_003N)
define_normal_drop(objSh_005N)

define_normal_drop(objBow_001)
define_normal_drop(objBow_002)
define_normal_drop(objBow_003)
define_normal_drop(objBow_004)
define_normal_drop(objBow_005)
define_normal_drop(objBow_006)
define_normal_drop(objBow_007)
define_normal_drop(objBow_008)
define_normal_drop(objBow_009)
define_normal_drop(objBow_010)
define_normal_drop(objBow_011)

define_normal_drop(objBow_001C)
define_normal_drop(objBow_002C)

define_normal_drop(objBow_001S)

define_normal_drop(objBow_001D)
define_normal_drop(objBow_002D)
define_normal_drop(objBow_003D)
define_normal_drop(objBow_004D)
define_normal_drop(objBow_005D)
define_normal_drop(objBow_009D)
define_normal_drop(objBow_011D)

define_normal_drop(objBow_004N)
define_normal_drop(objBow_005N)
define_normal_drop(objBow_006N)
#endregion

delta_alarm(0, sec/20)
delta_alarm(10, sec/4)

textbox_surface = create_surface(display_get_gui_width(), display_get_gui_height())
global.minimapSurface = create_surface(1, 1)

// ? (no extension, but correct)
/*
window_set_topmost(true)
windowHasFocus = true
window_set_topmost(false)
*/
windowHasFocus = true

gpu_set_tex_mip_filter(tf_linear)

shader_reset()
uni_drawAqua_alpha = shader_get_uniform(shDraw_aqua, "uni_alpha")
uni_bright_alpha = shader_get_uniform(shBright, "uni_alpha")
uni_hueChange_alpha = shader_get_uniform(shHueChange, "uni_alpha")
uni_hueChange_active = shader_get_uniform(shHueChange, "uni_active")
uni_hueChange_plusBright_alpha = shader_get_uniform(shHueChange_plusBright, "uni_alpha")
uni_hueChange_plusBright_active = shader_get_uniform(shHueChange_plusBright, "uni_active")
lightActive_before = true
arrowDraw_isOn = false
player_goto_x = unique_number
player_goto_y = unique_number
isRoomOut = is_room_out()
isRoomShadowy = is_room_shadowy()
period = 0
screenSave = pointer_null
totalDFPS = 0
totalDFPS_count = 0
directPause_gamepad = false
gamepad_down = 0
gamepad_leftarrow_virtual = false
isActive_skills = false
mouseHoldOn_triangle = -1
mouseOn_triangle = -1
miniMap_width = 1
miniMap_height = 1
gameTime_start = 0
roomName = ""
performWell = false
ignoreAverageFPS = false
qKey = 0
global_tab = false
global_tab_step = false
startTime = 0

audio_group_load(audiogroup_2)
audio_group_load(audiogroup_3)

depth -= 70