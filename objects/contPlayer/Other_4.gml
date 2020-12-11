alarm[0] = 2
alarm[3] = 2
delta_alarm(6, sec/2)

global.comboCount = 0
global.comboExperience = 0
global.comboBaseExperience = 0

onDialogue = false
qPressTime = 0

if (room == roomBeforeRoad)
	alarm[1] = 5
	
if (!instance_exists(efboxDefenseLock)) {
	var efbox = pointer_null
	
	with (objPlayer)
		efbox = add_effectbox(efboxDefenseLock)
		
	if (efbox != pointer_null) {
		with (efbox)
			event_perform(ev_alarm, 10)
	}
}
	
event_user(1)

with (objPlayer)
	change_hp(global.maxHp)