isFirstAttack = true

if (!leftClicked_before)
	exit

with (parWindow)
    if (mouseOnBody)
        exit
		
if (!clickattack_basic_conditions(false))
	exit

leftReleased = 1.5*sec
leftClicked_before = false

alarm[8] = -1