size = 1.15
bonusSize = 0.8
objPlayer.viewLock = true
blackScreenMode = false

upTextBox_alpha = 0
bottomTextBox_alpha = 0

tab_index = 0

location_lastSelected = pointer_null
travelButton_alpha = 0
travelX = x+228
travelY = y-175+40*IS_MOBILE
travelX2 = x+379
travelY2 = y-125+40*IS_MOBILE
locations = ds_list_create()
locations_x = ds_list_create()
locations_y = ds_list_create()

fm_activate(8)

if (room != roomRoad and room != roomBeforeRoad) {
	ds_list_add(locations, locHawmgrad)
	ds_list_add(locations_x, -80)
	ds_list_add(locations_y, -37)
	
	ds_list_add(locations, locHawmgradsPlain)
	ds_list_add(locations_x, -31)
	ds_list_add(locations_y, -47)
}

ds_list_add(locations, locBelingfur)
ds_list_add(locations_x, 326)
ds_list_add(locations_y, 60)

ds_list_add(locations, locLerinForest)
ds_list_add(locations_x, 21)
ds_list_add(locations_y, -37)
ds_list_add(locations, locLerinForest2)
ds_list_add(locations_x, 77)
ds_list_add(locations_y, -42)
ds_list_add(locations, locFurtherLerin)
ds_list_add(locations_x, 130)
ds_list_add(locations_y, -64)
ds_list_add(locations, locBlueCave)
ds_list_add(locations_x, 195)
ds_list_add(locations_y, -85)
ds_list_add(locations, locGiantDesert)
ds_list_add(locations_x, -120)
ds_list_add(locations_y, 5)
ds_list_add(locations, lociceCage)
ds_list_add(locations_x, 315)
ds_list_add(locations_y, -5)
ds_list_add(locations, locSoulLand)
ds_list_add(locations_x, -23)
ds_list_add(locations_y, 65)
ds_list_add(locations, locPinkyForest)
ds_list_add(locations_x, -55)
ds_list_add(locations_y, 120)
ds_list_add(locations, locCompassionLands)
ds_list_add(locations_x, -110)
ds_list_add(locations_y, 160)
ds_list_add(locations, locMagicalPlants)
ds_list_add(locations_x, -341)
ds_list_add(locations_y, -124)
if (ds_list_find_index(global.takenBosses, object_get_name(objLufulus)) == -1 and is_quest_finished(objQuest_theyAreRight)) {
	ds_list_add(locations, locLufulus)
	ds_list_add(locations_x, -305)
	ds_list_add(locations_y, -179)
}
ds_list_add(locations, locWave)
ds_list_add(locations_x, 35)
ds_list_add(locations_y, -120)
ds_list_add(locations, locWave2)
ds_list_add(locations_x, 163)
ds_list_add(locations_y, -155)
ds_list_add(locations, locWave3)
ds_list_add(locations_x, -120)
ds_list_add(locations_y, -178)
ds_list_add(locations, locWave4)
ds_list_add(locations_x, -181)
ds_list_add(locations_y, -104)

for (var i = 0; i < ds_list_size(locations); i++) {
	var loc = instance_create_layer(ds_list_find_value(locations_x, i), ds_list_find_value(locations_y, i), "lyNirvana", ds_list_find_value(locations, i))
	loc.depth = depth-10
	ds_list_replace(locations, i, loc)
}

for (var i = 0; i < 40; i++) {
	if (global.quest[i] != -1) {
		var que = instance_create(-50, -50, global.quest[i])
		with (que) {
			with (parLocation) {
				if (name == other.targetLocation and global.questScore[i] != global.questMaxScore[i]) {
					if (!hasQuest)
						hasQuest = ds_list_create()
					 
					ds_list_add(hasQuest, other.targetLocation)
				}
			
				if (name == other.givenLocation and global.questScore[i] == global.questMaxScore[i]) {
					if (!hasFinished)
						hasFinished = ds_list_create()
					 
					ds_list_add(hasFinished, other.givenLocation)
				}
			}
		}
		instance_destroy(que)
	}
}

var ds_size = ds_list_size(global.allQuests)
for (var i = 0; i < ds_size; i++) {
	// ? all repeatable quests shown as not repeatable on map (one complete no red indicator anymore)
	var q = ds_list_find_value(global.allQuests, i)
	
	if (is_quest_available(q, false)) {
		var qInst = instance_create(-50, -50, q)
		with (qInst) {
			with (parLocation) {
				if (name == other.givenLocation) {
					if (!hasPossibleQuest)
						hasPossibleQuest = ds_list_create()
					 
					ds_list_add(hasPossibleQuest, other.givenLocation)
				}
			}
		}
		instance_destroy(qInst)
	}
}

locationsSorted = ds_list_create()

var locationsCopy = ds_list_create()
ds_list_copy(locationsCopy, locations)

var tab_index_id = pointer_null

while (ds_list_size(locationsCopy) != 0) {
	var minX = 10000
	var minLocation = pointer_null
	for (var i = 0; i < ds_list_size(locationsCopy); i++) {
		with (ds_list_find_value(locationsCopy, i)) {
			if (x < minX) {
				minX = x
				minLocation = id
				
				if (object_index == locHawmgrad)
					tab_index_id = id
			}
		}
	}
	
	ds_list_add(locationsSorted, minLocation)
	ds_list_delete(locationsCopy, ds_list_find_index(locationsCopy, minLocation))
}

ds_list_destroy(locationsCopy)

with (parLocation) {
	if (point_index == 4) {
		infoText = !eng() ? "Lufulus diğer saldırgan yaratıklarla beraber\nbu bölgede bulunuyor." : "Lufulus coexists with other aggressive creatures\nin this area."
	}
	else if (is_castle(roomIndex)) {
		infoText = !eng() ? "Kalelerde ticaret yapabilir, görevler alabilirsin.\nKullanmadığın eşyalarını bir kaledeki bir satıcıya\nsatabilirsin veya direkt parçalayabilirsin."
		: "You can trade in castles, and take missions.\nYou can sell your unused items to a seller\nin a castle or you can dismantle it directly."
	}
	else if (point_index == 0) {
		if (ds_list_find_index(global.destroyedMaps, roomIndex) == -1) {
			infoText = !eng() ? "Bu bölge bir yaratık bölgesidir. Bölgenin seviyesi ne kadar\nyüksekse yaratıklardan o kadar kaliteli ganimet bulunur.\nLider yaratıklarda daha iyi ganimet bulunur.\nLufulus'un zihinleri de bu bölgede bulunur."
			: "This is a spawn area. The higher the level of the\nregion, the better quality loot from the creatures.\nLeader creatures have better loot.\nThere is a Lufulus' Wisdom in this area."
		}
		else {
			infoText = !eng() ? "Bu bölgedeki Lufulus Zihnini yok ettin.\nDolayısıyla bölgede önceki halinden daha çok\nlider yaratık bulunuyor."
			: "You destroyed Lufulus' Wisdom in that area.\nThere are more leader creatures than before."
		}
	}
	else if (point_index == 1) {
		if (ds_list_find_index(global.destroyedMaps, roomIndex) == -1) {
			infoText = !eng() ? "Bu bölge yaratık dalgası bölgesidir. Bölgede giderek\nzorlaşan yaratık saldırılarına maruz kalırsın.\nDaha önce öldürülmemişse, son dalgada bölgenin kaptan\nyaratığı saldırır. Kaptan yaratık gelişmiş ganimet kazandırır."
			: "This region is a creature wave region.\nYou are exposed to increasingly difficult creature\nattacks in the region. In the last wave, if not killed before,\nthe captain attacks. Captain creature grants improved loot."
		}
		else {
			infoText = !eng() ? "Bu bölgenin artık kaptanı yoktur.\nDalgalar eskisine göre 2 kat zorlaşmıştır\nancak iki kat daha fazla tecrübe kazandırır."
			: "This region no longer has a captain.\nThe waves have been 2 times harder than before,\nbut they give twice as much experience."
		}
	}
}

tab_index = ds_list_find_index(locationsSorted, tab_index_id)

fm_delete(8)

delta_alarm(3, sec/10)
delta_alarm(4, sec/20)
alarm[2] = 3

var tutorialBox = tutorial_box_owned(eng() ? "Travelling" : "Gezinti", eng() ? "Travelling\n"+(IS_MOBILE ? "Tap" : "Click")+" unlocked locations to travel.\nBy leveling up, new places will\nbe unlocked." : "Gezinti\nKilitsiz bölgelere üzerine "+(IS_MOBILE ? "dokunarak" : "tıklayarak")+"\ngidebilirsin. Seviye atladıkça yeni\nbölgeler açılacaktır.", id, 290+120*IS_MOBILE, -154+43*IS_MOBILE, 8)
if (tutorialBox != pointer_null) {
	tutorialBox.offset_y -= 180-200*IS_MOBILE
	tutorialBox.offset_x -= 115*IS_MOBILE
}