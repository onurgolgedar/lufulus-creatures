mouseOnMLogo = false
mouseOnSLogo = false
mouseOnBLogo = false
mouseOnQLogo = false
mouseOnCLogo = false
mouseOnPauseLogo = false
mouseOnFindButton = false

findPath = pointer_null
findPath_alpha = 0
findPath_x = 0
findPath_y = 0

arrowPath = pointer_null
arrowPath_alpha = 0
arrowPath_x = 0
arrowPath_y = 0
arrowPath_color = c_red

findQuestion = false

selectedSkill_colortime[0] = 0
selectedSkill_colortime[1] = 0
selectedSkill_colortime[2] = 0
selectedSkill_colortime[3] = 0
selectedSkill_colortime[4] = 0

skillText_alpha = 0

tab_index = -1

for (var i = 0; i < 5; i++)
	mouseOnSkillBox[i] = false
	
mouseOnSkillBar = false

hlQLogoColor = c_black
hlQDis = 0
hlCLogoColor = c_black
hlCDis = 0
hlSLogoColor = c_black
hlSDis = 0

fixedMessageW = ds_list_create()
fixedMessageH = ds_list_create()
maxFixedMessageW = 0

redDirectionArrows = ds_list_create()
yellowDirectionArrows = ds_list_create()
greenDirectionArrows = ds_list_create()
blueDirectionArrows = ds_list_create()

deathEffect = c_white

showFPS = false
showArrows = true

qLogoX = -100
bLogoX = -100
cLogoX = -100
sLogoX = -100
mLogoX = -100
pauseLogoX = -100
findButtonX = -100

minute = 5
outFight_alpha = 1
hideSummaryInfo_alpha = 0
colorScreenAlpha = 1
colorScreenColor = c_black
redScreenAlpha = 0
redScreenTarget = 0
redScreenIncrease = 0
joystick_hold_device = -1
joystick_hold = false
joystick_dir = 0
joystick_dis = 0
joystick2_hold_device = -1
joystick2_hold = false
joystick2_dir = 0
joystick2_dis = 0
global_tab = false

textShadow_surface = create_surface(display_get_gui_width(), display_get_gui_height())

qKey = 0

mouseOnArrow = -1

delta_alarm(6, sec/2)