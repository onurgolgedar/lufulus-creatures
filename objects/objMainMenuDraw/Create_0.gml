audio_stop_sound(sndMusicCastle)
audio_stop_sound(sndMusicClassic_calm)
audio_stop_sound(sndMusicBoss)

alarm[0] = 1
alarm[1] = 15
delta_alarm(5, sec/2)
alarm[6] = 1

image_alpha = 0
blackScreenAlpha = 1

tab_index = 0

alarm[2] = 3

mouseOn_light = false
mouseOn_fullscreen = false
mouseOn_pixelQuality[0] = false
mouseOn_pixelQuality[1] = false
mouseOn_pixelQuality[2] = false
mouseOn_performanceMode[0] = false
mouseOn_performanceMode[1] = false
mouseOn_performanceMode[2] = false
mouseOn_performanceMode[3] = false
mouseOn_guiSize[0] = false
mouseOn_guiSize[1] = false
mouseOn_guiSize[2] = false
mouseOn_guiSize[3] = false
mouseOn_turkish = false
mouseOn_vs = false
mouseOn_triangle = -1
displayRefreshRate = 60

for (var i = 0; i < 7; i++)
	mouseOn_fpsChoice[i] = false
global.fpsValue[0] = 30
global.fpsValue[1] = 50
global.fpsValue[2] = 60
global.fpsValue[3] = 75
global.fpsValue[4] = 120
global.fpsValue[5] = 144
global.fpsValue[6] = 240

event_perform(ev_other, ev_user0)

cl = make_color_rgb(188, 117, 50)
cl_dark = make_color_rgb(100, 57, 17)
mouseHoldOn_triangle = -1
global_tab = false

global.graphicsCard = "---"
var os_map = os_get_info()
if (os_type == os_windows and os_map != -1) {
   global.graphicsCard = ds_map_find_value(os_map, "video_adapter_description")
   ds_map_destroy(os_map)
}

showGPUWarning = string_count("RTX", global.graphicsCard) == 0 and
string_count("Rtx", global.graphicsCard) == 0 and
string_count("GTX", global.graphicsCard) == 0 and
string_count("Gtx", global.graphicsCard) == 0 and
string_count("NVIDIA", global.graphicsCard) == 0 and
string_count("Nvidia", global.graphicsCard) == 0 and
string_count("NVidia", global.graphicsCard) == 0 and
string_count("GeForce", global.graphicsCard) == 0 and
string_count("GEFORCE", global.graphicsCard) == 0 and
string_count("VEGA", global.graphicsCard) == 0 and
string_count("Vega", global.graphicsCard) == 0 and
string_count("RADEON", global.graphicsCard) == 0 and
string_count("GT", global.graphicsCard) == 0 and
string_count("Radeon", global.graphicsCard) == 0
alarm[4] = 1