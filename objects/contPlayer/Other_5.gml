global.givenStr += global.virtual_str
global.givenDex += global.virtual_dex
global.givenVit += global.virtual_vit
global.givenMp += global.virtual_mp
global.givenSta += global.virtual_sta
global.statPoints = global.virtual_stat_points
			
global.virtual_str = 0
global.virtual_dex = 0
global.virtual_vit = 0
global.virtual_mp = 0
global.virtual_sta = 0
update_character()

global.anticheat_stats = recalculate_sha_stats()
			
save_stats(global.saveNo)