init_target_statistics()

type = type_wisdom
subtype = pointer_null
name = eng() ? "Lufulus' Wisdom" : "Lufulus'un Bilinci"

range = 0
spd = 0
forceFactor = 0
dashPower = 0
combatExperience = 100

level = room
money = 0

level_wisdom = room_get_level(room)+8
tauntCreatureCount = 14

maxHp = 500
attackSpeed = 0
physicalPower = 0
armor = 65
resistance = 65

baseBonusExperienceRate = 0
event_inherited()

init_droplist()

image_alpha = 0
boss = true

efColor1 = c_white
efColor2 = c_white
efColor3 = c_white

bright = pointer_null
spawnHeart_effect = pointer_null
tauntTimer = 15
fullHpCounter = 0

tutorialBox = tutorial_box_owned("", eng() ? "Lufulus' Wisdom\nThis spell means that Lufulus took over this area.\nIf it is destroyed, only the leading creatures will\ncome to the region and you gain two stat points.\nLeading creatures may drop better items."
									 : "Lufulus'un Bilinci\nBu büyü bu bölgeyi Lufulus'un ele geçirdiği anlamına gelir.\nYok edilirse bölgeye daha çok lider yaratık gelir ve iki gelişim\npuanı kazanırsın. Lider yaratıklar daha iyi eşyalar düşürürler."
									 , id, 105, 0, 21)
if (tutorialBox != pointer_null) {
	tutorialBox.owner_onGUI = false
	tutorialBox.image_xscale = 0.85
	tutorialBox.image_yscale = tutorialBox.image_xscale
	tutorialBox.fixedAlpha = 1
}